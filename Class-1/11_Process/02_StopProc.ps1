###
# Stops one or more running processes.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Stop all instances of a process.
Stop-Process -Name "notepad"


Write-Output "----------------Test 2----------------"
# Stop a specific instance of a process.
Stop-Process -Id 6316 -Confirm -PassThru


Write-Output "----------------Test 3----------------"
# Stop a process and detect that it has stopped.
calc
Start-Sleep -Seconds 1
$p = Get-Process -Name "CalculatorApp"
Stop-Process -InputObject $p
Get-Process | Where-Object {$_.HasExited}


Write-Output "----------------Test 4----------------"
# Need admin.
# Stop a process not owned by the current user.
Get-Process -Name "lsass" | Stop-Process -Force
