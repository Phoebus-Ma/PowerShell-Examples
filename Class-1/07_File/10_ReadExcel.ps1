###
# Read excel file example.
#
# License - MIT.
###

# Note:
# 1.
# Install-Module -Name ImportExcel
# 2.
# First run WriteExcel.ps1, then run ReadExcel.ps1.

# Input File Path
$file = ".\res\ExcelFile.xlsx"

$data = Import-Excel -Path $file -HeaderName "Time", "Usage"
 
# Get Each Row of data
$data | ForEach-Object {
    Write-Output ($_.Time.ToString() + "," + $_.Usage)
}
