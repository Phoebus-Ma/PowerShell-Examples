###
# Creates background jobs similar to the Start-Job cmdlet.
#
# License - MIT.
###

#
# Run in powershell:
# Install-Module -Scope CurrentUser ThreadJob
#

Write-Output "----------------Test 1----------------"
# Create background jobs with a thread limit of 2.
Start-ThreadJob -ScriptBlock { 1..100 | ForEach-Object { Start-Sleep 1; "Output $_" } } -ThrottleLimit 2
Start-ThreadJob -ScriptBlock { 1..100 | ForEach-Object { Start-Sleep 1; "Output $_" } }
Start-ThreadJob -ScriptBlock { 1..100 | ForEach-Object { Start-Sleep 1; "Output $_" } }
Get-Job


Write-Output "----------------Test 2----------------"
# Compare the performance of Start-Job and Start-ThreadJob.
Measure-Command {1..5 | ForEach-Object {Start-Job {Start-Sleep 1}} | Wait-Job} | Select-Object TotalSeconds
Measure-Command {1..5 | ForEach-Object {Start-ThreadJob {Start-Sleep 1}} | Wait-Job} | Select-Object TotalSeconds


Write-Output "----------------Test 3----------------"
# Create jobs using InputObject.
$j = Start-ThreadJob -InputObject (Get-Process pwsh) -ScriptBlock { $input | Out-String }
$j | Wait-Job | Receive-Job


Write-Output "----------------Test 4----------------"
# Stream job output to parent host.
Start-ThreadJob -ScriptBlock { Read-Host 'Say hello'; Write-Warning 'Warning output' } -StreamingHost $Host


Write-Output "----------------Test 5----------------"
# Download multiple files at the same time.
$baseUri = 'https://github.com/PowerShell/PowerShell/releases/download'
$files = @(
    @{
        Uri = "$baseUri/v7.3.0-preview.5/PowerShell-7.3.0-preview.5-win-x64.msi"
        OutFile = 'PowerShell-7.3.0-preview.5-win-x64.msi'
    },
    @{
        Uri = "$baseUri/v7.3.0-preview.5/PowerShell-7.3.0-preview.5-win-x64.zip"
        OutFile = 'PowerShell-7.3.0-preview.5-win-x64.zip'
    },
    @{
        Uri = "$baseUri/v7.2.5/PowerShell-7.2.5-win-x64.msi"
        OutFile = 'PowerShell-7.2.5-win-x64.msi'
    },
    @{
        Uri = "$baseUri/v7.2.5/PowerShell-7.2.5-win-x64.zip"
        OutFile = 'PowerShell-7.2.5-win-x64.zip'
    }
)

$jobs = @()

foreach ($file in $files) {
    $jobs += Start-ThreadJob -Name $file.OutFile -ScriptBlock {
        $params = $using:file
        Invoke-WebRequest @params
    }
}

Write-Host "Downloads started..."
Wait-Job -Job $jobs

foreach ($job in $jobs) {
    Receive-Job -Job $job
}
