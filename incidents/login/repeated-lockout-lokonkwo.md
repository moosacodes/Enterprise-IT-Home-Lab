# Repeated lockouts - Lucas Okonkwo

| Field | Value |
| --- | --- |
| Incident ID | INC-L04 |
| ServiceNow | INC0001008 |
| Category | login |
| User | lokonkwo (Finance) |
| Lab SLA | 4 hours |
| SLA met | Yes |

## Summary

Morning lockouts from cached bad password.

## Resolution steps

1. Reviewed LastBadPasswordAttempt
2. Removed stored credential
3. Unlocked account

## Root cause

Cached bad password on secondary device

## Resolution

Unlock + credential hygiene
