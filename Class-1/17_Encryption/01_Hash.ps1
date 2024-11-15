###
# Get File/String Hash.
#
# License - MIT.
###

<#
    -Algorithm
        SHA1
        SHA256
        SHA384
        SHA512
        MD5
#>

Write-Output "----------------Test 1----------------"
# Compute the hash value for a file.
Get-FileHash "C:\Windows\System32\cmd.exe" | Format-List


Write-Output "----------------Test 2----------------"
# Compute the hash value for an ISO file.
Get-FileHash "C:\Users\Tom\Downloads\python-3.12.7-amd64.exe" -Algorithm MD5 | Format-List


Write-Output "----------------Test 3----------------"
# Compute the hash value of a stream.
$wc = [System.Net.WebClient]::new()
$pkgurl = 'https://github.com/PowerShell/PowerShell/releases/download/v6.2.4/powershell_6.2.4-1.debian.9_amd64.deb'
$publishedHash = '8E28E54D601F0751922DE24632C1E716B4684876255CF82304A9B19E89A9CCAC'
$FileHash = Get-FileHash -InputStream ($wc.OpenRead($pkgurl))
$FileHash.Hash -eq $publishedHash


Write-Output "----------------Test 4----------------"
# Compute the hash of a string.
$stringAsStream = [System.IO.MemoryStream]::new()
$writer = [System.IO.StreamWriter]::new($stringAsStream)
$writer.write("Hello world")
$writer.Flush()
$stringAsStream.Position = 0

Get-FileHash -InputStream $stringAsStream | Select-Object Hash
