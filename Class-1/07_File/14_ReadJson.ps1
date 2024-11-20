###
# Read json in powershell example.
#
# License - MIT.
###

# Note:
# Needs first run WriteJson.ps1, then run ReadJson.ps1.


Write-Output "----------------Test 1----------------"
# Json to string.
Get-Date | Select-Object -Property * | ConvertTo-Json | ConvertFrom-Json


Write-Output "----------------Test 2----------------"
# File json to string.
$file = ".\res\JsonFile3.json"
Get-Content -Raw $file | ConvertFrom-Json
