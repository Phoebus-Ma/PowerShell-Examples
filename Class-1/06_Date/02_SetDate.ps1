###
# Set date example.
#
# License - MIT.
###

# Need run as admin.
# Suggest: Run on Windows sandbox.

Write-Output "----------------Test 1----------------"
# Example 1: Add three days to the system date.
Set-Date -Date (Get-Date).AddDays(3).AddHours(5)


Write-Output "----------------Test 2----------------"
# Example 2: Set the system clock back 10 minutes.
Set-Date -Adjust -0:10:0 -DisplayHint Time


Write-Output "----------------Test 3----------------"
# Example 3: Set the date and time to a variable value.
$T = Get-Date
Set-Date -Date $T


Write-Output "----------------Test 4----------------"
# Example 4: Add 90 minutes to the system clock.
$90mins = New-TimeSpan -Minutes 90
Set-Date -Adjust $90mins


Write-Output "----------------Test 5----------------"
# Example 5: Change to a specific date and time.
Set-Date '6/11/2024 2:05:55 PM'
