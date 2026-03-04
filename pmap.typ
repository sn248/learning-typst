// testing typst 

#import "pmap.typ": pmap, gls, glspl, print-glossary

#let my-glossary = (
  (
    key: "pk",
    short: "PK",
    long: "pharmacokinetics",
    description: "The study of how a drug is absorbed, distributed, metabolized, and excreted by the body.",
  ),
)

#show: pmap.with(glossary: my-glossary)

#heading(numbering: none)[Glossary]

#print-glossary(my-glossary)

= Introduction

This is a basic example of *typesetting* with *Typst*. 
Check out this math formula: $ v(t) = lim_(t -> oo) integral_t^oo c dot sqrt(t^2) dif t $

== Sub-section
= Methods
== Sub-section
= Results
== Sub-section
= Conclusions
== Sub-section
=== Sub-section
==== Sub-section
===== Sub-section
====== Sub-section

= Adding Lists
== Adding a numbered list
+ The climate
+ The topography
+ The geology
  + sub-bullet
    + sub-sub bullet

== Adding a bulleted list
- The climate
- The topography
- The geology
  - sub-bullet
      - sub-sub bullet


= Adding a figure
The caption (at the top) and the description (at the bottom) should be left-aligned and should span the width of the page.
// Adding a figure - this is a comment
#block(width: 100%)[
  #figure(
    image("./glaciers.png", width: 50%),
    caption: [
      _Glaciers_ form an important part
      of the earth's climate system. 
    ],
  )<glaciers>
  #align(left)[This is the figure description. It spans the full page width and provides additional context about the glaciers shown above.]
]


A picture of melting glaciers is in @glaciers. This is also described in @hock2005glacier

= Adding an equation

== Inline equation
The equation $Q = rho A v + C$ defines the glacial flow rate.

== Equation block
A block of equations to be added.

$ f(x) &= x^2 + 2x + 1 \
       &= (x + 1)^2 $ <parabola>

As shown in @parabola (the reference to the equation block)...


= Adding a table
The table caption (at the top) and the description (at the bottome) should be left-aligned and should span the width of the page.
// Adding a table
#block(width: 100%)[
  #figure(
    table(
      columns: (1fr, auto, auto),
      inset: 11pt,
      align: horizon,
      table.header(
        [], [*Volume*], [*Parameters*],
      ),
      $pi h (D^2 - d^2) / 4$,         // make sure to have no space after and before $ to avoid numbering
      [
        $h$: height \
        $D$: outer radius \
        $d$: inner radius
      ],
      $sqrt(2) / 12 a^3$,             // make sure to have no space after and before $ to avoid numbering
      [$a$: edge length]
    ),
    caption: [Volume formulas for geometric solids. ],
  )
  #align(left)[This is the table description. It provides additional context about the volume formulas listed above. This is also left-aligned and spans the width of the page.]
]

= Adding a glossary term
The #gls("pk") are modeled using a 1-compartment model

#bibliography("works.bib")
