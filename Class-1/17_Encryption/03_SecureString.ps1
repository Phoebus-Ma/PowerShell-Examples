###
# Converts a secure string to an encrypted standard string.
#
# License - MIT.
###

$str = "hello world, happy every day."

# Plain text to secure string.
$secureString = ConvertTo-SecureString $str -AsPlainText -Force
Write-Output ("----1: " + $secureString)

# Secure string to AES string.
$StandardString = ConvertFrom-SecureString -SecureString $secureString
Write-Output ("----2: " + $StandardString)

# AES string to secure string.
$secureString2 = ConvertTo-SecureString -String $StandardString
Write-Output ("----3: " + $secureString2)

# Secure string to plain text.
$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($secureString2)
$backPlainText = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
[Runtime.InteropServices.Marshal]::ZeroFreeBSTR($BSTR)
Write-Output ("----4: " + $backPlainText)
