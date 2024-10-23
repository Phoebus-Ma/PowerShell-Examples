###
# Waits until one or all of the PowerShell jobs running in the session are in a terminating state.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Wait for all jobs.
Get-Job | Wait-Job


Write-Output "----------------Test 2----------------"
# Wait until one of several jobs finishes.
Wait-Job -id 1,2,5 -Any


Write-Output "----------------Test 3----------------"
# Wait for a period, then allow job to continue in background.
Wait-Job -Name "DailyLog" -Timeout 120


Write-Output "----------------Test 4----------------"
# Wait for a job by name.
Wait-Job -Name "Job3"


Write-Output "----------------Test 5----------------"
# Wait for jobs on local computer started with Start-Job.
$j = Start-Job -ScriptBlock {Get-ChildItem -Filter *.ps1| Where-Object {$PSItem.LastWriteTime -gt ((Get-Date) - (New-TimeSpan -Days 7))}}
$j | Wait-Job


Write-Output "----------------Test 6----------------"
# Wait for a job that has an ID.
Wait-Job -Id 1


Write-Output "----------------Test 7----------------"
# Wait a job completed.
function Loop10 {
    for ($i = 0; $i -le 10; $i++)
    {
        Start-Sleep -Seconds 1
    }
}

$j = Start-Job -ScriptBlock ${Function:Loop10}
Get-Date
Wait-Job $j
Get-Date
