###
# Renames a computer..
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Rename the local computer.
Rename-Computer -NewName "Server01" -DomainCredential Domain01\Admin01 -Restart


Write-Output "----------------Test 2----------------"
# Rename a remote computer.
Rename-Computer -ComputerName "Srv01" -NewName "Server001" -DomainCredential Domain01\Admin01 -Force
