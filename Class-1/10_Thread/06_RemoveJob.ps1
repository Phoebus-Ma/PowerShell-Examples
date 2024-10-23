###
# Deletes a PowerShell background job.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Delete a job by using its name.
$batch = Get-Job -Name Job1
$batch | Remove-Job


Write-Output "----------------Test 2----------------"
# Delete all jobs in a session.
Get-job | Remove-Job


Write-Output "----------------Test 3----------------"
# Delete NotStarted jobs.
Remove-Job -State NotStarted


Write-Output "----------------Test 4----------------"
# Delete jobs by using a friendly name.
Remove-Job -Name *batch -Force


Write-Output "----------------Test 5----------------"
# Delete a job that was created by Invoke-Command.
$job = Invoke-Command -ComputerName Server01 -ScriptBlock {Get-Process} -AsJob
$job | Remove-Job
