
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Guglielmo Cappellini"
#let locale-catalog-page-numbering-style = context { "Guglielmo Cappellini - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in June 2025"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-section-titles-font-size = 1.4em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 79, 144)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 79, 144)
#let design-colors-connections = rgb(0, 79, 144)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-font-family = "Source Sans 3"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = true
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "Source Sans 3"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "Source Sans 3"
#let design-header-name-font-size = 30pt
#let design-header-name-bold = true
#let design-header-connections-font-family = "Source Sans 3"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = true
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Guglielmo Cappellini

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Rome, Italy],
  [#box(original-link("mailto:guglielmo.cappellini@gmail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)guglielmo.cappellini\@gmail.com])],
  [#box(original-link("tel:+39-366-535-9028")[#fa-icon("phone", size: 0.9em) #h(0.05cm)366 535 9028])],
  [#box(original-link("https://linkedin.com/in/guglielmo-cappellini")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)guglielmo-cappellini])],
  [#box(original-link("https://github.com/gcappellini")[#fa-icon("github", size: 0.9em) #h(0.05cm)gcappellini])],
  [#box(original-link("https://orcid.org/0000-0002-4247-8980")[#fa-icon("orcid", size: 0.9em) #h(0.05cm)0000-0002-4247-8980])],
  [#box(original-link("https://researchgate.net/profile/Guglielmo-Cappellini-2")[#fa-icon("researchgate", size: 0.9em) #h(0.05cm)Guglielmo-Cappellini-2])],
  [#box(original-link("https://scholar.google.com/citations?user=Guglielmo-Cappellini")[#fa-icon("graduation-cap", size: 0.9em) #h(0.05cm)Google Scholar])],
)
#connections(connections-list)



== Education


// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[PhD]],
  middle-content: [
    #strong[National PhD Program, PON R&I 2014-2020], AI for Healthcare
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [\"AI-based solution methods for PDEs with application to oncological hyperthermia\". Tutored by prof. M. Vendittelli \(Medical Robotics\), co-funded by Medlogix Srl.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Created and maintain a #link("https://github.com/gcappellini/pinns-bioheat-experiments.git")[GitHub repository] for the PINNs-based implementation of a multiple-model adaptive observer for bio-heat transfer;],[Two-papers work presented at IEEE CDC 2023, Singapore;],[Tutor of \"Fundamentals of Automation\", AY 2022\/2023 and 2024\/2025;],[Supervisor for 3 final projects of \"Medical Robotics\", and a BSc thesis student;],[#link("https://hdl.handle.net/11573/1740410")[PhD thesis] defended on May 30th, 2025 with Excellent classification.],)
  ],
  right-content: [
    Rome, IT

Jan 2022 – Dec 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[MSc]],
  middle-content: [
    #strong[Sapienza Università di Roma], Nuclear Engineering
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Thesis: \"Study and characterization of radiolabeled nanovectors for application in precision molecular medicine\", EQF 7, 108\/110.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Studies on Nuclear Physics, Thermodynamics, and Radiation Protection;],[Supervised by prof. R. Remetti \(Radiation Protection for Nuclear Medicine\).],)
  ],
  right-content: [
    Rome, IT

Jan 2018 – May 2021
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[BSc]],
  middle-content: [
    #strong[Sapienza Università di Roma], Energy and Nuclear Engineering
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Thesis: \"Radionuclides production and medical applications\", EQF 6.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Supervised by prof. L. Ferroni \(Nuclear Energy Applications\).],)
  ],
  right-content: [
    Rome, IT

Sept 2015 – Nov 2017
  ],
)



== Experience


#two-col-entry(
  left-content: [
    #strong[Department of Computer, Automation and Management Engineering \(DIAG\), Sapienza Università di Roma], PostDoc
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Development, innovation and certification of medical and non-medical devices for healthcare \(Rome Technopole Spoke 6, FP4\). Supervised by prof. M. Vendittelli.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Extending the research on AI-based solution methods for PDEs with application to oncological hyperthermia;],[AI-based methods for real-time simulation of deformable tissues with application to interactive virtual reality for medical training. Preliminary results under submission;],[Interest on graph convolutional neural networks \(GNNs\) for the study of complex systems, with application to the analysis of multi-omics data.],)
  ],
  right-content: [
    Rome, IT

Jan 2025 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Department of Radiation Oncology, Amsterdam UMC Hospital], Visiting PhD Student
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Research activities related to the study of hyperthermia \(HT\) techniques and its clinical application, to investigate and validate new solutions to improve the real time controls and to estimate temperature at depth in superficial HT, and to participate in other ongoing projects in the same research area.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Experimental emulation of HT treatment: a system to simulate perfusion, a muscle-equivalent phantom, a superficial EM applicator, and the thermometry system;],[Supervised by Research Physicist H. Crezee and Associate Professor H. P. Kok.],)
  ],
  right-content: [
    Amsterdam, NL

Dec 2023 – May 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Department of Nuclear Medicine, Policlinico Umberto I, Rome], MSc Thesis Intern
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [\"99mTc-labeled Keratin-coated gold nanoparticles for selective anticancer photothermal therapy\" \(#link("https://doi.org/10.1364/OMP.2021.OTu1E.5")[Frantellizzi, De Vincentis et. al.]\)])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Research on Radiopharmacology, Nanomedicine, and Nanophotonics;],[Modeling and simulation of microfluidic devices for radiolabeled nanoparticles.],)
  ],
  right-content: [
    Rome, IT

Dec 2020 – May 2021
  ],
)



== Projects



#one-col-entry(
  content: [
    #strong[AMD‑STITCH: Sapienza Information-Based Technology InnovaTion Center for Health \(#link("https://doi.org/10.1007/s42979-024-02757-w")[Reference]\)]

    #v(-design-text-leading)
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Ontology-based data preparation on electronic medical records of Italian diabetes patients within a 13 years timeframe])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Data modeling and data cleaning, providing effective techniques for setting up a unified and shared database;],[Database management and SQL implementation for unified data systems;],[Working within secure data environments with large-scale healthcare datasets;],[Gaining experience with relational databases and clinical data structures.],)
  ],
)



== Skills


#one-col-entry(
  content: [#strong[Programming & Scientific Computing:] Expert in Python for data analysis and AI \(PyTorch, NumPy, SciPy, pandas\); working knowledge of C++; version control with Git\/GitHub; familiar with reinforcement learning, containerization \(Docker\), and high-performance computing environments; good understanding of Web, app development, and DevOps]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Mathematics:] Specialized in computational methods for partial differential equations; strong foundation in numerical analysis, calculus, linear algebra, and optimization techniques for machine learning applications]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Clinical Data & Terminologies:] Developing knowledge of controlled clinical terminologies \(ICD-10, SNOMED CT, dm+d\); experience working with large-scale healthcare datasets; strong foundation in data standardization and clinical data structures]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Languages:] English \(fluent, IELTS Academic: 7.5\), Spanish, Italian \(native\)]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Teaching & Mentorship:] Passionate educator with formal pedagogical training \(Percorso formativo 24 CFU in anthropological-psychological-pedagogical disciplines and teaching methodologies\); committed to clear communication of complex technical concepts across disciplines]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Professional Qualifications:] Licensed Professional Industrial Engineer \(Abilitazione per l'esercizio della professione di Ingegnere Industriale, Esame di Stato Sez. A\)]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Interests:] Interested in phenomics and multi-omics data; experienced in coordinating people with different backgrounds on the same goal; active in the academic community with a focus on AI applications for healthcare; interdisciplinary research background bridging engineering and medical physics]
)


== Publications


#two-col-entry(
  left-content: [
    #strong[Adaptive Estimation of the Pennes' Bio-Heat Equation - I: Observer Design]

  ],
  right-content: [
    Dec 2023
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Cristofaro, A., Cappellini, G., Staffetti, E., Trappolini, G., Vendittelli, M.

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1109/CDC49753.2023.10383905")[10.1109/CDC49753.2023.10383905] (2023 62nd IEEE Conference on Decision and Control \(CDC\), Singapore)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Adaptive Estimation of the Pennes' Bio-Heat Equation - II: A NN-Based Implementation for Real-Time Applications]

  ],
  right-content: [
    Dec 2023
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Cappellini, G., Trappolini, G., Staffetti, E., Cristofaro, A., Vendittelli, M.

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1109/CDC49753.2023.10384113")[10.1109/CDC49753.2023.10384113] (2023 62nd IEEE Conference on Decision and Control \(CDC\), Singapore)])

#v(design-entries-vertical-space-between-entries)
#one-col-entry(content:[
  #strong[Adaptive Estimation of Pennes' Bio-Heat Equation: Observer Design and PINNs-based Implementation]

  #v(-design-text-leading)
  #v(design-highlights-top-margin);Cappellini, G., Cristofaro, A., De Santis, E., Staffetti, E., Trappolini, G., Vendittelli, M.

#v(design-highlights-top-margin - design-text-leading)submitted to IEEE Transactions on Control Systems Technology])



== Extracurricular Activities


#one-col-entry(
  content: [- Professional drummer and musical director with extensive performance background across multiple genres;],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Early experiences in orchestra; co-founded bands including \"#link("https://open.spotify.com/artist/46X75UZxkrPJP2i1QDS4Cj?si=aldenDhPSReEZyBCH509Cw")[Subba and the Roots]\" and \"#link("https://open.spotify.com/artist/5HhqNWiVXIimZrNwYLQ2FV?si=sJqBMnANQUS5EiWF8GO1oA")[La Situa]\"; secured national touring grant \(NuovoIMAIE 2018, €15k\); formal jazz studies with renowned drummers \(M. Guiliana, R. Gatto, M. Campanale, D. Panza, G. de Rienzo, F. Mendolia\);],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Current member of \"#link("https://www.instagram.com/dimensionebrama/")[Dimensione Brama]\", a multidisciplinary ensemble combining theatrical and musical performance \(12th place finalists in XFactor18, 2024\);],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- More than 500 concerts and 3 albums released; experience in studio recording and production. #link("https://open.spotify.com/playlist/56lRBoaSfyJIFBDWltWv4t?si=e98c19efefb94af7")[My hands on these!]],
)


