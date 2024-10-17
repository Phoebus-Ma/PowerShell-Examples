###
# Do example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Do...While.
$x = 1, 2, 78, 0

do {
    $count++; $a++;
} while ($x[$a] -ne 0)

$count


Write-Output "----------------Test 2----------------"
# Do...Until.
$x2 = 1, 2, 78, 0

do {
    $count2++; $a2++;
} until ($x2[$a2] -eq 0)

$count2
