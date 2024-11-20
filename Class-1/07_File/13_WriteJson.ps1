###
# Write json in powershell example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Simple write json to file.
$jsonPath = ".\res\JsonFile.json"

'{ "key1":"value1", "key2":"value2" }' | Out-File $jsonPath
$str = Get-Content $jsonPath
Write-Output ($str)


Write-Output "----------------Test 2----------------"
# Save json file.
$jsonPath = ".\res\JsonFile2.json"

# Create a PowerShell object.
$person = @{
    FirstName = 'James'
    LastName  = 'Karley'
    Age = 26
}

# Convert the object to a JSON string.
$json = $person | ConvertTo-Json

# Write the JSON string to a file.
$json | Out-File -FilePath $jsonPath


Write-Output "----------------Test 3----------------"
# Loop save json file.
$jsonPath = ".\res\JsonFile3.json"

1..5 | ForEach-Object {
    New-Object PSObject -Property @{
        Id = $_
        Num = (Get-Random).ToString()
    }
} | ConvertTo-Json | Out-File -FilePath $jsonPath -Append


Write-Output "----------------Test 4----------------"
# Composing json files.
$jsonPath = ".\res\JsonFile4.json"

$content = 1..5 | ForEach-Object {
    New-Object PSObject -Property @{
        Id = $_
        Num = (Get-Random).ToString()
    }
} 

$data = @{
    hello1 = 'hello'
    hello2 = $content
}

$data | ConvertTo-Json | Out-File -FilePath $jsonPath -Append
