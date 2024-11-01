###
# Stops one or more running services.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Stop a service on the local computer.
Stop-Service -Name "sysmonlog"


Write-Output "----------------Test 2----------------"
# Stop a service by using the display name.
Get-Service -DisplayName "telnet" | Stop-Service


Write-Output "----------------Test 3----------------"
# Stop a service that has dependent services.
Get-Service -Name "iisadmin" | Format-List -Property Name, DependentServices
Stop-Service -Name "iisadmin" -Force -Confirm
