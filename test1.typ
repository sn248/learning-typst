#set page(paper: "us-letter", margin: 1in)
#set text(font: "Times New Roman", size: 12pt)
#show figure.caption: set align(left)
#show figure: it => block(width: 100%)[
  #it.caption
  #align(center)[#it.body]
]



= List of Figures

#outline(
  title: none,
  target: figure.where(kind: image),
)

= Hello Typst in Positron!

This is a basic example of *typesetting* with **Typst**. 
Check out this math formula: $ v(t) = lim_(t -> oo) integral_t^oo c dot sqrt(t^2) dif t $

== Sub-section

+ The climate
+ The topography
+ The geology


#figure(
  image("./glaciers.png", width: 50%),
  caption: [
    _Glaciers_ form an important part
    of the earth's climate system.
  ],
)<glaciers>

A picture of melting glaciers is in @glaciers. This is also described in @hock2005glacier


The equation $Q = rho A v + C$ defines the glacial flow rate.


#bibliography("works.bib")
