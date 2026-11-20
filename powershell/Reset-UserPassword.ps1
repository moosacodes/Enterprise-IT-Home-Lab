<#
.SYNOPSIS
  Resets an AD user password and logs the ServiceNow ticket number.
#>
[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)]
    [string]$SamAccountName,

    [Parameter(Mandatory)]
    [string]$Ticket,

    [Parameter(Mandatory = $false)]
    [string]$NewPassword = 'TempP@ssw0rd!Reset'
)

Import-Module ActiveDirectory -ErrorAction Stop

$user = Get-ADUser -Identity $SamAccountName -ErrorAction Stop
$secure = ConvertTo-SecureString $NewPassword -AsPlainText -Force

if ($PSCmdlet.ShouldProcess($SamAccountName, "Reset password for ticket $Ticket")) {
    Set-ADAccountPassword -Identity $user -NewPassword $secure -Reset
    Set-ADUser -Identity $user -ChangePasswordAtLogon $true
    Write-Host "Password reset for $SamAccountName | Ticket $Ticket | Must change at next logon"
}
