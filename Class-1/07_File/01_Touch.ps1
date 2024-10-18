###
# Create file example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Create a 'hello.txt' file in current directory.
New-Item -Path 'hello.txt' -ItemType File


Write-Output "----------------Test 2----------------"

New-Item -ItemType File -Path .\hello2.txt


Write-Output "----------------Test 3----------------"
# Create 'hello2.txt' and write content to file.
Set-Content -Path "hello3.txt" -Value "Hello World"


Write-Output "----------------Test 4----------------"

Add-Content -Path "hello3.txt" -Value "This is some more text."


Write-Output "----------------Test 5----------------"

4..6 | ForEach-Object {
    New-Item -Path ".\hello-$_.txt" -ItemType File
}


Write-Output "----------------Test 6----------------"

#Get the Timestamp
$Date = Get-Date -Format "yyyyMMdd_HHmmss"

#Create a new file with Timestamp
New-Item -Path ".\" -Name "Log_$Date.txt" -ItemType "File"


Write-Output "----------------Test 7----------------"

"Hello, World!" | Out-File -FilePath .\hello7.txt -Encoding utf8


Write-Output "----------------Test 8----------------"

"How are you today?" | Out-File -FilePath .\hello7.txt -Append -Encoding utf8


Write-Output "----------------Test 9----------------"

"Hello, World!" > hello8.txt
"Nihao, World!" >> hello8.txt


Write-Output "----------------Test 10----------------"

$FilePath = "hello9.txt"
 
#Check if file exists
if (Test-Path $FilePath) {
    Write-host "File '$FilePath' already exists!" -f Yellow
}
Else {
    #Create a new file
    New-Item -Path $FilePath -ItemType "File"
    Write-host "New File '$FilePath' Created!" -f Green
}
