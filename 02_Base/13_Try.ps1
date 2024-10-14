###
# Try catch example.
#
# License - MIT.
###

Write-Host "----------------Test 1----------------"

try {
    $i = 1 + 2
    Write-Host $i
}
catch {
    "An error occurred."
    Write-Host $_
}


Write-Host "----------------Test 2----------------"

try {
    NonsenseString
}
catch {
    "An error occurred."
    Write-Host $_
}


Write-Host "----------------Test 3----------------"

try {
    $i = 1 + 2
    Write-Host $i
}
catch {
    Throw (New-Object System.FormatException)
}
finally {
    $i = 0
}

Write-Host $i
