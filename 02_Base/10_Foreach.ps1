###
# Foreach example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"

$letterArray = 'a','b','c','d'
foreach ($letter in $letterArray)
{
    Write-Output $letter
}


Write-Output "----------------Test 2----------------"

foreach ($Proc in Get-Process)
{
    if ($Proc.Id -gt 20000)
    {
        Write-Output $Proc
    }
}
