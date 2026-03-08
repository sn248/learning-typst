#import "@preview/glossarium:0.5.10" as glossarium

#let make-glossary = glossarium.make-glossary
#let register-glossary = glossarium.register-glossary
#let print-glossary = glossarium.print-glossary
#let gls = glossarium.gls
#let glspl = glossarium.glspl

#let pmap(
  title: "Document Title",
  project: "Project Name",
  company: "Company Name",
  status: "Draft",
  version: "1.0",
  authors: (),
  contact: "",
  website: "",
  date: none,
  logo: none,
  confidentiality_statement: "CONFIDENTIAL",
  version_history: (),
  glossary: (),
  body
) = {
  set page(
    paper: "us-letter",
    margin: (top: 1.25in, bottom: 1in, left: 1in, right: 1in),
    header: context {
      if counter(page).get().at(0) > 1 {
        block(width: 100%, stroke: (bottom: 0.5pt + black), inset: (bottom: 5pt))[
          #set text(size: 9pt, weight: "bold")
          #grid(
            columns: (1fr, 1fr, 1fr),
            align(left)[#upper(company)],
            align(center)[#upper(project)],
            align(right)[#upper(status)]
          )
        ]
      }
    },
    footer: context {
      if counter(page).get().at(0) > 1 {
        block(width: 100%, inset: (top: 5pt))[
          #set text(size: 9pt)
          #grid(
            columns: (1fr, 1fr, 1fr),
            align(left)[],
            align(center)[#upper(confidentiality_statement)],
            align(right)[Page #counter(page).display() of #counter(page).final().at(0)]
          )
        ]
      }
    }
  )

  set text(font: "Times New Roman", size: 12pt)
  set heading(numbering: "1.1", bookmarked: true)
  set math.equation(numbering: "(1)")

  // Title Page
  page(align(center)[
    #if logo != none {
      set image(width: 3in)
      logo
      v(1em)
    } else {
      v(4em)
    }

    #text(size: 14pt, weight: "bold")[#upper(title)]
    #v(2em)

    #block(width: 80%)[
      #set align(left)
      #set text(size: 11pt)
      #grid(
        columns: (1fr, 2fr),
        row-gutter: 1em,
        [Date Issued:], [#if date != none { date } else { datetime.today().display("[day] [month repr:short] [year]") }],
        [Version:], [#version],
        [Author:], [#authors.join(", ")],
        [Contact:], [#contact],
        [Website:], [#website],
      )
    ]

    #v(3em)

    // Confidentiality Box
    #rect(
      width: 90%,
      inset: 15pt,
      fill: rgb("#f0f0f0"),
      stroke: 0.5pt + black,
    )[
      #set align(center)
      #set text(size: 10pt, weight: "bold")
      WARNING
      #v(0.5em)
      #set text(weight: "regular")
      This document contains confidential information.
      Unauthorized disclosure or distribution is strictly prohibited.
    ]

    #v(3em)

    // Version History
    #if version_history.len() > 0 {
      align(left)[#text(size: 12pt, weight: "bold")[Version History]]
      v(0.5em)
      table(
        columns: (auto, auto, auto, 1fr),
        inset: 8pt,
        align: horizon,
        fill: (col, row) => if row == 0 { rgb("#e0e0e0") } else { none },
        [*Version*], [*Date*], [*Author*], [*Changes*],
        ..version_history.map(vh => (vh.version, vh.date, vh.author, vh.changes)).flatten()
      )
    }
  ])

  show: make-glossary
  register-glossary(glossary)

  show heading.where(level: 1, outlined: true): it => {
    context {
      if it.numbering != none and counter(heading).get().first() == 1 {
        pagebreak()
      }
    }
    it
  }

  show figure.caption: set align(left)

  show figure.where(kind: image): it => [
    #place(hide(heading(outlined: false, bookmarked: true, numbering: none, level: 2)[#it.caption.body]))
    #block(width: 100%)[
      #it.caption
      #align(center)[#it.body]
    ]
  ]

  show figure.where(kind: table): it => [
    #place(hide(heading(outlined: false, bookmarked: true, numbering: none, level: 2)[#it.caption.body]))
    #block(width: 100%)[
      #it.caption
      #it.body
    ]
  ]

  // Table of Contents styling
  align(center)[#text(fill: rgb(0, 0, 180))[#heading(outlined: false, bookmarked: true, numbering: none)[TABLE OF CONTENTS]]]
  show outline.entry: it => text(fill: rgb(0, 0, 180))[#it]
  outline(title: none, indent: auto)

  pagebreak()
  align(center)[#text(fill: rgb(0, 0, 180))[#heading(outlined: false, bookmarked: true, numbering: none)[LIST OF FIGURES]]]
  outline(title: none, target: figure.where(kind: image))

  pagebreak()
  align(center)[#text(fill: rgb(0, 0, 180))[#heading(outlined: false, bookmarked: true, numbering: none)[LIST OF TABLES]]]
  outline(title: none, target: figure.where(kind: table))
  
  show bibliography: it => {
    it
  }

  pagebreak(weak: true)
  body
}
