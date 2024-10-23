###
# Stops a PowerShell background job.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Run a background function at delay 1s stop job.
function Loop10 {
    for ($i = 0; $i -le 10; $i++)
    {
        Start-Sleep -Seconds 1
    }
}

$j = Start-Job -ScriptBlock ${Function:Loop10}
Start-Sleep -Seconds 1
Stop-job -Job $j


Write-Output "----------------Test 2----------------"
# Stop a background job.
Stop-Job -Name "Job1"


Write-Output "----------------Test 3----------------"
# Stop several background jobs.
Stop-Job -Id 1, 3, 4


Write-Output "----------------Test 4----------------"
# Stop all background jobs.
Get-Job | Stop-Job


Write-Output "----------------Test 5----------------"
# Stop all blocked background jobs.
Stop-Job -State Blocked


Write-Output "----------------Test 6----------------"
# Stop a job by instance ID.
Get-Job | Format-Table ID, Name, Command, @{Label="State";Expression={$_.JobStateInfo.State}},
InstanceID -Auto

# Result:
# Id Name Command                 State  InstanceId
# -- ---- -------                 -----  ----------
# 1 Job1 start-service schedule Running 05abb67a-2932-4bd5-b331-c0254b8d9146
# 3 Job3 start-service schedule Running c03cbd45-19f3-4558-ba94-ebe41b68ad03
# 5 Job5 get-service s*         Blocked e3bbfed1-9c53-401a-a2c3-a8db34336adf
Stop-Job -InstanceId e3bbfed1-9c53-401a-a2c3-a8db34336adf


Write-Output "----------------Test 7---------------"
# Stop a job on a remote computer.
$j = Invoke-Command -ComputerName Server01 -ScriptBlock {Get-EventLog -LogName System} -AsJob
$j | Stop-Job -PassThru
