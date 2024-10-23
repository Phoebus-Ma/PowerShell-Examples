###
# Gets the current time zone or a list of available time zones.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Get the current time zone.
Get-TimeZone


Write-Output "----------------Test 2----------------"
# Get time zones that match a specified string.
Get-TimeZone -Name "*pac*"


Write-Output "----------------Test 3----------------"
# Get all available time zones.
Get-TimeZone -ListAvailable
