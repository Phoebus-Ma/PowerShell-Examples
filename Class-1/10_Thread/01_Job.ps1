###
# Starts a PowerShell background job.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Start a background job.
Start-Job -ScriptBlock { Get-Process -Name pwsh }


Write-Output "----------------Test 2----------------"
# Get job information.
$j = Start-Job -ScriptBlock { Get-WinEvent -Log System } -Credential Domain01\User01
$j | Select-Object -Property *


Write-Output "----------------Test 3----------------"
# Run a script as a background job.
Start-Job -FilePath C:\Scripts\Sample.ps1


Write-Output "----------------Test 4----------------"
# Run a function as a background job.
function Loop10 {
    for ($i = 0; $i -le 10; $i++)
    {
        Start-Sleep -Seconds 1
    }
}

$j = Start-Job -ScriptBlock ${Function:Loop10}


Write-Output "----------------Test 5----------------"
# Use the ArgumentList parameter to specify an array.
Start-Job -ScriptBlock { Get-Process -Name $args } -ArgumentList powershell, pwsh, notepad


Write-Output "----------------Test 6----------------"
# Run job in a Windows PowerShell 5.1.
$job = Start-Job -ScriptBlock { $PSVersionTable.PSVersion } -PSVersion 5.1
Receive-Job -Job $job
