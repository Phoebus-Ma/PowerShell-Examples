###
# Copy file example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# This example copies the mar1604.log.txt file to the C:\Presentation directory.
# The original file isn't deleted.
Copy-Item "C:\Wabash\Logfiles\mar1604.log.txt" -Destination "C:\Presentation"


Write-Output "----------------Test 2----------------"
# This example copies the contents of the C:\Logfiles directory into the existing C:\Drawings directory.
# The Logfiles directory isn't copied.
Copy-Item -Path "C:\Logfiles\*" -Destination "C:\Drawings" -Recurse


Write-Output "----------------Test 3----------------"
# This example copies the contents of the C:\Logfiles source directory and creates a new destination directory.
# The new destination directory, \Logs is created in C:\Drawings..
Copy-Item -Path "C:\Logfiles" -Destination "C:\Drawings\Logs" -Recurse


Write-Output "----------------Test 4----------------"
# This example uses the Copy-Item cmdlet to copy the Get-Widget.ps1 script
# from the \\Server01\Share directory to the \\Server12\ScriptArchive directory.
Copy-Item "\\Server01\Share\Get-Widget.ps1" -Destination "\\Server12\ScriptArchive\Get-Widget.ps1.txt"


Write-Output "----------------Test 5----------------"
# The Copy-Item cmdlet copies test.log from the D:\Folder001 folder to the C:\Folder001_Copy folder
# on the remote computer using the session information stored in the $Session variable.
$Session = New-PSSession -ComputerName "Server01" -Credential "Contoso\User01"
Copy-Item "D:\Folder001\test.log" -Destination "C:\Folder001_Copy\" -ToSession $Session


Write-Output "----------------Test 6----------------"
# The Copy-Item cmdlet copies the D:\Folder002 folder to the C:\Folder002_Copy directory
# on the remote computer using the session information stored in the $Session variable.
$Session = New-PSSession -ComputerName "Server02" -Credential "Contoso\User01"
Copy-Item "D:\Folder002\" -Destination "C:\Folder002_Copy\" -ToSession $Session


Write-Output "----------------Test 7----------------"
# The Copy-Item cmdlet copies the entire contents from the D:\Folder003 folder to the
# C:\Folder003_Copy directory on the remote computer using the session information stored in the $Session variable.
$Session = New-PSSession -ComputerName "Server04" -Credential "Contoso\User01"
Copy-Item "D:\Folder003\" -Destination "C:\Folder003_Copy\" -ToSession $Session -Recurse


Write-Output "----------------Test 8----------------"
# The Copy-Item cmdlet copies scriptingexample.ps1 from the D:\Folder004 folder to the C:\Folder004_Copy folder
# on the remote computer using the session information stored in the $Session variable.
$Session = New-PSSession -ComputerName "Server04" -Credential "Contoso\User01"
Copy-Item "D:\Folder004\scriptingexample.ps1" -Destination "C:\Folder004_Copy\scriptingexample_copy.ps1" -ToSession $Session


Write-Output "----------------Test 9----------------"
# The Copy-Item cmdlet copies test.log from the remote C:\MyRemoteData\ to the local D:\MyLocalData folder
# using the session information stored in the $Session variable.
$Session = New-PSSession -ComputerName "Server01" -Credential "Contoso\User01"
Copy-Item "C:\MyRemoteData\test.log" -Destination "D:\MyLocalData\" -FromSession $Session


Write-Output "----------------Test 10----------------"
# The Copy-Item cmdlet copies the entire contents from the remote C:\MyRemoteData\scripts folder to the local
# D:\MyLocalData folder using the session information stored in the $Session variable.
$Session = New-PSSession -ComputerName "Server01" -Credential "Contoso\User01"
Copy-Item "C:\MyRemoteData\scripts" -Destination "D:\MyLocalData\" -FromSession $Session


Write-Output "----------------Test 11----------------"
# The Copy-Item cmdlet copies the entire contents from the remote C:\MyRemoteData\scripts folder to the local
# D:\MyLocalData\scripts folder using the session information stored in the $Session variable.
$Session = New-PSSession -ComputerName "Server01" -Credential "Contoso\User01"
Copy-Item "C:\MyRemoteData\scripts" -Destination "D:\MyLocalData\scripts" -FromSession $Session -Recurse
