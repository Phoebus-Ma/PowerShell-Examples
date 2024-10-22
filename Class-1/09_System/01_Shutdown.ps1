###
# Stop-computer example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Shut down the local computer.
Stop-Computer -ComputerName localhost


Write-Output "----------------Test 2----------------"
# Shut down two remote computers and the local computer.
Stop-Computer -ComputerName "Server01", "Server02", "localhost"


Write-Output "----------------Test 3----------------"
# Shut down remote computers as a background job.
$j = Stop-Computer -ComputerName "Server01", "Server02" "&"
$results = $j | Receive-Job
$results


Write-Output "----------------Test 4----------------"
# Shut down a remote computer.
Stop-Computer -ComputerName "Server01" -WsmanAuthentication Kerberos


Write-Output "----------------Test 5----------------"
# Shut down computers in a domain.
$s = Get-Content -Path ./Domain01.txt
$c = Get-Credential -Credential Domain01\Admin01
Stop-Computer -ComputerName $s -Force -Credential $c
