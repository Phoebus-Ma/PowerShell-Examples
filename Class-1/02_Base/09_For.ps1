###
# For loop example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"

for($i=1; $i -le 10; $i++)
{
    Write-Output $i
}


Write-Output "----------------Test 2----------------"

# Comma separated assignment expressions enclosed in parentheses.
for (($i = 0), ($j = 0); $i -lt 10; ($i++), ($j += 2))
{
    "`$i:$i"
    "`$j:$j"
}


Write-Output "----------------Test 3----------------"

# Sub-expression using the semicolon to separate statements.
for ($($i = 0; $j = 0); $i -lt 10; $($i++; $j += 2))
{
    "`$i:$i"
    "`$j:$j"
}


Write-Output "----------------Test 4----------------"

for (($i = 0), ($j = 0); $i -lt 10 -and $j -lt 10; $i++, $j++)
{
    "`$i:$i"
    "`$j:$j"
}


# # Ctrl + C to quit.
# $i = 1
# for (;;)
# {
#     Write-Output $i
# }


Write-Output "----------------Test 5----------------"

$i=1
for(; $i -le 10; $i++)
{
    Write-Output $i
}
