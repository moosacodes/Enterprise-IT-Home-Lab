# VPN DNS drop - Oliver Hassan

| Field | Value |
| --- | --- |
| Incident ID | INC-V02 |
| ServiceNow | INC0001006 |
| Category | vpn |
| User | ohassan (Finance) |
| Lab SLA | 4 hours |
| SLA met | Yes |

## Summary

VPN connected but name resolution failed.

## Resolution steps

1. Checked adapter DNS suffix
2. Set CONTOSO.lab suffix
3. Verified DC ping by name

## Root cause

Missing DNS suffix on VPN adapter

## Resolution

DNS profile fix
