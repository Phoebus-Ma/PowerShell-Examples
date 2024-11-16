###
# RSA in powershell example.
#
# License - MIT.
###

$str = "hello world, happy every day."


# ----------------Step 1----------------
# 1024, 2048, 4096, etc.
$size = "2048"


# ----------------Step 2----------------
$plainBytes = [System.Text.Encoding]::UTF8.GetBytes($str)
$rsa = New-Object System.Security.Cryptography.RSACryptoServiceProvider($size)

# Encryption.
$cipher = $rsa.Encrypt($plainBytes, [System.Security.Cryptography.RSAEncryptionPadding]::Pkcs1)
Write-Output ("Encryption: " + [System.Convert]::ToBase64String($cipher))

# Decryption.
$plain = $rsa.Decrypt($cipher, [System.Security.Cryptography.RSAEncryptionPadding]::Pkcs1)
Write-Output ("Origin: $str")
Write-Output ("Decryption: " + [System.Text.Encoding]::ASCII.GetString($plain))


# ----------------Step 3----------------
# Parameters.
$a = $rsa.ExportParameters($true)
Write-Output ("== RSA Parameters ==")
Write-Output ("E: " + [System.Convert]::ToBase64String($a.Exponent))
Write-Output ("Modulus: " + [System.Convert]::ToBase64String($a.Modulus))
Write-Output ("D: " + [System.Convert]::ToBase64String($a.D))
Write-Output ("P: " + [System.Convert]::ToBase64String($a.P))
Write-Output ("Q: " + [System.Convert]::ToBase64String($a.Q))
