###
# Write date to file example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Send output and create a file.
Get-Process | Out-File -FilePath .\Process.txt
Get-Content -Path .\Process.txt


Write-Output "----------------Test 2----------------"
# Prevent an existing file from being overwritten.
Get-Process | Out-File -FilePath .\Process.txt -NoClobber


Write-Output "----------------Test 3----------------"
# Send output to a file in ASCII format.
$Procs = Get-Process
Out-File -FilePath .\Process.txt -InputObject $Procs -Encoding ASCII -Width 50


Write-Output "----------------Test 4----------------"
# Use a provider and send output to a file.
Get-ChildItem | Out-File -FilePath .\AliasNames.txt
Get-Content -Path .\AliasNames.txt


Write-Output "----------------Test 5----------------"
# Set file output width for entire scope.
function DemoDefaultOutFileWidth() {
    try {
        $PSDefaultParameterValues['out-file:width'] = 2000

        $logFile = "$pwd\logfile.txt"

        Get-ChildItem Env:\ > $logFile

        Get-Service -ErrorAction Ignore |
            Format-Table -AutoSize |
            Out-File $logFile -Append

        Get-Process | Format-Table Id,SI,Name,Path,MainWindowTitle >> $logFile
    }
    finally {
        $PSDefaultParameterValues.Remove('out-file:width')
    }
}

DemoDefaultOutFileWidth
