# Group Policy baselines

Linked under `OU=Lab,DC=CONTOSO,DC=lab` unless noted.

| GPO | Link | Settings |
| --- | --- | --- |
| Lab-Password-Policy | Domain | Min length 12, complexity on, max age 90 days, history 10 |
| Lab-Account-Lockout | Domain | Threshold 5, duration 30 min, reset counter 30 min |
| Lab-Workstation-Lockdown | OU=Computers | Disable guest, require Ctrl+Alt+Del, screen lock 15 min |
| Lab-Mapped-Printers | OU=Lab | Deploy HQ-Floor2-MFD and Finance-Printer via preferences |
| Lab-VPN-Profile | OU=Lab | Deploy Contoso VPN client profile (lab XML) |
| Lab-Drive-Maps | Per-dept OUs | Map `H:` home and `S:` department share |

Apply with:

```powershell
.\powershell\Set-LabGPO.ps1
```

Client verification: `gpupdate /force` then `gpresult /r /scope:user`.
