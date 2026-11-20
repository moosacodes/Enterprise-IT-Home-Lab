# Account lockout - Noah Patel

| Field | Value |
| --- | --- |
| Incident ID | INC-L02 |
| ServiceNow | INC0001002 |
| Category | login |
| User | npatel (Finance) |
| Lab SLA | 4 hours |
| SLA met | Yes |

## Summary

Five failed logons triggered Lab-Account-Lockout.

## Resolution steps

1. Checked LockedOut and badPwdCount
2. Cleared stale Outlook credential on phone
3. Unlock-UserAccount.ps1 -SamAccountName npatel -Ticket INC0001002

## Root cause

Stale mobile credential

## Resolution

Account unlocked
