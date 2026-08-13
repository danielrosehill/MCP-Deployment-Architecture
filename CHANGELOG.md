# Changelog

What changed between versions of this architecture, newest first. Each entry
links to its full snapshot under [`iterations/`](iterations/); the
[README](README.md) always describes the current version only.

## v4 — 2026-08-13

[Full snapshot](iterations/v4-2026-08-13.md)

**The control surface now federates an independently useful remote-site gateway, and the single-user context-efficiency model is made explicit.**

- **Added — gateway-to-gateway site federation.** A remote Orange Pi gateway is registered as one upstream of the primary gateway and fans out locally to Home Assistant, host control and a label printer.
- **Added — origin-preserving tool names.** Double prefixes such as `burlington__home-assistant__*` distinguish remote actions from equivalent tools at the primary site.
- **Clarified — deployed transport versus preferred variant.** The live cross-site hop uses Cloudflare Access service-token headers; tailnet identity plus restrictive ACLs remains the preferred owned-host pattern when container DNS and addressing are dependable.
- **Documented — super-namespace model.** The primary operator normally uses one broad namespace. Narrower namespaces intentionally overlap it to create separate authorization surfaces, not to organize tools or reduce prompt context.
- **Clarified — two progressive-discovery mechanisms.** The toolbox progressively reveals and calls tool schemas; OpenViking progressively retrieves skills, procedures and conventions. Namespace breadth governs reachability and is independent of both.
- **Added — explicit security limits.** The broad personal trust domain is an accepted single-user trade-off, not a general baseline for multi-user or high-consequence deployments.
- **Added — reproducible diagrams.** v4 ships Typst source and rendered PNGs for the federated topology and context-efficiency model.
- **Added — architecture as code.** A canonical YAML relationship graph and GitHub-native Mermaid views version the same topology, namespace model, invariants and security posture in reviewable source form.
- **Added — two reference deployments.** The baseline is one gateway on one LAN; the extended model federates an arbitrary number of managed on-prem gateways over Tailscale with device identity and restrictive ACLs.
- **Added — idealized per-site OpenViking.** Each site can carry local skills, capability manifests and management runbooks, whose abstracts are ingested into a primary global discovery tree. The current Pi's memory constraint is documented as an implementation exception, not an architectural limit.
- **Added — discovery-to-execution sequence.** User intent expands progressively through a capability abstract, one selected skill, one selected tool schema, a policy-checked gateway route and one result.

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
