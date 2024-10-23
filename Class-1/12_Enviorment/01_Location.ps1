###
# Gets information about the current working location or a location stack.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Display your current drive location.
Get-Location


Write-Output "----------------Test 2----------------"
# Display your current location for different drives.
Set-Location C:\Windows
Set-Location HKLM:\Software\Microsoft
Set-Location "HKCU:\Control Panel\Input Method"
Get-Location -PSDrive C
Get-Location -PSDrive HKLM
Set-Location C:
Get-Location -PSProvider Registry


Write-Output "----------------Test 3----------------"
# Get locations using stacks.
Push-Location C:\Windows
Push-Location System32
Push-Location WindowsPowerShell -StackName Stack2
Get-Location -Stack
Get-Location -StackName Stack2


Write-Output "----------------Test 4----------------"
# Customize the PowerShell prompt.
function prompt { 'PowerShell: ' + (Get-Location) + '> '}
