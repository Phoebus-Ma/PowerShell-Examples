###
# Expand archive examples.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"

Expand-Archive -LiteralPath 'C:\Archives\Draft[v1].zip' -DestinationPath C:\Reference


Write-Output "----------------Test 2----------------"

Expand-Archive -Path Draftv2.zip -DestinationPath C:\Reference
