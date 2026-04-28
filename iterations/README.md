# Iterations

Dated snapshots of the MCP deployment architecture as it evolves. The top-level `README.md` always reflects the **current** model; this folder preserves the trajectory.

| Date | Version | File | Summary |
|------|---------|------|---------|
| 2026-04-28 | v2 | [v2-2026-04-28.md](v2-2026-04-28.md) | Drop the workstation-local MCP aggregator; deploy MinIO on the LAN server for robust file staging with retention policies. |
| 2026-04-26 | v1 | [v1-2026-04-26.md](v1-2026-04-26.md) | Initial documented two-tier model: LAN VM aggregator (default) + localhost aggregator (exception-based) + lightweight HTTP file staging service. |
