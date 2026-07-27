# Changelog

What changed between versions of this architecture, newest first. Each entry
links to its full snapshot under [`iterations/`](iterations/); the
[README](README.md) always describes the current version only.

## v3 — 2026-07-27

[Full snapshot](iterations/v3-2026-07-27.md)

**Networking is now an overlay mesh backbone, and a skill server joins the
aggregator.**

- **Added — mesh VPN as the backbone.** Tailscale is promoted from one of two
  remote-access options to the default path between every machine the operator
  owns. Peer identity replaces shared bearer secrets; no service token, no port
  forward.
- **Removed — split-horizon DNS anti-hairpin workaround.** Obsolete: with one
  overlay address that works identically on-LAN and off, there is no second
  address to hairpin to.
- **Retained, deliberately — public tunnel ingress.** Third-party MCP clients
  cannot join the mesh, and typically cannot send custom auth headers either, so
  a mesh-only endpoint would be both unreachable and unauthenticatable to them.
  Documented as a limit on the backbone principle rather than an unfinished
  migration.
- **Added — skill server (OpenViking).** Capability definitions retrieved on
  demand instead of loaded into every session. Complements the aggregator:
  aggregator supplies breadth of tools, skill server supplies depth of procedure.
- **Unchanged.** MCP aggregator, MinIO file staging, LAN device tier.

## v2 — 2026-04-28

[Full snapshot](iterations/v2-2026-04-28.md)

**Simplify aggregation, harden file staging.**

- **Removed — workstation-local aggregator.** The desktop client makes direct
  point-to-point connections to the few servers that must run locally; the extra
  layer paid less than it cost.
- **Replaced — HTTP staging microservice → MinIO** on the LAN server:
  S3-compatible API, presigned URLs for clients without filesystem access, and
  lifecycle policies so staged artifacts are pruned automatically.
- **Unchanged.** LAN VM aggregator, LAN device tier, remote-access tier.

## v1 — 2026-04-26

[Full snapshot](iterations/v1-2026-04-26.md)

**Initial documented model.**

- Two-tier aggregation: LAN VM aggregator as the default destination, plus a
  localhost aggregator for exceptions.
- Lightweight HTTP service for file staging.
- Hierarchical composition of LAN device tools as the answer to tool bloat.
