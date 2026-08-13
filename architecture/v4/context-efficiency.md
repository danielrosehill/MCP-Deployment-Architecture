# v4 authorization and context-efficiency model

```mermaid
flowchart LR
    operator[Primary operator] --> super[Personal super-namespace<br/>nearly the whole catalog]
    household[Scoped principal/context] --> scoped[Scoped namespace<br/>separate credential and policy]

    shared[Selected shared tools] --> super
    shared --> scoped
    full[Personal, business, infrastructure,<br/>and federated-site tools] --> super

    super --> gateway[Reachable catalog]
    scoped --> gateway

    gateway --> toolbox[Toolbox<br/>list → filter → describe → call]
    gateway --> viking[OpenViking<br/>find/search → read]

    toolbox --> schemas[Only selected tool schemas<br/>enter active context]
    viking --> procedures[Only relevant skills and procedures<br/>enter active context]

    classDef auth fill:#573f12,stroke:#f8cb62,color:#fff;
    classDef catalog fill:#0d4778,stroke:#52c7ff,color:#fff;
    classDef discovery fill:#154f48,stroke:#8ee6b0,color:#fff;
    classDef result fill:#47386d,stroke:#c5a7ff,color:#fff;
    class operator,household,super,scoped auth;
    class shared,full,gateway catalog;
    class toolbox,viking discovery;
    class schemas,procedures result;
```

The three controls are independent:

1. Namespace membership determines what a principal can reach.
2. Toolbox determines which detailed tool schemas are loaded and invoked.
3. OpenViking determines which procedures and conventions are retrieved.
