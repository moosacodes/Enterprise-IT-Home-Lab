# Enterprise IT Support Home Lab

Hands-on Windows Server / Active Directory / PowerShell / ServiceNow lab that mirrors Tier-1 enterprise IT support work.

| Metric | Lab evidence |
| --- | --- |
| **20+** login, VPN, and printer incidents resolved | [`incidents/`](incidents/) — 22 documented resolutions |
| **25+** ServiceNow tickets triaged to a **4-hour** lab SLA | [`servicenow/tickets.csv`](servicenow/tickets.csv) — 28 tickets |
| **30+** simulated users across **4** departments | [`active-directory/users.csv`](active-directory/users.csv) — 32 users |
| **40+** endpoints & peripherals tracked | [`assets/inventory.csv`](assets/inventory.csv) — 45 assets |

## Stack

- **Windows Server 2022** — AD DS domain controller (`CONTOSO.lab`)
- **Active Directory** — OUs, security groups, password resets, unlocks, Group Policy
- **PowerShell** — user provisioning, account ops, GPO helpers, asset export
- **ServiceNow (PDI / simulated)** — incident triage against a 4-hour lab SLA

## Lab topology

```
Host (Hyper-V)
├── DC01          Windows Server 2022  — AD DS, DNS, GPO
├── FS01          Windows Server 2022  — file shares (optional)
└── WIN11-CLIENT  Windows 11           — domain-joined test workstation
```

Domain: `CONTOSO.lab`  
Departments (OUs): **Finance**, **HR**, **Sales**, **IT**

## Quick start

1. Promote a lab DC and create the domain (see [`docs/lab-architecture.md`](docs/lab-architecture.md)).
2. Provision users and groups:

```powershell
.\powershell\New-LabUsers.ps1 -CsvPath .\active-directory\users.csv
```

3. Apply baseline GPOs:

```powershell
.\powershell\Set-LabGPO.ps1
```

4. Work tickets from [`servicenow/tickets.csv`](servicenow/tickets.csv) using the reset/unlock scripts and incident runbooks.
5. Refresh the asset inventory:

```powershell
.\powershell\Get-LabAssetInventory.ps1 -OutCsv .\assets\inventory.csv
```

## Repository map

| Path | Purpose |
| --- | --- |
| `active-directory/` | 32 users, OU layout, GPO baselines |
| `powershell/` | Automation for AD ops, GPO, assets, ticket helpers |
| `servicenow/` | 28 tickets + SLA policy and report |
| `incidents/` | 22 login / VPN / printer write-ups |
| `assets/` | 45-device inventory (IDs, users, locations) |
| `docs/` | Architecture, SLA, runbooks |

## Resume alignment

> Enterprise IT Support Home Lab \| Windows Server, Active Directory, PowerShell, ServiceNow  
> • Resolved **20+** simulated login, VPN, and printer incidents, triaging **25+** ServiceNow tickets to a **4-hour** lab SLA  
> • Handled password resets, unlocks, and Group Policy for **30+** simulated users in **4** departments via Active Directory  
> • Tracked **40+** endpoints and peripherals in an asset inventory by logging device IDs, assigned users, and locations

Counts in this repo are intentional and verifiable from the CSVs and incident index.
