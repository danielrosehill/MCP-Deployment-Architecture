# Reference deployment B — extended managed-site network

```mermaid
flowchart LR
    user[Operator] --> agent[AI agent]

    subgraph primary[Primary management site]
        pov[Primary OpenViking<br/>global capability index]
        toolbox[Toolbox<br/>deferred schemas and invocation]
        pgw[Primary MCP gateway]
    end

    agent -->|1 · find capability| pov
    pov -->|2 · abstract, site provenance,<br/>skill URI, tool locator| agent
    agent -->|3 · read selected skill| pov
    agent -->|4 · select/describe/call| toolbox
    toolbox --> pgw

    subgraph site1[Managed on-prem site 1]
        ov1[Site OpenViking]
        gw1[Site MCP gateway]
        tools1[Local MCP servers]
        ov1 -. site skills, manifests,<br/>runbooks and health context .-> gw1
        gw1 --> tools1
    end

    subgraph siteN[Managed on-prem site N]
        ovN[Site OpenViking]
        gwN[Site MCP gateway]
        toolsN[Local MCP servers]
        ovN -. site skills, manifests,<br/>runbooks and health context .-> gwN
        gwN --> toolsN
    end

    ov1 -. ingest or mirror summaries .-> pov
    ovN -. ingest or mirror summaries .-> pov
    pgw -->|5 · MCP over tailnet<br/>device identity + restrictive ACL| gw1
    pgw -->|5 · MCP over tailnet<br/>device identity + restrictive ACL| gwN
    tools1 -->|6 · result| agent
    toolsN -->|6 · result| agent

    classDef user fill:#573f12,stroke:#f8cb62,color:#fff;
    classDef discovery fill:#47386d,stroke:#c5a7ff,color:#fff;
    classDef gateway fill:#0d4778,stroke:#52c7ff,color:#fff;
    classDef site fill:#154f48,stroke:#8ee6b0,color:#fff;
    class user,agent user;
    class pov,ov1,ovN,toolbox discovery;
    class pgw,gw1,gwN gateway;
    class tools1,toolsN site;
```

Each additional site contributes one gateway upstream and one capability subtree, not a new client connection. The topology is logically extensible to an arbitrary number of managed sites. Practical scale is bounded by catalog cardinality, synchronization, policy administration, observability, latency, and failure isolation.

OpenViking federation here is an **architecture pattern**, not a claim of native OpenViking multi-node replication. A scheduled or event-driven ingest layer mirrors site abstracts and selected resources into the primary catalog. Site-local OpenViking remains useful to local agents when the WAN is unavailable.
