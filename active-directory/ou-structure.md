# Active Directory OU structure

Domain: `CONTOSO.lab`

```
DC=CONTOSO,DC=lab
└── OU=Lab
    ├── OU=Finance          (8 users)
    ├── OU=HR               (8 users)
    ├── OU=Sales            (8 users)
    ├── OU=IT               (8 users)
    ├── OU=Groups
    │   ├── SG-Finance
    │   ├── SG-HR
    │   ├── SG-Sales
    │   ├── SG-IT
    │   ├── SG-VPN-Users
    │   ├── SG-Helpdesk
    │   └── SG-Print-Operators
    └── OU=Computers
        ├── OU=Workstations
        ├── OU=Laptops
        └── OU=Peripherals
```

## Department summary

| Department | Users | Primary groups |
| --- | ---: | --- |
| Finance | 8 | SG-Finance, SG-VPN-Users |
| HR | 8 | SG-HR, SG-VPN-Users |
| Sales | 8 | SG-Sales, SG-VPN-Users |
| IT | 8 | SG-IT, SG-VPN-Users, SG-Helpdesk (subset) |
| **Total** | **32** | |

Source of truth: [`users.csv`](users.csv)
