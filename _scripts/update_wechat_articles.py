#!/usr/bin/env python3
"""增量更新公众号「抽样调查之家」·「市调大赛」合集的文章索引。

数据源：微信合集 appmsgalbum 的 f=json 翻页接口（无需微信登录）。
输出：仓库 _data/wechat_articles.json —— 只追加新文章，不删除已有条目。

用法：python3 _scripts/update_wechat_articles.py
退出码：0 = 成功（含"无新增"），1 = 抓取或数据校验失败。
"""

import datetime
import html
import json
import sys
import time
import urllib.parse
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DATA = ROOT / "_data" / "wechat_articles.json"

BASE = "https://mp.weixin.qq.com/mp/appmsgalbum"
BIZ = "MzkyMjA5ODg3NA=="
ALBUM_ID = "2020993093524652037"
ALBUM_URL = f"{BASE}?__biz={BIZ}&action=getalbum&album_id={ALBUM_ID}"
PAGE_SIZE = 10
TZ = datetime.timezone(datetime.timedelta(hours=8))  # 北京时间

HEADERS = {
    "User-Agent": (
        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) "
        "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120 Safari/537.36"
    ),
    "Referer": ALBUM_URL,
}


def fetch_page(params):
    url = BASE + "?" + urllib.parse.urlencode(params)
    req = urllib.request.Request(url, headers=HEADERS)
    with urllib.request.urlopen(req, timeout=30) as resp:
        payload = json.loads(resp.read().decode("utf-8"))
    if payload.get("base_resp", {}).get("ret", 0) != 0:
        raise RuntimeError(f"微信接口返回错误：{payload.get('base_resp')}")
    return payload.get("getalbum_resp", {})


def normalize(item):
    stamp = int(item.get("create_time", 0))
    if stamp <= 0:
        raise RuntimeError("文章缺少 create_time")
    date = datetime.datetime.fromtimestamp(stamp, TZ).strftime("%Y-%m-%d")
    raw_url = html.unescape(item.get("url", "")).split("#")[0]
    url = raw_url.replace("http://", "https://", 1)
    title = item.get("title", "").strip()
    if not title or not url.startswith("https://mp.weixin.qq.com/s?"):
        raise RuntimeError(f"文章字段异常：{item}")
    return {"title": title, "date": date, "url": url}


def fetch_all():
    common = {
        "action": "getalbum",
        "__biz": BIZ,
        "album_id": ALBUM_ID,
        "count": PAGE_SIZE,
        "f": "json",
    }
    collected = {}
    last = None
    for page in range(1, 30):
        params = dict(common)
        if last:
            params["begin_msgid"] = last["msgid"]
            params["begin_itemidx"] = last["itemidx"]
        resp = fetch_page(params)
        batch = resp.get("article_list", [])
        if not batch:
            break
        fresh = 0
        for item in batch:
            pos = int(item.get("pos_num", 0))
            if pos not in collected:
                collected[pos] = normalize(item)
                fresh += 1
        last = {"msgid": batch[-1].get("msgid", ""), "itemidx": batch[-1].get("itemidx", "")}
        if str(resp.get("continue_flag", "0")) == "0" or fresh == 0:
            break
        time.sleep(0.3)
    if not collected:
        raise RuntimeError("合集未返回任何文章，可能是接口变更或被拦截")
    # 按合集序号（新→旧）输出，后续再按日期稳定排序
    return [collected[p] for p in sorted(collected, reverse=True)]


def main():
    if not DATA.exists():
        raise RuntimeError(f"数据文件不存在：{DATA}")

    data = json.loads(DATA.read_text(encoding="utf-8"))
    existing = data.get("articles", [])
    if not isinstance(existing, list):
        raise RuntimeError("_data/wechat_articles.json 的 articles 字段格式异常")

    fetched = fetch_all()
    known = {a.get("url") for a in existing}
    added = [a for a in fetched if a["url"] not in known]

    if not added:
        print(f"无新增文章，索引已是最新（{len(existing)} 篇，最近更新 {data.get('updated')}）。")
        return 0

    merged = sorted(existing + added, key=lambda a: a["date"], reverse=True)
    data["articles"] = merged
    data["updated"] = merged[0]["date"]
    # 元信息只在缺失时补齐，不覆盖站点上已有的自定义文案
    data.setdefault("account", "抽样调查之家")
    data.setdefault("album", "市调大赛")
    data.setdefault("album_url", ALBUM_URL)
    data.setdefault(
        "note",
        "来自微信公众号「抽样调查之家」的「市调大赛」合集，点击标题跳转微信阅读原文。",
    )

    DATA.write_text(
        json.dumps(data, ensure_ascii=False, indent=2) + "\n", encoding="utf-8"
    )
    print(f"新增 {len(added)} 篇：")
    for a in added:
        print(f"  {a['date']} | {a['title']}")
    print(f"总计 {len(merged)} 篇，最近更新 {data['updated']}。")
    return 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except Exception as exc:  # noqa: BLE001 - 脚本需向定时任务直接暴露失败原因
        print(f"更新失败：{exc}", file=sys.stderr)
        sys.exit(1)
