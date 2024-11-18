###
# String insert in powershell example.
#
# License - MIT.
###

$str  = "i have a phone."

# Result: i have a new phone.
$str.Insert(9, "new ")

# Result: i have a phone.
Write-Output ($str)
