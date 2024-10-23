###
# Starts one or more processes on the local computer.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Start a process that uses default values.
Start-Process -FilePath "sort.exe"


Write-Output "----------------Test 2----------------"
# Start a process to sort items to a new file.
# This example starts a process that sorts items in the TestSort.txt file
# and returns the sorted items in the Sorted.txt files. Any errors are
# written to the SortError.txt file. The UseNewEnvironment parameter specifies
# that the process runs with its own environment variables.
$processOptions = @{
    FilePath = "sort.exe"
    RedirectStandardInput = "TestSort.txt"
    RedirectStandardOutput = "Sorted.txt"
    RedirectStandardError = "SortError.txt"
    UseNewEnvironment = $true
}

Start-Process @processOptions


Write-Output "----------------Test 3----------------"
# Start a process in a maximized window.
Start-Process -FilePath "notepad" -Wait -WindowStyle Maximized


Write-Output "----------------Test 4----------------"
# Start PowerShell as an administrator.
Start-Process -FilePath "powershell" -Verb RunAs


Write-Output "----------------Test 5----------------"
# Using different verbs to start a process.
$startExe = New-Object System.Diagnostics.ProcessStartInfo -Args powershell.exe
$startExe.verbs


Write-Output "----------------Test 6----------------"
# Specifying arguments to the process.
Start-Process -FilePath "$env:comspec" -ArgumentList "/c dir `"%SystemDrive%\Program Files`""
Start-Process -FilePath "$env:comspec" -ArgumentList "/c","dir","`"%SystemDrive%\Program Files`""
