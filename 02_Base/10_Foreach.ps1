###
# Foreach example.
#
# License - MIT.
###

Write-Host "----------------Test 1----------------"

$letterArray = 'a','b','c','d'
foreach ($letter in $letterArray)
{
    Write-Host $letter
}


Write-Host "----------------Test 2----------------"

foreach ($Proc in Get-Process)
{
    if ($Proc.Id -gt 20000)
    {
        Write-Host $Proc
    }
}
