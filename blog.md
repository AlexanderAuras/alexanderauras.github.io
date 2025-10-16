---
layout: standard
title: Blog
---

<link rel="stylesheet" href="{{ "blog.css" | relative_url }}">
<h1>Blog</h1>

{% assign MONTH_NAMES = "???,Jan.,Feb.,Mar.,Apr.,May.,Jun.,Jul.,Aug.,Sep.,Oct.,Nov.,Dec." | split: "," %}
{% assign all_years = site.posts | map: "year" %}
{% assign unique_years = "" | split: "," %}
{% for year in all_years %}
  {% unless unique_years contains year %}
    {% assign unique_years = unique_years | push: year %}
  {% endunless %}
{% endfor %}
{% assign unique_years = unique_years | sort_natural | reverse %}

{% for year in unique_years %}
  <h2>{{ year }}</h2>
  <ul class="post-list">
    {% assign post_by_date = site.posts | where: "year", year | sort: "month" | sort: "year" | reverse %}
    {% for entry in post_by_date %}
    <li class="post-item">
      {% for item in MONTH_NAMES %}
        {% if forloop.index0 == entry.month %}
          {% assign month_name = item %}
          {% break %}
        {% endif %}
      {% endfor %}
      <img class="post-image" src="{{ entry.image }}"/>
      <div class="post-info">
        <h3 class="post-title"><a href="{{ entry.url }}">{{ entry.title }}</a></h3>
        <div class="post-date">{{ entry.day }}. {{ month_name }}</div>
        <div class="post-desc">{{ entry.content | strip_html | truncatewords: 40 }}&nbsp;<a href="{{ entry.url }}">Read&nbsp;more</a></div>
      </div>
    </li>
    {% endfor %}
  </ul>
{% endfor %}
