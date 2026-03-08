#let my-glossary = (
  (short: "PK", description: "Pharmacokinetics"),
  (short: "aDME", description: "Absorption, Distribution..."),
  (short: "PD", description: "Pharmacodynamics"),
)
#let sorted-glossary = my-glossary.sorted(key: e => e.short.lower())
#for entry in sorted-glossary [
  #entry.short - #entry.description \
]
