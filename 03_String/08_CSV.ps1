###
# CSV example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# String to CSV.
Get-Date | ConvertTo-Csv


Write-Output "----------------Test 2----------------"
# CSV to string.
$P = Get-Date | ConvertTo-Csv
$P | ConvertFrom-Csv


Write-Output "----------------Test 3----------------"
# String to csv.
$Date = Get-Date
ConvertTo-Csv -InputObject $Date -Delimiter ';' -NoTypeInformation


Write-Output "----------------Test 4----------------"
# Csv to string.
$Date = Get-Date | ConvertTo-Csv -Delimiter ';'
ConvertFrom-Csv -InputObject $Date -Delimiter ';'


Write-Output "----------------Test 5----------------"
# String to csv.
$J = Start-Job -ScriptBlock { Get-Process } | ConvertTo-Csv  -NoTypeInformation
$Header = 'State', 'MoreData', 'StatusMessage', 'Location', 'Command',
          'StateInfo', 'Finished', 'InstanceId', 'Id', 'Name', 'ChildJobs',
          'BeginTime', 'EndTime', 'JobType', 'Output', 'Error', 'Progress',
          'Verbose', 'Debug', 'Warning', 'Information'

# Delete the default header from $J
$J = $J[1..($J.count - 1)]
$J | ConvertFrom-Csv -Header $Header
