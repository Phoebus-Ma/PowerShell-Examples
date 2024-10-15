###
# Json example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"


'{ "key1":"value1", "key2":"value2" }' | ConvertFrom-Json


Write-Output "----------------Test 2----------------"

@{Account="User01";Domain="Domain01";Admin="True"} | ConvertTo-Json -Compress


Write-Output "----------------Test 3----------------"
# Output 1.
Get-Date

# Output 2.
Get-Date | Select-Object -Property *

# Output 3, string to json.
Get-Date | Select-Object -Property * | ConvertTo-Json

# Output 4, json to string.
Get-Date | Select-Object -Property * | ConvertTo-Json | ConvertFrom-Json


Write-Output "----------------Test 4----------------"

'{ "key1":"value1", "key2":"value2" }' | Out-File JsonFile.JSON
Get-Content -Raw JsonFile.JSON | ConvertFrom-Json
