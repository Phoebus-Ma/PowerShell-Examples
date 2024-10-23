###
# Clears the contents of the current user's recycle bin.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Clear all recycle bins.
Clear-RecycleBin


Write-Output "----------------Test 2----------------"
# Clear a specified recycle bin.
Clear-RecycleBin -DriveLetter C


Write-Output "----------------Test 3----------------"
# Clear all recycle bins without confirmation.
Clear-RecycleBin -Force
