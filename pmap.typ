#import "@preview/glossarium:0.5.10": make-glossary, register-glossary, print-glossary, gls, glspl

#let pmap(glossary: (), body) = {
  set page(paper: "us-letter", margin: 1in)
  set text(font: "Times New Roman", size: 12pt)
  set heading(numbering: "1.1", bookmarked: true)

  show: make-glossary
  register-glossary(glossary)

  show heading.where(level: 1, outlined: true): it => {
    pagebreak()
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

  align(center)[#text(fill: rgb(0, 0, 180))[#heading(outlined: false, bookmarked: true, numbering: none)[TABLE OF CONTENTS]]]

  show outline.entry: it => text(fill: rgb(0, 0, 180))[#it]

  outline(title: none)

  pagebreak()
  align(center)[#text(fill: rgb(0, 0, 180))[#heading(outlined: false, bookmarked: true, numbering: none)[LIST OF FIGURES]]]

  outline(title: none, target: figure.where(kind: image))

  pagebreak()
  align(center)[#text(fill: rgb(0, 0, 180))[#heading(outlined: false, bookmarked: true, numbering: none)[LIST OF TABLES]]]

  outline(title: none, target: figure.where(kind: table))
  
  show bibliography: it => {
    it
  }

  body
}
