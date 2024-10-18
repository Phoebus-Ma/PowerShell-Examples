###
# Create folder example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Create a 'hello' folder in C drive root directory.
New-Item -Path 'C:\hello' -ItemType Directory


Write-Output "----------------Test 2----------------"

$FolderPath = '.\hello2'

if (Test-Path -Path $FolderPath) {
    Write-Host "Folder already exists."
} else {
    New-Item -ItemType Directory -Path $FolderPath
    Write-Host "Folder does not exist."
}


Write-Output "----------------Test 3----------------"

mkdir -Path "hello3"


Write-Output "----------------Test 4----------------"

New-Item -Path .\hello4,.\hello5,.\hello6 -ItemType Directory


Write-Output "----------------Test 5----------------"

$Folders = @("hello7", "hello8", "hello9")

ForEach ($Folder in $Folders) {
    New-Item -ItemType Directory -Path ".\$Folder"
}


Write-Output "----------------Test 6----------------"

10..12 | ForEach-Object { New-Item -ItemType Directory -Path ".\hello$_"}


Write-Output "----------------Test 7----------------"

$date = Get-Date -Format "yyyyMMdd_HHmmss"
New-Item -Path ".\hello_$date" -ItemType Directory
