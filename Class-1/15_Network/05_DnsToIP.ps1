###
# Translate DNS to IP address.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Translate a DNS entry to an IP address.
Resolve-DnsName -Name dns.google


Write-Output "----------------Test 2----------------"
# Use a filter to get only the desired property.
Resolve-DnsName -Name dns.google | Select-Object -Property Name, IPAddress


Write-Output "----------------Test 3----------------"
# Translate a DNS entry to an IP address.
[system.net.dns]::gethostaddresses('www.bing.com')


Write-Output "----------------Test 4----------------"
# Use a filter to get only the desired columns.
[system.net.dns]::gethostaddresses('www.bing.com') | Select-Object -Property IPAddressToString
