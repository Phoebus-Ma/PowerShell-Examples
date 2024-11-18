###
# Concatenation string example.
#
# License - MIT.
###

# ------------------------Test 1------------------------
$str = "Hello" + " World"
$str += " !"
$str


# ------------------------Test 2------------------------
$string1 = "I really hope"
$string2 = "that you are having a great day"

# 1.
$string1,$string2 -join " - "

# 2.
[string]::Join(', ',$string1,$string2)


# ------------------------Test 3------------------------
$string1 = "Hello"
$string2 = "World"
$result = [string]::Concat($string1, $string2)
$result


# ------------------------Test 4------------------------
$strings = "One", "Two", "Three"
$delimiter = "-"
$result2 = [string]::Join($delimiter, $strings)
$result2


# ------------------------Test 5------------------------
$Array = @("apple", "banana", "orange")
$String = $Array -join ', '
Write-Output $String


# ------------------------Test 6------------------------
$name = "John"
$age = 18
$message = "He name is {0} and I am {1} years old." -f $name, $age
$message


# ------------------------Test 7------------------------
$parentPath = "C:\Users\UserName"
$childPaths = "Documents", "Pictures", "Downloads", "Temp"
$fullPaths = $childPaths | ForEach-Object { Join-Path -Path $parentPath -ChildPath $_ }
$fullPaths | ForEach-Object { Write-Output $_ }


# ------------------------Test 8------------------------
$name = "John"
$city = "London"

"Hello $name, welcome to $city!"


# ------------------------Test 9------------------------
$x = 10
$y = 20
$sum = "The sum of $x and $y is $($x + $y)"
Write-Host $sum
