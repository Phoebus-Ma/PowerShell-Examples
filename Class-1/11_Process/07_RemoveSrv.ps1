###
# Removes a Windows service.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Remove a service.
Remove-Service -Name "TestService"


Write-Output "----------------Test 2----------------"
# Remove a service using the display name.
Get-Service -DisplayName "Test Service" | Remove-Service
