###
# Get date example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Example 1.
Get-Date


Write-Output "----------------Test 2----------------"
# Example 2.
Get-Date -DisplayHint Date


Write-Output "----------------Test 3----------------"
# Example 3.
Get-Date -Format "dddd MM/dd/yyyy HH:mm K"


Write-Output "----------------Test 4----------------"
# Example 4.
Get-Date -UFormat "%A %m/%d/%Y %R %Z"


Write-Output "----------------Test 5----------------"
# Example 5.
(Get-Date -Year 2020 -Month 12 -Day 31).DayOfYear


Write-Output "----------------Test 6----------------"
# Example 6.
$DST = Get-Date
$DST.IsDaylightSavingTime()


Write-Output "----------------Test 7----------------"
# Example 7.
Get-Date -UFormat "%A %B/%d/%Y %T %Z"
$Time = Get-Date
$Time.ToUniversalTime()


Write-Output "----------------Test 8----------------"
# Example 8.
$timestamp = Get-Date -Format o | ForEach-Object { $_ -replace ":", "." }
New-Item -Path C:\Test\$timestamp -Type Directory


Write-Output "----------------Test 9----------------"
# Example 9.
Get-Date -UnixTimeSeconds 1577836800


Write-Output "----------------Test 10----------------"
# Example 10.
Get-TimeZone
(Get-Date -Date "2020-01-01T00:00:00").Kind
Get-Date -Date "2020-01-01T00:00:00"


Write-Output "----------------Test 11----------------"
# Example 11.
# Get date using current culture en-US
(Get-Date 2024-03-19).ToString()

# Get date using invariant culture
"$(Get-Date 2024-03-19)"
