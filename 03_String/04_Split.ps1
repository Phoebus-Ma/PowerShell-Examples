###
# Split string example.
#
# License - MIT.
###

# ------------------------Test 1------------------------
-split "red yellow blue green"


# ------------------------Test 2------------------------
$a = -split "red yellow blue green"
$a[1]


# ------------------------Test 3------------------------
"Lastname:FirstName:Address" -split ":"


# ------------------------Test 4------------------------
"Lastname:FirstName:Address" -split "(:)"


# ------------------------Test 5------------------------
"Lastname/:/FirstName/:/Address" -split "/(:)/"


# ------------------------Test 6------------------------
$c = "Mercury,Venus,Earth,Mars,Jupiter,Saturn,Uranus,Neptune"
$c -split ",", 5


# ------------------------Test 7------------------------
$c = 'a,b,c','1,2,3,4,5'
$c -split ',', 3


# ------------------------Test 8------------------------
$c = "Mercury,Venus,Earth,Mars,Jupiter,Saturn,Uranus,Neptune"
$c -split ",", -5


# ------------------------Test 9------------------------
$c = "Mercury,Venus,Earth,Mars,Jupiter,Saturn,Uranus,Neptune"
$c -split {$_ -eq "e" -or $_ -eq "p"}

# ------------------------Test 10------------------------
"1 2", "a b" -split " "
