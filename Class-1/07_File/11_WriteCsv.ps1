###
# Write CSV file in powershell example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# String to csv.
$file = ".\res\CsvFile.csv"
$cdata = Get-Date | ConvertTo-Csv

# Write data.
Out-File -FilePath $file -InputObject $cdata -Encoding utf8 -Force
Write-Output ($cdata)


Write-Output "----------------Test 2----------------"
# String to csv.
$Date = Get-Date
$cdata = ConvertTo-Csv -InputObject $Date -Delimiter ';' -NoTypeInformation
Write-Output ($cdata)


Write-Output "----------------Test 3----------------"
# Save for string to csv.
$file = ".\res\CsvFile2.csv"

$data = @(
    [PSCustomObject] @{
        Name = "John"
        Age  = 30
        City = "New York"
    },
    [PSCustomObject] @{
        Name = "Tom"
        Age  = 26
        City = "Shenzhen"
    },
    [PSCustomObject] @{
        Name = "Jane"
        Age  = 25
        City = "Chicago"
    }
)

$data | Export-Csv -Path $file -NoTypeInformation


Write-Output "----------------Test 4----------------"
# Save for string to csv.
$file = ".\res\CsvFile3.csv"

1..5 | ForEach-Object {
    New-Object PSCustomObject -Property @{
        Time = Get-Date -Format "HH:mm:ss"
        Usage = Get-Random -Maximum 100
    }
} | Export-Csv -Path $file -NoTypeInformation -Append
