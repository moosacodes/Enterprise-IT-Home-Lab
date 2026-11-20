<#
.SYNOPSIS
  Provisions lab users and department groups from users.csv into CONTOSO.lab.
.NOTES
  Requires RSAT AD module and rights to create objects under OU=Lab.
#>
[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory = $false)]
    [string]$CsvPath = (Join-Path $PSScriptRoot '..\active-directory\users.csv'),

    [Parameter(Mandatory = $false)]
    [string]$DefaultPassword = 'LabP@ssw0rd!ChangeMe'
)

Import-Module ActiveDirectory -ErrorAction Stop

if (-not (Test-Path $CsvPath)) {
    throw "CSV not found: $CsvPath"
}

$users = Import-Csv -Path $CsvPath
Write-Host "Provisioning $($users.Count) users from $CsvPath"

$groupNames = @('SG-Finance', 'SG-HR', 'SG-Sales', 'SG-IT', 'SG-VPN-Users', 'SG-Helpdesk', 'SG-Print-Operators')
$groupsOu = 'OU=Groups,OU=Lab,DC=CONTOSO,DC=lab'

foreach ($name in $groupNames) {
    if (-not (Get-ADGroup -Filter "Name -eq '$name'" -ErrorAction SilentlyContinue)) {
        if ($PSCmdlet.ShouldProcess($name, 'New-ADGroup')) {
            New-ADGroup -Name $name -GroupScope Global -GroupCategory Security -Path $groupsOu
            Write-Host "Created group $name"
        }
    }
}

$secure = ConvertTo-SecureString $DefaultPassword -AsPlainText -Force

foreach ($u in $users) {
    $existing = Get-ADUser -Filter "SamAccountName -eq '$($u.SamAccountName)'" -ErrorAction SilentlyContinue
    if ($existing) {
        Write-Host "Skip existing: $($u.SamAccountName)"
        continue
    }

    if ($PSCmdlet.ShouldProcess($u.SamAccountName, 'New-ADUser')) {
        New-ADUser `
            -SamAccountName $u.SamAccountName `
            -UserPrincipalName $u.Email `
            -Name $u.DisplayName `
            -GivenName $u.GivenName `
            -Surname $u.Surname `
            -DisplayName $u.DisplayName `
            -Department $u.Department `
            -Title $u.Title `
            -EmailAddress $u.Email `
            -EmployeeID $u.EmployeeID `
            -Path $u.OU `
            -AccountPassword $secure `
            -Enabled ([bool]::Parse($u.Enabled)) `
            -ChangePasswordAtLogon $true

        foreach ($g in ($u.MemberOf -split ';')) {
            if ($g) { Add-ADGroupMember -Identity $g.Trim() -Members $u.SamAccountName -ErrorAction SilentlyContinue }
        }
        Write-Host "Created $($u.SamAccountName) in $($u.Department)"
    }
}

Write-Host "Done. Users in CSV: $($users.Count)"
