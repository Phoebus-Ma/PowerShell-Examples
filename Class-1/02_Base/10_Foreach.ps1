###
# Foreach example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Print array member.
$letterArray = 'a','b','c','d'
foreach ($letter in $letterArray)
{
    Write-Output $letter
}


Write-Output "----------------Test 2----------------"
# Print process id more than 20000.
foreach ($Proc in Get-Process)
{
    if ($Proc.Id -gt 20000)
    {
        Write-Output $Proc
    }
}


Write-Output "----------------Test 3----------------"
# Print 1~10.
1..10 | ForEach-Object {
    Write-Output $_
}
