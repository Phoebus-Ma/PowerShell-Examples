###
# Starts one or more stopped services.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Start a service by using its name.
Start-Service -Name "eventlog"


Write-Output "----------------Test 2----------------"
# Display information without starting a service.
Start-Service -DisplayName *remote* -WhatIf


Write-Output "----------------Test 3----------------"
# Start a service and record the action in a text files.
$s = Get-Service wmi
Start-Service -InputObject $s -PassThru | Format-List >> services.txt


Write-Output "----------------Test 4----------------"
# Start a disabled service.
Set-Service tlntsvr -StartupType manual
Start-Service tlntsvr
