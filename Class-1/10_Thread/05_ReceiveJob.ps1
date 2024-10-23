###
# Gets the results of the PowerShell background jobs in the current session.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Get results for a particular job.
$job = Start-Job -ScriptBlock {Get-Process}
Start-Sleep -Seconds 1
Receive-Job -Job $job


Write-Output "----------------Test 2----------------"
# Use the Keep parameter.
$job = Start-Job -ScriptBlock {Get-Service dhcp}
Start-Sleep -Seconds 1
$job | Receive-Job -Keep


Write-Output "----------------Test 3----------------"
# Access child jobs.
Start-Job -Name TestJob -ScriptBlock {Get-ChildItem C:\, Z:\}
Receive-Job -Name TestJob
