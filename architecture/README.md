# Architecture as code

This directory is the machine-readable counterpart to the narrative architecture in the repository root. Each dated version is immutable after release; a later architectural change creates a new version directory.

Each version contains:

- `model.yaml` — the canonical inventory and relationship graph;
- `topology.md` — a GitHub-rendered Mermaid deployment/control-flow view; and
- `context-efficiency.md` — a GitHub-rendered Mermaid authorization and progressive-discovery view.

v4 additionally separates the single-site and extended reference deployments and includes an end-to-end sequence:

- `single-site.md` — one gateway managing one LAN;
- `extended-sites.md` — a primary gateway managing an arbitrary number of on-prem gateways over Tailscale; and
- `progressive-execution.md` — user intent through OpenViking discovery, deferred schema loading, routing and tool execution.

The YAML model is authoritative for component identity, relationships and deployment facts. Mermaid files are reviewable views of that model. Typst sources under [`../diagrams/`](../diagrams/) are the polished presentation layer, and the prose README and iteration snapshots explain rationale and trade-offs.

This is deliberately not an ERD. An ERD describes persistent data structure; this model describes principals, trust boundaries, deployed components and communication paths.
