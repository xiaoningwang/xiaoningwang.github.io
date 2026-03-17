---
layout: archive
title: "测试教学内容"
permalink: /test-teaching/
author_profile: true
---

{% include base_path %}

## 测试 site.teaching 集合

{% for post in site.teaching %}
  <div style="margin-bottom: 20px; padding: 15px; background-color: #f8f9fa; border-radius: 8px;">
    <h3>{{ post.title }}</h3>
    <p>Type: {{ post.type }}</p>
    <p>Path: {{ post.path }}</p>
    <p>URL: {{ post.url }}</p>
  </div>
{% endfor %}
