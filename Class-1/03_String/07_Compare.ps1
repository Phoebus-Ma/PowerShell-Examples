###
# Compare string example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
"abc" -eq "abc"                 # Output: True
"abc" -eq "abc", "def"          # Output: False
"abc" -ne "def"                 # Output: True
"abc" -ne "abc"                 # Output: False
"abc" -ne "abc", "def"          # Output: True
"abc", "def" -eq "abc"          # Output: abc
"abc", "def" -ne "abc"          # Output: def
"zzz", "def", "zzz" -eq "zzz"   # Output: zzz zzz


Write-Output "----------------Test 2----------------"
# Date comparison
[DateTime]'2001-11-12' -lt [DateTime]'2020-08-01' # True

# Sorting order comparison
'a' -lt 'z'                     # True; 'a' comes before 'z'
'macOS' -ilt 'MacOS'            # False
'MacOS' -ilt 'macOS'            # False
'macOS' -clt 'MacOS'            # True; 'm' comes before 'M'


Write-Output "----------------Test 3----------------"
$a=' ','`','~','!','@','#','$','%','^','&','*','(',')','_','+','-','=',
   '{','}','[',']',':',';','"','''','\','|','/','?','.','>',',','<'
$a -gt 'a'
# Output: Nothing


Write-Output "----------------Test 4----------------"
"PowerShell" -like    "*shell"           # Output: True
"PowerShell" -notlike "*shell"           # Output: False
"PowerShell" -like    "Power?hell"       # Output: True
"PowerShell" -notlike "Power?hell"       # Output: False
"PowerShell" -like    "Power[p-w]hell"   # Output: True
"PowerShell" -notlike "Power[p-w]hell"   # Output: False

"PowerShell", "Server" -like "*shell"    # Output: PowerShell
"PowerShell", "Server" -notlike "*shell" # Output: Server


Write-Output "----------------Test 5----------------"
# Partial match test, showing how differently -match and -like behave
"PowerShell" -match 'shell'        # Output: True
"PowerShell" -like  'shell'        # Output: False

# Regex syntax test
"PowerShell" -match    '^Power\w+' # Output: True
'bag'        -notmatch 'b[iou]g'   # Output: True


Write-Output "----------------Test 6----------------"
"abc", "def" -contains "def"                  # Output: True
"abc", "def" -notcontains "def"               # Output: False
"Windows", "PowerShell" -contains "Shell"     # Output: False
"Windows", "PowerShell" -notcontains "Shell"  # Output: True
"abc", "def", "ghi" -contains "abc", "def"    # Output: False
"abc", "def", "ghi" -notcontains "abc", "def" # Output: True


Write-Output "----------------Test 7----------------"
"def" -in "abc", "def"                  # Output: True
"def" -notin "abc", "def"               # Output: False
"Shell" -in "Windows", "PowerShell"     # Output: False
"Shell" -notin "Windows", "PowerShell"  # Output: True
"abc", "def" -in "abc", "def", "ghi"    # Output: False
"abc", "def" -notin "abc", "def", "ghi" # Output: True


Write-Output "----------------Test 8----------------"
# Diff.
$set1 = "A","B","C"
$set2 = "C","D","E"
Compare-Object $set1 $set2
