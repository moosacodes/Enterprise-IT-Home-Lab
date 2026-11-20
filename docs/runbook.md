# Tier-1 runbook

## Password reset

1. Verify caller identity (employee ID + department manager or MFA challenge in lab).
2. Confirm ticket exists in ServiceNow.
3. Run:

```powershell
.\powershell\Reset-UserPassword.ps1 -SamAccountName jdoe -Ticket INC0001024
```

4. Force change at next logon; notify user via ticket work note.
5. Resolve ticket with resolution code `Password Reset`.

## Account unlock

```powershell
.\powershell\Unlock-UserAccount.ps1 -SamAccountName jdoe -Ticket INC0001025
```

Check lockout source with `Get-ADUser … -Properties LockedOut, badPwdCount, LastBadPasswordAttempt`.

## VPN failure

1. Confirm AD account enabled / not locked / password not expired.
2. Confirm user in `SG-VPN-Users`.
3. Validate VPN profile (gateway, DNS suffix `CONTOSO.lab`).
4. Document steps in the matching `incidents/vpn/` write-up; close ticket.

## Printer issue

1. Confirm GPO printer mapping / user in print group.
2. Clear spooler / reinstall driver on client as needed.
3. Update CI in asset inventory if hardware swapped.
4. Close under Printer category within 4-hour SLA.

## Group Policy

Baseline application:

```powershell
.\powershell\Set-LabGPO.ps1
```

On client: `gpupdate /force` then `gpresult /r`.
