###
# Restart-computer example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Restart the local computer.
Restart-Computer


Write-Output "----------------Test 2----------------"
# Restart multiple computers.
Restart-Computer -ComputerName Server01, Server02, localhost


Write-Output "----------------Test 3----------------"
# Get computer names from a text file.
Get-Content -Path C:\Domain01.txt | Restart-Computer


Write-Output "----------------Test 4----------------"
# Force restart of computers listed in a text file.
$Names = Get-Content -Path C:\Domain01.txt
$Creds = Get-Credential
Restart-Computer -ComputerName $Names -Credential $Creds -Force


Write-Output "----------------Test 5----------------"
# Restart a remote computer and wait for PowerShell.
Restart-Computer -ComputerName Server01 -Wait -For PowerShell -Timeout 300 -Delay 2


Write-Output "----------------Test 6----------------"
# Restart a computer by using WsmanAuthentication.
Restart-Computer -ComputerName Server01 -WsmanAuthentication Kerberos
