###
# Test UDP ports example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# List the current UDP connections.
Get-NetUDPEndpoint


Write-Output "----------------Test 2----------------"
# List the open UDP ports.
Get-NetUDPEndpoint -LocalAddress 0.0.0.0


Write-Output "----------------Test 3----------------"
# Sort the output based on the UDP port number.
Get-NetUDPEndpoint -LocalAddress 0.0.0.0 | Sort-Object LocalPort


Write-Output "----------------Test 4----------------"
# List all connections by a specific IP address.
$IP = "192.168.56.1"
$CONNECTIONS = Get-NetUDPEndpoint

Foreach ($I in $CONNECTIONS)
{
    If ($I.LocalAddress -eq $IP)
    {
        $I
    }
}


Write-Output "----------------Test 5----------------"
# List all connections by a UDP port.
$PORT = "137"
$CONNECTIONS = Get-NetUDPEndpoint

Foreach ($I in $CONNECTIONS)
{
    If ($I.LocalPort -eq $PORT)
    {
        $I
    }
}


Write-Output "----------------Test 6----------------"
# List the process name and ID of a local UDP port.
$LOCALPORT = "1900"
$CONNECTIONS = Get-NetUDPEndpoint |
    Select-Object -Property LocalPort,
    @{name='ProcessID';expression={(Get-Process -Id $_.OwningProcess). ID}},
    @{name='ProcessName';expression={(Get-Process -Id $_.OwningProcess). Path}}

Foreach ($I in $CONNECTIONS)
{
    If ($I.LocalPort -eq $LOCALPORT)
    {
        $I
    }
}
