###
# Get-PSDrive example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Get drives in the current session.
Get-PSDrive


Write-Output "----------------Test 2----------------"
# Get a drive on the computer.
Get-PSDrive C


Write-Output "----------------Test 3----------------"
# Get all the drives that are supported by the Windows PowerShell file system provider.
Get-PSDrive -PSProvider FileSystem


Write-Output "----------------Test 4----------------"
# Check to see if a drive is in use as a Windows PowerShell drive name.
if (Get-PSDrive X -ErrorAction SilentlyContinue) {
    Write-Host 'The X: drive is already in use.'
} else {
    New-PSDrive -Name X -PSProvider Registry -Root HKLM:\SOFTWARE
}


Write-Output "----------------Test 5----------------"
# Compare the types of files system drives.
# 1.
Get-PSDrive -PSProvider FileSystem

# 2.
net use

# 3.
[System.IO.DriveInfo]::GetDrives() | Format-Table

# 4.
Get-CimInstance -Class Win32_LogicalDisk

# 5.
Get-CimInstance -Class Win32_NetworkConnection
