###
# Get the process information.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Get a list of running processes.
Get-Process


Write-Output "----------------Test 2----------------"
# Get information from specific process names..
Get-Process -Name putty*,explorer*,winword*


Write-Output "----------------Test 3----------------"
# Get information from a specific process ID.
Get-Process -id 12345


Write-Output "----------------Test 4----------------"
# Filter the process information to display only specific properties.
Get-Process | Select-Object -Property ID, ProcessName


Write-Output "----------------Test 5----------------"
# Get version information from a process.
Get-Process -Name putty*  -FileVersionInfo


Write-Output "----------------Test 6----------------"
# Needs run as admin.
# Show the owner of a process.
get-process -IncludeUserName -Name calc*,winword*,winlogon*


Write-Output "----------------Test 7----------------"
# List the 3 processes that use the most CPU.
Get-Process | Sort-Object CPU | Select-Object -last 3


Write-Output "----------------Test 8----------------"
# Get a list of processes listening on a TCP port.
Get-NetTCPConnection -State Listen |
Select-Object -Property LocalPort, State,
@{name='ProcessID';expression={(Get-Process -Id $_.OwningProcess). ID}},
@{name='ProcessName';expression={(Get-Process -Id $_.OwningProcess). Path}}


Write-Output "----------------Test 9----------------"
# Get a list of processes and owners listening on a TCP port.
Get-NetTCPConnection -State Listen |
Select-Object -Property LocalPort, State,
@{name='ProcessID';expression={(Get-Process -IncludeUserName -Id $_.OwningProcess). ID}},
@{name='ProcessName';expression={(Get-Process -IncludeUserName -Id $_.OwningProcess). Path}},
@{name='User';expression={(Get-Process -IncludeUserName -Id $_.OwningProcess). Username}} |
Format-Table -Property * -AutoSize |
Out-String -Width 4096


Write-Output "----------------Test 10----------------"
# Get a list of processes and owners for all TCP connections.
Get-NetTCPConnection |
Select-Object -Property LocalPort, State,
@{name='ProcessID';expression={(Get-Process -IncludeUserName -Id $_.OwningProcess). ID}},
@{name='ProcessName';expression={(Get-Process -IncludeUserName -Id $_.OwningProcess). Path}},
@{name='User';expression={(Get-Process -IncludeUserName -Id $_.OwningProcess). Username}} |
Format-Table -Property * -AutoSize | Out-String -Width 4096
