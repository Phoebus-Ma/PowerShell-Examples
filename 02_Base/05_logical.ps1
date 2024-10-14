###
# Logical operations.
#
# License - MIT.
###

Write-Host "----------------Test 1----------------"
# And
(1 -eq 1) -and (1 -eq 2)   # Result is False


Write-Host "----------------Test 2----------------"
# Or
(1 -eq 1) -or (1 -eq 2)    # Result is True


Write-Host "----------------Test 3----------------"
# Not
-not (1 -eq 1)             # Result is False
!(1 -eq 1)                 # Result is False


Write-Host "----------------Test 4----------------"
# Xor
(1 -eq 1) -xor (2 -eq 2)   # Result is False
