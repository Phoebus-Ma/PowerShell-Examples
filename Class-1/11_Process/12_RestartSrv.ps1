###
# Stops and then starts one or more services.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Restart a service on the local computer.
Restart-Service -Name winmgmt


Write-Output "----------------Test 2----------------"
# Exclude a service.
Restart-Service -DisplayName "net*" -Exclude "net logon"


Write-Output "----------------Test 3----------------"
# Start all stopped network services.
Get-Service -Name "net*" | Where-Object {$_.Status -eq "Stopped"} | Restart-Service
