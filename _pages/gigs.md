---
layout: single
title: "Gigs & Shows"
permalink: /gigs/
author_profile: true
---

<style>
.gig-entry {
  margin-bottom: 1em;
  padding: 0.5em 0;
  border-bottom: 1px solid #eee;
}

.gig-date {
  font-weight: bold;
  color: #666;
}

.gig-band {
  color: #c8102e;
  font-weight: 600;
}

.featured-gig {
  background-color: #fff9e6;
  padding: 0.5em;
  border-left: 3px solid #c8102e;
  margin-bottom: 0.5em;
}

details {
  margin-bottom: 1.5em;
  border: 1px solid #ddd;
  border-radius: 4px;
  padding: 0.5em;
}

summary {
  cursor: pointer;
  font-weight: bold;
  font-size: 1.2em;
  padding: 0.5em;
  background-color: #f5f5f5;
  margin: -0.5em;
  margin-bottom: 1em;
}

summary:hover {
  background-color: #e8e8e8;
}

.upcoming-section {
  background-color: #f0f8ff;
  padding: 1em;
  border-radius: 4px;
  margin-bottom: 2em;
}
</style>

{% assign today = "now" | date: "%Y-%m-%d" %}
{% assign gigs_by_year = site.data.gigs.gigs | group_by_exp: "gig", "gig.date | date: '%Y'" | sort: "name" | reverse %}
{% assign upcoming = site.data.gigs.gigs | where_exp: "gig", "gig.date >= today" | sort: "date" %}
{% assign featured = site.data.gigs.gigs | where: "featured", true | sort: "date" | reverse %}

# Gigs & Shows

{% if upcoming.size > 0 %}
<div class="upcoming-section">
## Upcoming

{% for gig in upcoming %}
<div class="gig-entry">
  <span class="gig-date">{{ gig.date | date: "%B %d, %Y" }}</span> • 
  <span class="gig-band">{{ gig.band }}</span>
  {% if gig.event %} • {{ gig.event }}{% endif %}<br>
  📍 {{ gig.location }}, {{ gig.city }} ({{ gig.state }})
</div>
{% endfor %}
</div>
{% else %}
<div class="upcoming-section">
## Upcoming

No upcoming shows scheduled. Check back soon!
</div>
{% endif %}

---

{% if featured.size > 0 %}
## Featured Performances

{% for gig in featured %}
<div class="featured-gig">
  <strong>{{ gig.date | date: "%B %Y" }}</strong> • <span class="gig-band">{{ gig.band }}</span><br>
  {% if gig.event %}<em>{{ gig.event }}</em><br>{% endif %}
  📍 {{ gig.location }}, {{ gig.city }}
</div>
{% endfor %}

---
{% endif %}

## Past Performances

Over {{ site.data.gigs.gigs.size }} concerts across Italy since 2013.

{% for year_group in gigs_by_year %}
{% assign year_gigs = year_group.items | where_exp: "gig", "gig.date < today" %}
{% if year_gigs.size > 0 %}
<details>
  <summary>{{ year_group.name }} ({{ year_gigs.size }} shows)</summary>
  
  {% for gig in year_gigs %}
  <div class="gig-entry">
    <span class="gig-date">{{ gig.date | date: "%b %d" }}</span> • 
    <span class="gig-band">{{ gig.band }}</span>
    {% if gig.event %} • {{ gig.event }}{% endif %}<br>
    📍 {{ gig.location }}, {{ gig.city }} ({{ gig.state }})
  </div>
  {% endfor %}
</details>
{% endif %}
{% endfor %}

---

Want to book me for your event? [Get in touch](/contact/)