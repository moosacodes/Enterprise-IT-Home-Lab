<#
.SYNOPSIS
  Exports or refreshes the lab asset inventory CSV (device ID, user, location).
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string]$OutCsv = (Join-Path $PSScriptRoot '..\assets\inventory.csv'),

    [Parameter(Mandatory = $false)]
    [string]$SourceCsv = (Join-Path $PSScriptRoot '..\assets\inventory.csv')
)

if (-not (Test-Path $SourceCsv)) {
    throw "Inventory source not found: $SourceCsv"
}

$assets = Import-Csv -Path $SourceCsv
$stamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'

$export = foreach ($a in $assets) {
    [pscustomobject]@{
        DeviceID      = $a.DeviceID
        AssetType     = $a.AssetType
        Hostname      = $a.Hostname
        SerialNumber  = $a.SerialNumber
        AssignedUser  = $a.AssignedUser
        Department    = $a.Department
        Location      = $a.Location
        Status        = $a.Status
        LastVerified  = $stamp
        Notes         = $a.Notes
    }
}

$export | Export-Csv -Path $OutCsv -NoTypeInformation -Encoding UTF8
Write-Host "Exported $($export.Count) assets to $OutCsv (verified $stamp)"
