---
layout: standard
title: About Me
---

<link rel="stylesheet" href="{{ "index.css" | relative_url }}">

# About me

I'm a PhD student and research associate at the University of Siegen at the groups for Computer Vision (lead by [Prof. Michael M&ouml;ller](https://scholar.google.com/citations?user=sxzdAGUAAAAJ&hl=de)) and Visual Computing (lead by [Prof. Jovita Lukasik](https://jovitalukasik.github.io/)). My research concerns the usage of machine learning approaches for inverse problems in imaging, with a focus on hybrid methods, combining the mathematical guarantess of classical, variational methods with the performance of modern, deep learning based solutions. Another focus is the use of methods of the field of neural architecture search to find promising solution candidates for these problems.

## Teaching & Supervision

I supervise the bachelor courses "Digitale Bildverarbeitung" and "Digitale Bildverarbeitung - Praktikum", and the master course "Unsupervised Deep Learning". For everything related to these courses please refer to the Moodle-Pages or contact me via [Mattermost](https://chat.rdi.zimt.uni-siegen.de/) (@alexander.auras1) or [E-Mail](mailto:alexander.auras@uni-siegen.de).

For supervision of bachelor/master theses or Studienarbeiten please refer to the Websites of the [Computer Vision group](https://www.vsa.informatik.uni-siegen.de/en/student-projects-0) and the Visual Computing group.

{% assign MONTH_NAMES = "???,Jan.,Feb.,Mar.,Apr.,May.,Jun.,Jul.,Aug.,Sep.,Oct.,Nov.,Dec." | split: "," %}
<h2>News</h2>
<ul>
  {% assign news_by_date = site.news | sort: "day" | sort: "month" | sort: "year" | reverse %}
  {% for entry in news_by_date limit:5 %}
  <li class="news-item">
    {% for item in MONTH_NAMES %}
      {% if forloop.index0 == entry.month %}
        {% assign month_name = item %}
        {% break %}
      {% endif %}
    {% endfor %}
    <strong>{{ entry.day }}. {{ month_name }} {{ entry.year }}: </strong>{{ entry.content | remove: '<p>' | remove: '</p>' }}
  </li>
  {% endfor %}
</ul>
<h2>Recent Publications</h2>
<ul>
  {% assign pubs_by_date = site.publications | sort: "month" | sort: "year" | reverse %}
  {% for entry in pubs_by_date limit:3 %}
  <li class="publication-item">
    {% for item in MONTH_NAMES %}
      {% if forloop.index0 == entry.month %}
        {% assign month_name = item %}
        {% break %}
      {% endif %}
    {% endfor %}
    <strong>{{ month_name }} {{ entry.year }}: </strong>
    <strong style="color: var(--text-color-emph)">{{ entry.title | remove: '<p>' | remove: '</p>' }}</strong><br/>
    <span>{{ entry.content | remove: '<p>' | remove: '</p>' }}</span>
  </li>
  {% endfor %}
</ul>
