###
# Send key example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Ctrl + V.
[void][System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')
[System.Windows.Forms.SendKeys]::SendWait("^{v}")
