###
# Suspends (pauses) one or more running services.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Suspend a service.
Suspend-Service -DisplayName "Telnet"


Write-Output "----------------Test 2----------------"
# Display what would happen if you suspend services.
Suspend-Service -Name lanman* -WhatIf


Write-Output "----------------Test 3----------------"
# Get and suspend a service.
Get-Service schedule | Suspend-Service


Write-Output "----------------Test 4----------------"
# Suspend all services that can be suspended.
Get-Service | Where-Object {$_.CanPauseAndContinue -eq "True"} | Suspend-Service -Confirm
