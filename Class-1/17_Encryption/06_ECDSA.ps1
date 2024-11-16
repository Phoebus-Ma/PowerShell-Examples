###
# ECDSA in powershell example.
#
# License - MIT.
###

$str = "hello world, happy every day."


# ----------------Step 1----------------
# Configuration.
$hashmethod = "sha512"      # sha256, sha512, etc.
$curvename  = "nistP521"    # nistP256, nistP521, secp256k1, etc.


# ----------------Step 2----------------
# Creates a new instance of an implementation of the ECDSA.
$ecc = [System.Security.Cryptography.ECDsa]::
        Create([System.Security.Cryptography.ECCurve]::CreateFromFriendlyName(($curvename)))

$eccKeyInfo = $ecc.ExportParameters($true)

# Private key.
Write-Output ("== Private key ==")
Write-Output ("D= " + [System.Convert]::ToBase64String($eccKeyInfo.D))

# Public key.
Write-Output ("== Public key ==")
Write-Output ("Qx= " + [System.Convert]::ToBase64String($eccKeyInfo.Q.X))
Write-Output ("Qy= " + [System.Convert]::ToBase64String($eccKeyInfo.Q.Y))


# ----------------Step 3----------------
# String to hash string.
$hash1 = [System.Security.Cryptography.HashAlgorithm]::
        Create($hashmethod).ComputeHash([System.Text.Encoding]::UTF8.GetBytes($str))

# Hash string to ECDSA string.
$ecdsa = [System.Security.Cryptography.ECDsa]::Create($eccKeyInfo);
$ecdsa_sig = $ecdsa.SignHash($hash1)

Write-Output ("ECDSA (Base64): " + [System.Convert]::ToBase64String($ecdsa_sig))


# ----------------Step 4----------------
# Verify.
$ret = $ecdsa.VerifyHash($hash1, $ecdsa_sig)

if ($ret) {
    Write-Output ("Success verification of signature")
}
else {
    Write-Output ("Not successful verification of signature")
}
