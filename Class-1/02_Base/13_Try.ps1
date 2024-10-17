###
# Try catch example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"

try {
    $i = 1 + 2
    Write-Output $i
}
catch {
    "An error occurred."
    Write-Output $_
}


Write-Output "----------------Test 2----------------"

try {
    NonsenseString
}
catch {
    "An error occurred."
    Write-Output $_
}


Write-Output "----------------Test 3----------------"

try {
    $i = 1 + 2
    Write-Output $i
}
catch {
    Throw (New-Object System.FormatException)
}
finally {
    $i = 0
}

Write-Output $i
