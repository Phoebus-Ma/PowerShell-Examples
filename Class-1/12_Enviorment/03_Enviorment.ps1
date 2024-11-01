###
# Get/Set/Delete/Edit Enviorment example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Create an environment variable.
# "User" or "Machine".
[Environment]::SetEnvironmentVariable("VAR_TEST", "AAAAAAAAAA", "Machine")


Write-Output "----------------Test 2----------------"
# Verify the existence of the environment variable.
[System.Environment]::GetEnvironmentVariable('VAR_TEST', 'machine')


Write-Output "----------------Test 3----------------"
# Delete an environment variable.
[Environment]::SetEnvironmentVariable("VAR_TEST", $null, "Machine")


Write-Output "----------------Test 4----------------"
# Add an environment variable.
$INCLUDE = "C:\tmp"
$OLDPATH = [System.Environment]::GetEnvironmentVariable('PATH','machine')
$NEWPATH = "$OLDPATH;$INCLUDE"
[Environment]::SetEnvironmentVariable("PATH", "$NEWPATH", "Machine")
($env:PATH).split(";")
