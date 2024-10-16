###
# Start-Sleep example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"

Get-Date; Start-Sleep -Milliseconds 1000; Get-Date


Write-Output "----------------Test 2----------------"
# Sleep 5.5s
Get-Date; Start-Sleep -Seconds 5.5; Get-Date
