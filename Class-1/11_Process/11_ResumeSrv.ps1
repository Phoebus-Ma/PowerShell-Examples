###
# Resumes one or more suspended (paused) services.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Resume a service on the local computer.
Resume-Service "sens"


Write-Output "----------------Test 2----------------"
# Resume all suspended services.
Get-Service | Where-Object {$_.Status -eq "Paused"} | Resume-Service
