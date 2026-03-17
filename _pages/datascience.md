---
layout: archive
title: "数据科学导论"
permalink: /teaching/datascience/
author_profile: true
---

{% include base_path %}

## 课程介绍

《数据科学导论》课程定位培养学生学习数据科学分析的基本原理，掌握数据分析的基本思路、常见的分析方法以及应用场景，学会数据分析及可视化的方法，相关算法原理介绍和算法应用需求导向对接的垂直化课程体系设计，培养学生具备利用数据科学方法解决传媒大数据相关问题的能力。

## 课程目标

- 理解数据科学的基本概念和方法论
- 掌握数据收集、清洗、分析和可视化的基本技能
- 了解机器学习和统计学习的核心算法
- 培养利用数据科学方法解决实际问题的能力
- 建立数据驱动的思维方式

## 课程大纲

### 第一部分：数据科学基础
- 数据科学概述
- 数据收集与预处理
- 数据可视化基础
- 描述性统计分析

### 第二部分：统计学习方法
- 线性回归与分类
- 重抽样方法
- 模型选择和正则化
- 决策树与组合学习

### 第三部分：高级主题
- 支持向量机
- 神经网络基础
- 无监督学习
- 推荐算法
- 文本挖掘
- 社交网络分析
- 并行与分布式计算

## 课程资源

### 课程幻灯片
- [支持向量机(SVM)]({{ '/files/ch9-支持向量机.pdf' | prepend: site.baseurl }})
- [数据智慧和十大原则]({{ '/files/数据智慧和十大原则.pdf' | prepend: site.baseurl }})
- [数据分析报告基础]({{ '/files/数据分析报告基础.pdf' | prepend: site.baseurl }})
- [无监督学习]({{ '/files/ch10-无监督学习.pdf' | prepend: site.baseurl }})和[推荐算法]({{ '/files/ch11-推荐算法.pdf' | prepend: site.baseurl }})
- [文本分析]({{ '/files/ch12-文本挖掘.pdf' | prepend: site.baseurl }})和[社交网络分析]({{ '/files/ch13-社交网络分析.pdf' | prepend: site.baseurl }})
- [并行和分布式计算]({{ '/files/ch15-并行分布式和云计算.pdf' | prepend: site.baseurl }})

### 学习资料
- [数据科学的学习资料](https://xiaoningwang.github.io/links/)

## 课程讲稿

{% for post in site.teaching %}
{% if post.type == "数据科学导论" %}
<div style="margin-bottom: 20px; padding: 15px; background-color: #f8f9fa; border-radius: 8px;">
  <h3><a href="{{ base_path }}{{ post.url }}">{{ post.title }}</a></h3>
  <p style="color: #666; margin-top: 5px;">{{ post.date | date: "%Y年%m月%d日" }}</p>
  <p style="margin-top: 10px;">{{ post.excerpt | strip_html | truncatewords: 50 }}</p>
  <a href="{{ base_path }}{{ post.url }}" style="display: inline-block; margin-top: 10px; padding: 5px 15px; background-color: #3498db; color: white; text-decoration: none; border-radius: 4px;">查看完整讲稿</a>
</div>
{% endif %}
{% endfor %}

## 优秀作业展示

- [2022数据科学导论优秀报告展示合集](https://mp.weixin.qq.com/s/Bx44Q8GzRDstYioOoqPA5Q)
- [统计与真理视频合集](https://mp.weixin.qq.com/s/lC_-h91Gc03CJxf9rSzF4w)
- [调查与计算广告分析报告合集](https://mp.weixin.qq.com/s/YfMDOMCdlsp6op9VdrzA2w)
- [合集｜2025春季数据科学导论优秀作品](https://mp.weixin.qq.com/s/um8W29nnSTC9K7YuDsgDdQ)

- [合集｜2024春季数据科学导论优秀作品](https://mp.weixin.qq.com/s/DxO-OvoTLsd2CQSiVVpHHg)



## 智能助教

为提升学习体验，本课程配备 **Scholar Hero** 智能助教，支持课堂演示、代码示例和问答反馈。

## 联系我们

如果您对课程有任何问题或建议，欢迎联系课程负责人：

- 王小宁 副教授
- 邮箱：sdwangxiaoning@cuc.edu.cn
- 办公地点：中国传媒大学 46-303