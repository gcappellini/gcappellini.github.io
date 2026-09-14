---
layout: splash
permalink: /
header:
  overlay_color: "#333"
  overlay_filter: "0.5"
  overlay_image: /images/profile.png
  actions:
    - label: "Research"
      url: "/research/"
    - label: "Music"
      url: "/music-bio/"
excerpt: "Researcher (AI, Medical Physics) and Musician."
intro: 
  - excerpt: 'I bridge scientific rigor and cultural curiosity, with an inner call to develop innovative solutions to complex problems. I thrive in multidisciplinary environments as a people-gatherer, aiming to unlock and amplify expressiveness for everyone involved.'
feature_row1:
  - image_path: research-placeholder.jpg
    alt: "Research"
    title: "Research"
    excerpt: 'Researcher in AI & Medical Physics specializing in Physics-Informed Neural Networks (PINNs) for solving differential equations to simulate physical reality in real-time.'
    url: "/research/"
    btn_label: "Explore Research"
    btn_class: "btn--primary"
feature_row2:
  - image_path: music-placeholder.jpg
    alt: "Music"
    title: "Music"
    excerpt: 'Drummer, producer and music director. Focused on building the "pocket"—a reliable rhythmic foundation that drives collective expression.'
    url: "/music-bio/"
    btn_label: "Explore Music"
    btn_class: "btn--primary"
---

{% include feature_row id="intro" type="center" %}

{% include feature_row id="feature_row1" type="left" %}

{% include feature_row id="feature_row2" type="right" %}