###
# Get computer information.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Get all computer properties.
Get-ComputerInfo


Write-Output "----------------Test 2----------------"
# Get all computer version properties.
Get-ComputerInfo -Property "*version"
