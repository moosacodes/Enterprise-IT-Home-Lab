# VPN auth failure - Mia Brooks

| Field | Value |
| --- | --- |
| Incident ID | INC-V01 |
| ServiceNow | INC0001003 |
| Category | vpn |
| User | mbrooks (Finance) |
| Lab SLA | 4 hours |
| SLA met | Yes |

## Summary

Home VPN authentication failed.

## Resolution steps

1. Confirmed account not locked
2. Verified SG-VPN-Users membership
3. gpupdate for Lab-VPN-Profile
4. Successful connect

## Root cause

Missing/outdated VPN GPO profile

## Resolution

Profile refreshed
