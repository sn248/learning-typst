#let pmap(body) = {
  set page(paper: "us-letter", margin: 1in)
  set text(font: "Times New Roman", size: 12pt)
  set heading(numbering: "1.1")

  show heading.where(level: 1, outlined: true): it => {
    pagebreak()
    it
  }


  show figure.caption: set align(left)

  show figure.where(kind: image): it => block(width: 100%)[
    #it.caption
    #align(center)[#it.body]
  ]

  show figure.where(kind: table): it => block(width: 100%)[
    #it.caption
    #it.body
  ]

  align(center)[#heading(outlined: false, bookmarked: true, numbering: none)[Table of Contents]]

  outline(title: none)

  pagebreak()
  align(center)[#heading(outlined: false, bookmarked: true, numbering: none)[List of Figures]]

  outline(title: none, target: figure.where(kind: image))

  pagebreak()
  align(center)[#heading(outlined: false, bookmarked: true, numbering: none)[List of Tables]]

  outline(title: none, target: figure.where(kind: table))
  
  show bibliography: it => {
    it
  }

  body
}
