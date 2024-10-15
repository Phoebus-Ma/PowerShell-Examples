###
# XML example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# String to xml.
Get-Date | ConvertTo-Xml


Write-Output "----------------Test 2----------------"
# String to xml.
ConvertTo-Xml -As "Document" -InputObject (Get-Date) -Depth 1


Write-Output "----------------Test 3----------------"
# Xml to string.
'
<Computers>
	<Computer name="SRV-01" ip="127.0.0.1" include="true" />
	<Computer name="SRV-02" ip="192.168.96.32" include="false" />
	<Computer name="SRV-03" ip="192.168.96.33" include="true" />
</Computers>
' | Out-File test1.xml

# 1.
Select-Xml -Path test1.xml -XPath '/Computers/Computer' | ForEach-Object { $_.Node.ip }

# 2.
[xml]$xmlElm = Get-Content -Path test1.xml
$xmlElm.Computers.Computer.name
