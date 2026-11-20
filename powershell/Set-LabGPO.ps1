<#
.SYNOPSIS
  Creates / updates baseline lab GPOs (password, lockout, printers, VPN).
.NOTES
  Run on DC01 with GroupPolicy module. Safe to re-run (idempotent names).
#>
[CmdletBinding(SupportsShouldProcess)]
param()

Import-Module GroupPolicy -ErrorAction Stop
Import-Module ActiveDirectory -ErrorAction Stop

$domainDn = (Get-ADDomain).DistinguishedName
$labOu = "OU=Lab,$domainDn"

function Ensure-Gpo {
    param([string]$Name, [string]$TargetDn)
    $gpo = Get-GPO -Name $Name -ErrorAction SilentlyContinue
    if (-not $gpo) {
        if ($PSCmdlet.ShouldProcess($Name, 'New-GPO')) {
            $gpo = New-GPO -Name $Name -Comment 'Enterprise IT Support Home Lab baseline'
            New-GPLink -Name $Name -Target $TargetDn -LinkEnabled Yes | Out-Null
            Write-Host "Created and linked $Name -> $TargetDn"
        }
    }
    else {
        Write-Host "GPO exists: $Name"
    }
    return $gpo
}

Ensure-Gpo -Name 'Lab-Password-Policy' -TargetDn $domainDn | Out-Null
Ensure-Gpo -Name 'Lab-Account-Lockout' -TargetDn $domainDn | Out-Null
Ensure-Gpo -Name 'Lab-Workstation-Lockdown' -TargetDn "OU=Computers,$labOu" | Out-Null
Ensure-Gpo -Name 'Lab-Mapped-Printers' -TargetDn $labOu | Out-Null
Ensure-Gpo -Name 'Lab-VPN-Profile' -TargetDn $labOu | Out-Null
Ensure-Gpo -Name 'Lab-Drive-Maps' -TargetDn $labOu | Out-Null

# Password / lockout via domain default policy fine-tuning (documented values)
# Min length 12, lockout threshold 5 — applied on DC with:
#   Set-ADDefaultDomainPasswordPolicy -Identity CONTOSO.lab -MinPasswordLength 12 -ComplexityEnabled $true -LockoutThreshold 5 -LockoutDuration 00:30:00

Write-Host 'Baseline GPO ensure complete. See active-directory/gpo/gpo-baseline.md for settings.'
