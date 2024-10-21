###
# Cut file example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# This command moves the Test.txt file from the C: drive to the E:\Temp directory
# and renames it from test.txt to tst.txt.
Move-Item -Path C:\test.txt -Destination E:\Temp\tst.txt


Write-Output "----------------Test 2----------------"
# This command moves the C:\Temp directory and its contents to the C:\Logs directory.
# The Temp directory, and all of its subdirectories and files, then appear in the Logs directory.
Move-Item -Path C:\Temp -Destination C:\Logs


Write-Output "----------------Test 3----------------"
# This command moves all of the text files (*.txt) in the current directory
# (represented by a dot (.)) to the C:\Logs directory.
Move-Item -Path .\*.txt -Destination C:\Logs


Write-Output "----------------Test 4----------------"
# This command moves all of the text files from the current directory and
# all subdirectories, recursively, to the C:\TextFiles directory.
Get-ChildItem -Path ".\*.txt" -Recurse | Move-Item -Destination "C:\TextFiles"


Write-Output "----------------Test 5----------------"
# This command moves the registry keys and values within the MyCompany registry key
# in HKLM\Software to the MyNewCompany key.
Move-Item "HKLM:\software\mycompany\*" "HKLM:\software\mynewcompany"


Write-Output "----------------Test 6----------------"
# This command moves the Logs[Sept`06] directory (and its contents) into the Logs[2006] directory.
Move-Item -LiteralPath 'Logs[Sept`06]' -Destination 'Logs[2006]'
