###
# Test TCP ports example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# List the current TCP connections.
Get-NetTCPConnection


Write-Output "----------------Test 2----------------"
# List the open TCP ports.
Get-NetTCPConnection -State Listen


Write-Output "----------------Test 3----------------"
# Use a filter to get only the desired columns.
Get-NetTCPConnection -State Listen | Select-Object -Property LocalPort, State


Write-Output "----------------Test 4----------------"
# Sort the output based on the TCP port number.
Get-NetTCPConnection -State Listen | Select-Object -Property LocalPort, State | Sort-Object LocalPort


Write-Output "----------------Test 5----------------"
# List all connections to a specific destination IP address.
$REMOTEIP = "127.0.0.1"
$CONNECTIONS = Get-NetTCPConnection

Foreach ($I in $CONNECTIONS)
{
    If ($I.RemoteAddress -eq $REMOTEIP)
    {
        $I
    }
}


Write-Output "----------------Test 6----------------"
# Test the connectivity to the TCP port using Powershell.
Test-NetConnection google.com -Port 80


Write-Output "----------------Test 7----------------"
# Test the connectivity to the TCP port using the quiet mode.
Test-NetConnection google.com -Port 80 -InformationLevel Quiet


Write-Output "----------------Test 8----------------"
# Test the connectivity to the TCP port using older Powershell versions.
(New-Object System.Net.Sockets.TcpClient).ConnectAsync('google.com', 80).Wait(1000)


Write-Output "----------------Test 9----------------"
# Measure the response time of the connectivity to the TCP port.
Measure-Command {Test-NetConnection google.com -Port 80} | ForEach-Object TotalSeconds


Write-Output "----------------Test 10----------------"
# Measure the response time of the connectivity to the TCP port using older Powershell versions.
Measure-Command {(New-Object System.Net.Sockets.TcpClient).ConnectAsync('google.com', 80).Wait(1000)} |
ForEach-Object TotalSeconds
