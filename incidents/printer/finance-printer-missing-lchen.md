# Finance printer missing - Liam Chen

| Field | Value |
| --- | --- |
| Incident ID | INC-P01 |
| ServiceNow | INC0001004 |
| Category | printer |
| User | lchen (Finance) |
| Lab SLA | 4 hours |
| SLA met | Yes |

## Summary

Mapped printer missing after reboot.

## Resolution steps

1. Checked Lab-Mapped-Printers GPO
2. gpupdate /force
3. Printer reappeared

## Root cause

GPP mapping not applied

## Resolution

GPO remapped
