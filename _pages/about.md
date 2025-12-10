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
excerpt: "Postdoctoral Researcher & Freelance Drummer"
intro: 
  # - excerpt: 'Bridging AI innovation and musical expression'
  - excerpt: 'I bridge scientific research and cultural curiosity, fascinated by complex engineering problems, multidisciplinary environments, and how they translate into arts and music. I am committed to promoting a responsible and effective use of AI.'
feature_row1:
  - image_path: /images/profile.png
    alt: "Research"
    title: "Research"
    excerpt: 'AI for PDEs at Sapienza Università di Roma. Specializing in Physics-Informed Neural Networks, Oncological Hyperthermia, and Medical Robotics.'
    url: "/research/"
    btn_label: "Explore Research"
    btn_class: "btn--primary"
feature_row2:
  - image_path: /images/profile.png
    alt: "Music"
    title: "Music"
    excerpt: 'Drummer & Music Multi-Tool. Session work, production, live performances, and music industry expertise across multiple projects.'
    url: "/music-bio/"
    btn_label: "Explore Music"
    btn_class: "btn--primary"
---

{% include feature_row id="intro" type="center" %}

{% include feature_row id="feature_row1" type="left" %}

{% include feature_row id="feature_row2" type="right" %}