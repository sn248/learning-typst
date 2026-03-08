#set heading(numbering: "1.")
#show heading: it => {
  context {
    if counter(heading).get().first() == 1 {
      pagebreak()
    }
  }
  it
}
= First
= Second
