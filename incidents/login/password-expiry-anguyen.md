# Password expiry - Ava Nguyen

| Field | Value |
| --- | --- |
| Incident ID | INC-L01 |
| ServiceNow | INC0001001 |
| Category | login |
| User | anguyen (Finance) |
| Lab SLA | 4 hours |
| SLA met | Yes |

## Summary

User could not sign in after domain password expired overnight.

## Resolution steps

1. Verified EmployeeID E1001
2. Confirmed account enabled
3. Ran Reset-UserPassword.ps1 -SamAccountName anguyen -Ticket INC0001001
4. User signed in and set new password

## Root cause

Password max age (Lab-Password-Policy) reached

## Resolution

Password reset; change at next logon
