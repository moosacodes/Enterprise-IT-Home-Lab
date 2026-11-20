# Lab architecture

## Domain

| Setting | Value |
| --- | --- |
| Forest / domain | `CONTOSO.lab` |
| NetBIOS | `CONTOSO` |
| DC | `DC01` (Windows Server 2022) |
| DNS | Integrated on DC01 (`192.168.56.10`) |
| Client | `WIN11-CLIENT` (domain-joined) |

## OU layout

```
CONTOSO.lab
└── Lab
    ├── Finance
    ├── HR
    ├── Sales
    ├── IT
    ├── Groups
    └── Computers
        ├── Workstations
        ├── Laptops
        └── Peripherals
```

Four department OUs hold the **32** simulated users. Computer objects and peripheral records map to the asset inventory.

## Identity & access

- Password resets and unlocks via PowerShell against AD (`Reset-UserPassword.ps1`, `Unlock-UserAccount.ps1`)
- Security groups per department + role groups (`SG-Helpdesk`, `SG-VPN-Users`, `SG-Print-Operators`)
- Baseline GPOs: password policy, lockout, workstation lockdown, mapped printers (see `active-directory/gpo/`)

## Ticketing

ServiceNow PDI (or CSV-backed simulation) with a **4-hour** lab SLA for Priority 2–3 incidents. Ticket export lives in `servicenow/tickets.csv` (**28** tickets).

## Metrics checklist

| Claim | Source of truth | Count |
| --- | --- | --- |
| Login / VPN / printer incidents | `incidents/INCIDENT-INDEX.md` | 22 |
| ServiceNow tickets | `servicenow/tickets.csv` | 28 |
| AD users | `active-directory/users.csv` | 32 |
| Departments | Finance, HR, Sales, IT | 4 |
| Assets | `assets/inventory.csv` | 45 |
