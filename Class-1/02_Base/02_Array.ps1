###
# Array test.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"

$A = 22, 5, 10, 8, 12, 9, 80
$B = ,7
$C = 5..8

Write-Output "A = $A"
Write-Output "A type: $A.GetType()"
Write-Output "B = $B"
Write-Output "C = $C"


Write-Output "----------------Test 2----------------"

$a = @("Hello World")
$a
$a.Count
$a.Length

$b = @()
$b
$b.Count

$c = 0 .. 9
$c[2..-2]


Write-Output "----------------Test 3----------------"

$c = 0..9
foreach ($element in $c) {
    $element
}


Write-Output "----------------Test 4----------------"

$a = @(0..4)
$a += 5
$a


Write-Output "----------------Test 5----------------"

$a = @(
  @(0,1),
  @("b", "c"),
  @(Get-Process)
)

"`$a rank: $($a.Rank)"
"`$a length: $($a.Length)"
"`$a[2] length: $($a[2].Length)"
"Process `$a[2][1]: $($a[2][1].ProcessName)"


Write-Output "----------------Test 6----------------"

[string[,]]$rank2 = [string[,]]::New(3,2)
$rank2.rank
$rank2.Length
$rank2[0,0] = 'a'
$rank2[0,1] = 'b'
$rank2[1,0] = 'c'
$rank2[1,1] = 'd'
$rank2[2,0] = 'e'
$rank2[2,1] = 'f'
$rank2[1,1]


Write-Output "----------------Test 7----------------"

$a = "red",$true
$b = (New-Object 'int[,]' 2,2)
$b[0,0] = 10
$b[0,1] = 20
$b[1,0] = 30
$b[1,1] = 40
$c = $a + $b
$a.GetType().Name
$b.GetType().Name
$c.GetType().Name
$c


Write-Output "----------------Test 8----------------"

[int[]] $intA = 1, 2, 3
$intA.Clear()
$intA


Write-Output "----------------Test 9----------------"

$a = @(0 .. 3)
$a.ForEach({ $_ * $_})


Write-Output "----------------Test 10----------------"

("one", "two", "three").ForEach("ToUpper")
