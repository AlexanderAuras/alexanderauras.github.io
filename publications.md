---
layout: standard
title: Publications
---

<link rel="stylesheet" href="{{ "publications.css" | relative_url }}">
<h1>Publications</h1>

{% assign all_years = site.publications | map: "year" %}
{% assign unique_years = "" | split: "," %}
{% for year in all_years %}
  {% unless unique_years contains year %}
    {% assign unique_years = unique_years | push: year %}
  {% endunless %}
{% endfor %}
{% assign unique_years = unique_years | sort_natural | reverse %}

{% for year in unique_years %}
  <h2>{{ year }}</h2>
  <ul class="publication-list">
    {% assign pubs_by_date = site.publications | where: "year", year | sort: "month" | sort: "year" | reverse %}
    {% for entry in pubs_by_date %}
    <li class="publication-item">
      <img class="publication-image" src="{{ entry.image }}"/>
      <div class="publication-info">
        <h3 class="publication-title"><a href="{{ entry.url }}">{{ entry.title }}</a></h3>
        <ul class="publication-author-list">
        {% for author in entry.authors %}
          {% if author.url %}
          <li class="publication-author{% if author.name == site.author %} publication-author-me{% endif %}"><a href="{{ author.url }}">{{ author.name | replace: " ", "&nbsp;" }}</a></li>
          {% else %}
          <li class="publication-author{% if author.name == site.author %} publication-author-me{% endif %}">{{ author.name | replace: " ", "&nbsp;" }}</li>
          {% endif %}
        {% endfor %}
        </ul>
        <span class="publication-venue">{{ entry.venue | replace: " ", "&nbsp;" }}</span>
        <span class="publication-desc">{{ entry }}</span>
        <ul class="publication-link-list">
        {% for link in entry.links -%}
          <li class="publication-link"><a href="{{ link[1] }}">[{{ link[0] }}]</a> </li>
        {%- endfor %}
        </ul>
      </div>
    </li>
    {% endfor %}
  </ul>
{% endfor %}
