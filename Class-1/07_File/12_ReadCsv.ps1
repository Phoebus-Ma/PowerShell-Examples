###
# Read CSV example.
#
# License - MIT.
###

# Note:
# first run WriteCsv.ps1, then run ReadCsv.ps1.

$file = ".\res\CsvFile3.csv"

Write-Output "----------------Test 1----------------"
# CSV to string.
$data = Get-Date | ConvertTo-Csv
$data | ConvertFrom-Csv


Write-Output "----------------Test 2----------------"
# Csv to string.
$data = Get-Date | ConvertTo-Csv -Delimiter ';'
ConvertFrom-Csv -InputObject $data -Delimiter ';'


Write-Output "----------------Test 3----------------"
# Get file data and convert.
Get-Content $file | ConvertFrom-Csv


Write-Output "----------------Test 4----------------"
# Get file data and convert.
$data = Import-Csv -Path $file
$data | Format-Table
