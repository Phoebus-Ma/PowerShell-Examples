###
# String trim method example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Remove spaces from string.
$str = "     hello, world!     "
$ret = $str.Trim()

# Result: [     Hello, World!     ].
Write-Output ($str)
# Result: [Hello, World!]
Write-Output ($ret)


Write-Output "----------------Test 2----------------"
# Let’s consider a string object with a suffix that needs to be removed.
$str = "!@#$ hello world !@#$ happe every day!@#$"
$ret = $str.Trim("!@#$")

# Result: [!@#$ hello world !@#$ happe every day!@#$], length: 41.
Write-Output ($str)
# Result: [ hello world !@#$ happe every day], length: 33.
Write-Output ($ret)


Write-Output "----------------Test 3----------------"
# Let’s say you have a string with a prefix that needs to be removed.
$str = "hello_world"
$key = "hello_"
$ret = $str.TrimStart($key)

# Result: world.
Write-Output ($ret)


Write-Output "----------------Test 4----------------"
# Removing an Unwanted Character.
$str = "[hello, world!]"
$ret = $str.TrimStart("[").TrimEnd("]")

# Result: hello, world!
Write-Output ($ret)


Write-Output "----------------Test 5----------------"
$str = "###hello###world!###"
$ret = $str.Trim('#')

# Result: hello###world!
Write-Output ($ret)


Write-Output "----------------Test 6----------------"
$str = "xxxyyyhello, world!yyyxxx"
$key = @("x","y")
$ret = $str.Trim($key)

# Result: hello, world!.
Write-Output ($ret)


Write-Output "----------------Test 7----------------"
$str = "hello, world!"
$ret1 = $str.TrimStart().Substring(2)
$ret2 = $str.TrimEnd().Substring(0, $str.Length - 2)

# Result: llo, world!
Write-Output ($ret1)
# Result: hello, worl
Write-Output ($ret2)
