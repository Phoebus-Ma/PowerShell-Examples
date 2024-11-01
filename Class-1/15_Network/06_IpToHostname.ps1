###
# Translate IP address to hostname.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Translate an IP address to a hostname.
Resolve-DnsName 8.8.8.8


Write-Output "----------------Test 2----------------"
# Use a filter to get only the desired columns.
Resolve-DnsName 8.8.8.8 | Select-Object -Property NameHost


Write-Output "----------------Test 3----------------"
# Use a filter to get only the desired columns.
[system.net.dns]::gethostentry('8.8.8.8') | Select-Object -Property HostName, AddressList


Write-Output "----------------Test 4----------------"
# Translate an IP address to a hostname and include the IP address.
$VARIP = "8.8.8.8"
Resolve-DnsName $VARIP | Select-Object -Property @{name='IP';expression={$VARIP}} , NameHost
