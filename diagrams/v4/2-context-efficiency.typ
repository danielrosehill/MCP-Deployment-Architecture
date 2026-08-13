#set page(width: 16in, height: 9in, margin: 0.42in, fill: rgb("#082a50"))
#set text(font: "DejaVu Sans", fill: white, size: 14pt)

#let box(title, body, accent: rgb("#52c7ff"), height: auto) = block(
  width: 100%, height: height, fill: rgb("#0d3a68"), stroke: 1.4pt + accent,
  radius: 7pt, inset: 14pt,
  [#text(size: 18pt, weight: "bold", fill: accent)[#title] #v(7pt) #body],
)
#let pill(body) = block(width: 100%, fill: rgb("#145083"), radius: 4pt, inset: 9pt, body)

#align(center)[
  #text(size: 27pt, weight: "bold")[Single-user breadth without loading everything]
  #linebreak()
  #text(size: 12pt, fill: rgb("#b9ddf5"))[Authorization decides what is reachable; discovery decides what enters context]
]
#v(12pt)

#grid(columns: (1fr, .32in, 1fr), column-gutter: 14pt,
  box("1 · AUTHORIZATION PLANE", [
    #pill([#text(weight: "bold")[Broad personal “super-namespace"] #linebreak() Nearly the whole catalog for the primary operator])
    #v(11pt)
    #align(center)[#text(size: 20pt, fill: rgb("#9be0ff"))[∩ intentional overlap]]
    #v(6pt)
    #pill([#text(weight: "bold")[Scoped namespace] #linebreak() #text(size: 12pt)[Duplicates selected tools behind a separate credential and policy surface]])
  ], accent: rgb("#f8cb62"), height: 3.35in),
  align(center + horizon)[#text(size: 24pt, fill: rgb("#9be0ff"))[→]],
  box("2 · DISCOVERY PLANE", [
    #pill([#text(weight: "bold")[Toolbox: four meta-tools] #linebreak() list servers → list tools → describe selected schemas → call])
    #v(11pt)
    #pill([#text(weight: "bold")[OpenViking: progressive context] #linebreak() find/search → read only the relevant skill, procedure, or convention])
  ], accent: rgb("#8ee6b0"), height: 3.35in),
)

#v(10pt)
#box("RESULT", [
  #grid(columns: (1fr, 1fr, 1fr), column-gutter: 12pt,
    pill([#text(weight: "bold")[Broad reach] #linebreak() One default connection can reach local, SaaS, infrastructure, and federated-site tools.]),
    pill([#text(weight: "bold")[Small active context] #linebreak() Detailed schemas and procedures are retrieved only for the current task.]),
    pill([#text(weight: "bold")[Separate trust surface] #linebreak() A second overlapping namespace can serve another person or context without shrinking the operator’s default.]),
  )
], accent: rgb("#c5a7ff"))

#v(8pt)
#align(center)[#text(size: 11pt, fill: rgb("#b9ddf5"))[Wide namespace ≠ wide prompt. Reachability, schema loading, and procedural retrieval are three different controls.]]
