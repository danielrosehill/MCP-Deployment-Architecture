# Idealized progressive discovery-to-execution flow

```mermaid
sequenceDiagram
    actor User
    participant Agent as AI agent
    participant POV as Primary OpenViking
    participant Toolbox as Toolbox meta-MCP
    participant PGW as Primary gateway
    participant SGW as Selected site gateway
    participant SOV as Site OpenViking
    participant Tool as Local MCP server

    User->>Agent: Natural-language intent
    Agent->>POV: find/search capability by intent
    POV-->>Agent: Lightweight abstracts + site provenance + skill URIs + tool locators
    Agent->>POV: read only the selected skill/runbook
    POV-->>Agent: Procedure, constraints, required namespace, approval and verification steps

    opt Fresh site-specific state is required
        Agent->>SOV: Read current site manifest/health context through managed path
        SOV-->>Agent: Site-local context
    end

    Agent->>Toolbox: list/filter candidate tool or use exact locator from skill
    Toolbox-->>Agent: Candidate names only
    Agent->>Toolbox: describe selected tool
    Toolbox-->>Agent: Selected input schema only
    Agent->>Toolbox: call_tool(name, arguments)
    Toolbox->>PGW: Invoke namespaced tool
    PGW->>PGW: Enforce principal namespace/policy
    PGW->>SGW: MCP call over Tailscale<br/>device identity + restrictive ACL
    SGW->>Tool: Route to site-local upstream
    Tool-->>SGW: Result
    SGW-->>PGW: Namespaced result
    PGW-->>Toolbox: Result
    Toolbox-->>Agent: Result
    Agent->>POV: Optionally record durable outcome or updated procedure
    Agent-->>User: Outcome and verification
```

At no point must the agent load every site, tool schema, or runbook. It expands context in stages: capability abstracts, one selected skill, one selected schema, then one execution path.
