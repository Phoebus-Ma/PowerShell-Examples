###
# Debugs one or more processes running on the local computer.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Attach a debugger to a process on the computer.
Debug-Process -Name Powershell


Write-Output "----------------Test 2----------------"
# Attach a debugger to all processes that begin with the specified string.
Debug-Process -Name note*


Write-Output "----------------Test 3----------------"
# Attach a debugger to multiple processes.
Debug-Process "Winlogon", "Explorer", "Outlook"


Write-Output "----------------Test 4----------------"
# Attach a debugger to multiple process IDs.
Debug-Process -Id 1132, 2028


Write-Output "----------------Test 5----------------"
# Use Get-Process to get a process then attach a debugger to it.
Get-Process PowerShell | Debug-Process


Write-Output "----------------Test 6----------------"
# Attach a debugger to a current process on the local computer.
Debug-Process -Id $PID


Write-Output "----------------Test 7----------------"
# Attach a debugger to a process that uses the InputObject parameter.
$P = Get-Process PowerShell
Debug-Process -InputObject $P
