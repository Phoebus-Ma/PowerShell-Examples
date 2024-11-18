###
# Format string in powershell example.
#
# License - MIT.
###

$str = "hello world"

Write-Output "----------------Test 1----------------"
# Result: hello world
$str


Write-Output "----------------Test 2----------------"
# Result: hello world, happy every day.
Write-Output ("$str, happy every day.")


Write-Output "----------------Test 3----------------"
# Result: $str, happy every day.
Write-Output ('$str, happy every day.')


Write-Output "----------------Test 4----------------"
# Result: The variable is hello world, value is hello world, there are 2 words.
$ret = "The variable is $str, value is {0}, there are {1} words." -f $str, 2
Write-Output ($ret)


Write-Output "----------------Test 5----------------"
# Chinese/English/French.
# Result: [nihao          hello          Bonjour        ]
$a = "nihao"
$b = "hello"
$c = "Bonjour"
$ret = "{0, -15}{1, -15}{2, -15}" -f $a, $b, $c
Write-Output ($ret)


Write-Output "----------------Test 6----------------"
# 31.42%.
"{0:p}" -f 0.31415926
# 31.416%.
"{0:p3}" -f 0.31415926
# 31.41593%.
"{0:p5}" -f 0.31415926


Write-Output "----------------Test 7----------------"
# 3.
"{0:n0}" -f 3.1415
# 3.14.
"{0:n}" -f 3.1415
# 3.142.
"{0:n3}" -f 3.1415
