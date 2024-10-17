###
# Replace string example.
#
# License - MIT.
###

# ------------------------Test 1------------------------
$string = 'hello, world'

# 1.
$string.replace('hello','hi')

# 2.
$string.replace('hello','').replace('world','earth')

# 3.
$string -replace 'hello','hi' -replace 'world','earth'


# ------------------------Test 2------------------------
'hello, world' -replace 'hello|hi', 'hey'


# ------------------------Test 3------------------------
$string = "Hello World"
$search = "World"
$replace = "Universe"
$result = $string.Replace($search, $replace)
$result


# ------------------------Test 4------------------------
$string = 'hello, world, OK OK OK!'
$string -replace '(.*), (.*)', '$2,$1'
