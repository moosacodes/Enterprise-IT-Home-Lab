# Security groups

| Group | Scope | Purpose |
| --- | --- | --- |
| SG-Finance | Global | Finance department membership |
| SG-HR | Global | HR department membership |
| SG-Sales | Global | Sales department membership |
| SG-IT | Global | IT department membership |
| SG-VPN-Users | Global | Allowed VPN authentication |
| SG-Helpdesk | Global | Delegated password reset / unlock |
| SG-Print-Operators | Global | Manage print queues |

## Delegation

`SG-Helpdesk` is delegated **Reset password** and **Unlock account** on the four department OUs (Finance, HR, Sales, IT) so Tier-1 scripts can run without Domain Admin.
