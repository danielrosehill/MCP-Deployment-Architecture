# Reference deployment A — single-site network

```mermaid
flowchart LR
    user[Operator] --> agent[AI agent]
    agent --> ov[OpenViking<br/>skills, procedures, capability manifests]
    agent --> toolbox[Toolbox<br/>deferred schema discovery]
    toolbox --> gateway[Site MCP gateway]
    gateway --> ha[Home Assistant]
    gateway --> infra[LAN infrastructure]
    gateway --> devices[Local devices and peripherals]
    ov -. management context .-> gateway

    classDef user fill:#573f12,stroke:#f8cb62,color:#fff;
    classDef discovery fill:#47386d,stroke:#c5a7ff,color:#fff;
    classDef gateway fill:#0d4778,stroke:#52c7ff,color:#fff;
    classDef site fill:#154f48,stroke:#8ee6b0,color:#fff;
    class user,agent user;
    class ov,toolbox discovery;
    class gateway gateway;
    class ha,infra,devices site;
```

One gateway owns one LAN control surface. OpenViking and the toolbox are logically separate from execution: OpenViking retrieves the relevant skill and management context; the toolbox retrieves only the selected tool schema; the gateway routes the call.
