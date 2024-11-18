###
# String substring method example.
#
# License - MIT.
###

$str  = "hello world, happy every day."
$ret  = $str.Substring(13, 5)
$ret2 = $str.Substring(25)

# Result: hello world, happy every day.
Write-Output ($str)
# Result: happy
Write-Output ($ret)
# Result: day.
Write-Output ($ret2)
