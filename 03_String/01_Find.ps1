###
# Find string example.
#
# License - MIT.
###

Write-Host "----------------Test 1----------------"

'Hello', 'HELLO' | Select-String -Pattern 'HELLO' -CaseSensitive -SimpleMatch


Write-Host "----------------Test 2----------------"

Get-Alias | Out-File -FilePath .\Alias.txt
Get-Command | Out-File -FilePath .\Command.txt
Select-String -Path .\*.txt -Pattern 'Get-'


Write-Host "----------------Test 3----------------"

$Events = Get-WinEvent -LogName Application -MaxEvents 50
$Events | Select-String -InputObject {$_.message} -Pattern 'Failed'
