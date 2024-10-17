###
# Logical operations.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# And
(1 -eq 1) -and (1 -eq 2)   # Result is False


Write-Output "----------------Test 2----------------"
# Or
(1 -eq 1) -or (1 -eq 2)    # Result is True


Write-Output "----------------Test 3----------------"
# Not
-not (1 -eq 1)             # Result is False
!(1 -eq 1)                 # Result is False


Write-Output "----------------Test 4----------------"
# Xor
(1 -eq 1) -xor (2 -eq 2)   # Result is False
