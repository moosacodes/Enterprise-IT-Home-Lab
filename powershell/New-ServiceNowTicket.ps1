<#
.SYNOPSIS
  Appends a simulated ServiceNow incident row to tickets.csv (lab stand-in for Table API).
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$Caller,
    [Parameter(Mandatory)][ValidateSet('Login','VPN','Printer','Account','Hardware','Other')][string]$Category,
    [Parameter(Mandatory)][string]$ShortDescription,
    [Parameter(Mandatory = $false)][ValidateSet('P1','P2','P3','P4')][string]$Priority = 'P3',
    [Parameter(Mandatory = $false)][string]$AssignmentGroup = 'Service Desk',
    [Parameter(Mandatory = $false)][string]$CsvPath = (Join-Path $PSScriptRoot '..\servicenow\tickets.csv')
)

$tickets = @(Import-Csv -Path $CsvPath)
$nextNum = 1000 + $tickets.Count + 1
$number = 'INC{0:D7}' -f $nextNum
$opened = Get-Date -Format 'yyyy-MM-dd HH:mm'

$row = [pscustomobject]@{
    Number            = $number
    Opened            = $opened
    Caller            = $Caller
    Category          = $Category
    Subcategory       = ''
    Priority          = $Priority
    ShortDescription  = $ShortDescription
    AssignmentGroup   = $AssignmentGroup
    State             = 'New'
    SLA_Hours         = if ($Priority -in @('P2','P3')) { '4' } else { if ($Priority -eq 'P1') { '1' } else { '8' } }
    Resolved          = ''
    ResolutionCode    = ''
    SLA_Met           = ''
    WorkNotes         = 'Created via New-ServiceNowTicket.ps1'
}

$tickets + $row | Export-Csv -Path $CsvPath -NoTypeInformation -Encoding UTF8
Write-Host "Created $number ($Category / $Priority) for $Caller — lab SLA $($row.SLA_Hours)h"
