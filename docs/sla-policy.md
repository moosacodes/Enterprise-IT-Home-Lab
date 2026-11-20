# Lab SLA policy (ServiceNow)

Simulated enterprise helpdesk SLA used for all tickets in this lab.

| Priority | Definition | Response | Resolve (lab SLA) |
| --- | --- | --- | --- |
| P1 – Critical | Domain / VPN outage affecting many users | 15 min | 1 hour |
| P2 – High | Single-user login failure, account lockout, VPN auth failure | 30 min | **4 hours** |
| P3 – Moderate | Printer mapping, driver, queue issues | 1 hour | **4 hours** |
| P4 – Low | Informational / how-to | 4 hours | 8 hours |

## Scope for resume metrics

- Triage target for the bulk of login, VPN, and printer work: **4-hour resolve SLA** (P2/P3).
- All **28** tickets in `servicenow/tickets.csv` record `Opened`, `Resolved`, and `SLA_Met` so compliance is auditable.
- Work notes mirror ServiceNow fields: caller, CI, category, subcategory, assignment group, resolution code.

## Assignment groups

| Group | Handles |
| --- | --- |
| Service Desk | First-line triage, password reset, unlock |
| Desktop Support | Printers, endpoints, local config |
| Network Support | VPN client, gateway connectivity (lab sim) |
