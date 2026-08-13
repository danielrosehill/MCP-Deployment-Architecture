#set page(width: 16in, height: 9in, margin: 0.38in, fill: rgb("#082a50"))
#set text(font: "DejaVu Sans", fill: white, size: 15pt)

#let panel(title, body, width: 3.5in, height: 4.8in, accent: rgb("#39b9ff")) = block(
  width: width,
  height: height,
  fill: rgb("#0d3a68"),
  stroke: 1.5pt + accent,
  radius: 8pt,
  inset: 16pt,
  [
    #text(size: 20pt, weight: "bold", fill: accent)[#title]
    #line(length: 100%, stroke: .8pt + accent)
    #v(12pt)
    #body
  ],
)

#let item(title, detail) = block(
  width: 100%,
  fill: rgb("#145083"),
  stroke: .8pt + rgb("#78d3ff"),
  radius: 5pt,
  inset: 10pt,
  [#text(weight: "bold")[#title] #linebreak() #text(size: 11pt, fill: rgb("#ccecff"))[#detail]],
)

#align(center)[
  #text(size: 27pt, weight: "bold")[Federated MCP control surface]
  #linebreak()
  #text(size: 12pt, fill: rgb("#b9ddf5"))[One operator, one primary gateway, independently useful site gateways]
]
#v(18pt)

#grid(
  columns: (2.25in, .65in, 3.7in, .8in, 3.8in, .65in, 2.75in),
  column-gutter: 7pt,
  align: horizon,
  panel("OPERATOR", [
    #item("MCP client", "Laptop, phone, or agent")
    #v(14pt)
    #item("One connection", "Usually the broad personal namespace")
  ], width: 2.25in, height: 4.45in, accent: rgb("#f8cb62")),
  align(center + horizon)[#text(size: 28pt, fill: rgb("#f8cb62"))[→]],
  panel("PRIMARY SITE", [
    #item("Primary MCP gateway", "Aggregates SaaS, infrastructure, and site gateways")
    #v(10pt)
    #item("Toolbox", "Deferred tool discovery and invocation")
    #v(10pt)
    #item("OpenViking", "On-demand skills, procedures, and conventions")
  ], width: 3.7in, height: 5.05in),
  align(center + horizon)[
    #text(size: 24pt, fill: rgb("#9be0ff"))[→]
    #linebreak()
    #text(size: 9.5pt, fill: rgb("#b9ddf5"))[current: Cloudflare Access token]
    #linebreak()
    #text(size: 9.5pt, fill: rgb("#b9ddf5"))[preferred owned-host variant: tailnet + ACL]
  ],
  panel("REMOTE SITE", [
    #text(size: 11pt, fill: rgb("#b9ddf5"))[Burlington, Vermont (pseudonym)]
    #v(8pt)
    #item("Site MCP gateway", "Orange Pi; one cross-site endpoint")
    #v(10pt)
    #item("Local fan-out", "Works locally even if WAN or primary site fails")
    #v(10pt)
    #item("Origin namespace", "remote-site__service__tool prevents site confusion")
  ], width: 3.8in, height: 5.05in, accent: rgb("#8ee6b0")),
  align(center + horizon)[#text(size: 28pt, fill: rgb("#8ee6b0"))[→]],
  panel("SITE TOOLS", [
    #item("Home Assistant", "Scoped physical control")
    #v(10pt)
    #item("Host control", "Orange Pi operations")
    #v(10pt)
    #item("Label printer", "Local peripheral")
  ], width: 2.75in, height: 4.45in, accent: rgb("#8ee6b0")),
)

#v(18pt)
#block(width: 100%, fill: rgb("#331f35"), stroke: 1pt + rgb("#ff9ea8"), radius: 6pt, inset: 12pt)[
  #text(weight: "bold", fill: rgb("#ffbdc4"))[Trust warning:] Tailnet membership or one service token can expose consequential tools across sites. This is an accepted personal deployment trade-off, not a general security baseline. Multi-user or higher-risk deployments need least-privilege namespaces, identity-aware authorization, restrictive network ACLs, audit logs, and removal of host-root tools from ordinary control surfaces.
]
