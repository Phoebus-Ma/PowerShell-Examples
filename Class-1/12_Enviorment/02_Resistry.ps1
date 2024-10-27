###
# Registry example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Listing all subkeys of a registry key.
# 1. show all items directly within a registry key.
Get-ChildItem -Path HKCU:\ | Select-Object Name

# 2. Any of the following commands will list the contents directly under HKCU:.
Get-ChildItem -Path Registry::HKEY_CURRENT_USER
Get-ChildItem -Path Microsoft.PowerShell.Core\Registry::HKEY_CURRENT_USER
Get-ChildItem -Path Registry::HKCU
Get-ChildItem -Path Microsoft.PowerShell.Core\Registry::HKCU
Get-ChildItem HKCU:

# 3. To list all registry keys in HKCU:.
Get-ChildItem -Path HKCU:\ -Recurse

# 4. finds all keys within HKCU:\Software that have no more than
# One subkey and also have exactly four values.
Get-ChildItem -Path HKCU:\Software -Recurse |
    Where-Object {($_.SubKeyCount -le 1) -and ($_.ValueCount -eq 4) }


Write-Output "----------------Test 2----------------"
# Copying keys.
# 1.The following example copies the CurrentVersion subkey
# of HKLM:\SOFTWARE\Microsoft\Windows\ and all of its properties to HKCU:\.
Copy-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion' -Destination HKCU:

# 2. copy all of the contents of a container, you need to specify the Recurse parameter.
Copy-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion' -Destination HKCU: -Recurse


Write-Output "----------------Test 3----------------"
# Creating keys.
# 1. Creating new keys in the registry.
New-Item -Path HKCU:\Software_DeleteMe

# 2. Use a provider-based path to specify a key.
New-Item -Path Registry::HKCU\Software_DeleteMe


Write-Output "----------------Test 4----------------"
# Deleting keys.
Remove-Item -Path HKCU:\Software_DeleteMe
Remove-Item -Path 'HKCU:\key with spaces in the name'


Write-Output "----------------Test 5----------------"
# Removing all keys under a specific key.
# 1. Delete the HKCU:\CurrentVersion subkey.
Remove-Item -Path HKCU:\CurrentVersion

# 2. To delete contained items without prompting.
Remove-Item -Path HKCU:\CurrentVersion -Recurse

# 3. Remove all items within HKCU:\CurrentVersion but not HKCU:\CurrentVersion itself.
Remove-Item -Path HKCU:\CurrentVersion\* -Recurse
