###
# Gets PowerShell background jobs that are running in the current session.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Get all background jobs started in the current session.
Get-Job


Write-Output "----------------Test 2----------------"
# Stop a job by using an instance ID.
$j = Get-Job -Name Job1
$ID = $j.InstanceID
$ID
Stop-Job -InstanceId $ID


Write-Output "----------------Test 3----------------"
# Get jobs that include a specific command.
Get-Job -Command "*Get-Process*"


Write-Output "----------------Test 4----------------"
# Get jobs that include a specific command by using the pipeline.
[pscustomobject]@{Command='*Get-Process*'} | Get-Job


Write-Output "----------------Test 5----------------"
# Get jobs that have not been started.
Get-Job -State NotStarted


Write-Output "----------------Test 6----------------"
# Get jobs that have not been assigned a name.
Get-Job -Name Job*


Write-Output "----------------Test 7----------------"
# Use a job object to represent the job in a command.
Start-Job -ScriptBlock {Get-Process} -Name MyJob
$j = Get-Job -Name MyJob
$j


Write-Output "----------------Test 8----------------"
# Get all jobs including jobs started by a different method.
# 1.
Get-Job

# 2.
Get-Job -IncludeChildJob

# 3.
Get-Job -Name Job4 -ChildJobState Failed

# 4.
(Get-Job -Name Job5).JobStateInfo.Reason
