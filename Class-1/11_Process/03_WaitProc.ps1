###
# Waits for the processes to be stopped before accepting more input.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Stop a process and wait.
$nid = (Get-Process notepad).id
Stop-Process -Id $nid
Wait-Process -Id $nid


Write-Output "----------------Test 2----------------"
# Specifying a process.
$p = Get-Process notepad
Wait-Process -Id $p.id
Wait-Process -Name "notepad"
Wait-Process -InputObject $p


Write-Output "----------------Test 3----------------"
# Wait for processes for a specified time.
Wait-Process -Name outlook, winword -Timeout 30
