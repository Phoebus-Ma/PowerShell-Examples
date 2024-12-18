###
# Encode/decode base64 string.
#
# License - MIT.
###

$str = "hello world, happy every day."

# Encoding string to base64.
$format = [System.Text.Encoding]::Unicode.GetBytes($str)
$outBase64 =[Convert]::ToBase64String($format)
$outBase64

# Decoding from base64 string.
$outStr = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($outBase64))
$outStr
