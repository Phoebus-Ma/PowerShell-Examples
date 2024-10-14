###
# If else example.
#
# License - MIT.
###

<#
Comparison Operators
    Equality

        -eq, -ieq, -ceq     - equals
        -ne, -ine, -cne     - not equals
        -gt, -igt, -cgt     - greater than
        -ge, -ige, -cge     - greater than or equal
        -lt, -ilt, -clt     - less than
        -le, -ile, -cle     - less than or equal

    Matching

        -like, -ilike, -clike               - string matches wildcard pattern
        -notlike, -inotlike, -cnotlike      - string doesn't match wildcard pattern
        -match, -imatch, -cmatch            - string matches regex pattern
        -notmatch, -inotmatch, -cnotmatch   - string doesn't match regex pattern

    Replacement

        -replace, -ireplace, -creplace      - replaces strings matching a regex pattern

    Containment

        -contains, -icontains, -ccontains   - collection contains a value
        -notcontains, -inotcontains, -cnotcontains - collection doesn't contain a value
        -in                                 - value is in a collection
        -notin                              - value isn't in a collection

    Type

        -is     - both objects are the same type
        -isnot  - the objects aren't the same type
#>

$Week    = 3
$isCheck = $false
$isPlay  = $true

Write-Host "----------------Test 1----------------"

if ($Week -le 4) {
    Write-Host ("It is work day.")
}


Write-Host "----------------Test 2----------------"

if ($isCheck) {
    Write-Host ("Already checked.")
}
elseif ($isPlay) {
    Write-Host ("It is playing.")
}
else {
    Write-Host ("No actite.")
}
