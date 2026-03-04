#import "@preview/glossarium:0.5.10": make-glossary, register-glossary, print-glossary, gls, glspl

#show: make-glossary

#let entries = (
  (
    key: "gps",
    short: "GPS",
    long: "Global Positioning System",
    description: "A satellite-based navigation system providing location and time information.",
  ),
  (
    key: "api",
    short: "API",
    long: "Application Programming Interface",
    description: "A set of rules that allows software applications to communicate with each other.",
  ),
  (
    key: "ml",
    short: "ML",
    long: "Machine Learning",
    description: "A subset of AI that enables systems to learn from data without explicit programming.",
  ),
)

#register-glossary(entries)

= Introduction

On first use, the full form is shown: #gls("gps") improves navigation accuracy.
On subsequent uses, only the abbreviation appears: #gls("gps") is widely used.

You can also use the plural form with #glspl("api") for software integration.

The field of #gls("ml") has grown rapidly in recent years.

= Glossary

#print-glossary(entries)
