###
# String remove method in powershell example.
#
# License - MIT.
###

$str  = "i have a new phone."

# Result: i have a phone.
$str.Remove(9, 4)

# Result: i have a new phone.
Write-Output ($str)
