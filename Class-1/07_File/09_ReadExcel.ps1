###
# Read excel file example.
#
# License - MIT.
###

# Note, needs install module:
# Install-Module -Name ImportExcel -Scope CurrentUser

# Input File Path
$FilePath = ".\test1.xlsx"

$ExcelData = Import-Excel -Path $FilePath -HeaderName 'Time','Usage'
 
# Get Each Row of data
$ExcelData | ForEach-Object {
    Write-Output ($_.Time.ToString() + "," + $_.Usage)
}
