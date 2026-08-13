# Iterations

Dated snapshots of the MCP deployment architecture as it evolves. The top-level `README.md` always reflects the **current** model; this folder preserves the trajectory. For a version-to-version diff, see [`CHANGELOG.md`](../CHANGELOG.md).

| Date | Version | File | Summary |
|------|---------|------|---------|
| 2026-08-13 | v4 | [v4-2026-08-13.md](v4-2026-08-13.md) | Federate an independently useful remote-site gateway into the primary control surface; document the broad single-user namespace, overlapping auth surfaces, toolbox discovery and OpenViking retrieval. |
| 2026-07-27 | v3 | [v3-2026-07-27.md](v3-2026-07-27.md) | Overlay mesh becomes the backbone (public tunnel demoted to third-party ingress, anti-hairpin DNS retired); add a skill server for progressive, on-demand capability retrieval alongside the aggregator. |
| 2026-04-28 | v2 | [v2-2026-04-28.md](v2-2026-04-28.md) | Drop the workstation-local MCP aggregator; deploy MinIO on the LAN server for robust file staging with retention policies. |
| 2026-04-26 | v1 | [v1-2026-04-26.md](v1-2026-04-26.md) | Initial documented two-tier model: LAN VM aggregator (default) + localhost aggregator (exception-based) + lightweight HTTP file staging service. |
