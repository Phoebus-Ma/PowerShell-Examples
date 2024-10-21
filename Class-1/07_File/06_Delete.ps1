###
# Delete file example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Delete files that have any file extension.
Remove-Item C:\Test\*.*


Write-Output "----------------Test 2----------------"
# Delete document files in a folder.
Remove-Item * -Include *.doc -Exclude *1*


Write-Output "----------------Test 3----------------"
# Delete hidden, read-only files.
Remove-Item -Path C:\Test\hidden-RO-file.txt -Force


Write-Output "----------------Test 4----------------"
# Delete files in subfolders recursively.
Get-ChildItem * -Include *.csv -Recurse | Remove-Item


Write-Output "----------------Test 5----------------"
# Delete subkeys recursively.
Remove-Item HKLM:\Software\MyCompany\OldApp -Recurse
