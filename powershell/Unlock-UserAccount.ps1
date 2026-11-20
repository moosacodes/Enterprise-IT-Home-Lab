<#
.SYNOPSIS
  Unlocks a locked AD account and records the related ticket.
#>
[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)]
    [string]$SamAccountName,

    [Parameter(Mandatory)]
    [string]$Ticket
)

Import-Module ActiveDirectory -ErrorAction Stop

$user = Get-ADUser -Identity $SamAccountName -Properties LockedOut, badPwdCount, LastBadPasswordAttempt -ErrorAction Stop

Write-Host "Account: $($user.SamAccountName) | LockedOut=$($user.LockedOut) | badPwdCount=$($user.badPwdCount) | LastBad=$($user.LastBadPasswordAttempt)"

if ($user.LockedOut) {
    if ($PSCmdlet.ShouldProcess($SamAccountName, "Unlock for ticket $Ticket")) {
        Unlock-ADAccount -Identity $user
        Write-Host "Unlocked $SamAccountName | Ticket $Ticket"
    }
}
else {
    Write-Host "Account $SamAccountName is not locked. No change. Ticket $Ticket noted."
}
