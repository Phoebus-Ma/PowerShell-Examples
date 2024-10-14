###
# Ref example.
#
# License - MIT.
###

Write-Host "----------------Test 1----------------"

Function Test($data)
{
    $data = 3
}

$var = 10
Test -data $var
$var


Write-Host "----------------Test 2----------------"

Function Test2([ref]$data)
{
    $data.Value = 3
}

$var2 = 10
Test2 -data ([ref]$var2)
$var2
