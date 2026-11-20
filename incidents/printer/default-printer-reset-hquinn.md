# Default printer resets - Harper Quinn

| Field | Value |
| --- | --- |
| Incident ID | INC-P04 |
| ServiceNow | INC0001015 |
| Category | printer |
| User | hquinn (HR) |
| Lab SLA | 4 hours |
| SLA met | Yes |

## Summary

Windows kept clearing default printer.

## Resolution steps

1. Removed phantom local printer
2. Set default via GPP
3. Verified persistence

## Root cause

Local phantom printer conflict

## Resolution

GPO default printer
