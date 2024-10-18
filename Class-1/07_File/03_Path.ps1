###
# Path example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"

Get-Location


Write-Output "----------------Test 2----------------"

Write-Output $PSScriptRoot


Write-Output "----------------Test 3----------------"

(Get-Item .).FullName


Write-Output "----------------Test 4----------------"
# Relative Path.
# File Path
$LogFilePath = "C:\Windows\System32\notepad.exe"
 
# Get the Relative Path of the Log File
$RelativePath = Resolve-Path -Path $LogFilePath -Relative
 
Write-Host "Relative path: $relativePath"


Write-Output "----------------Test 5----------------"

$File = Get-Item -Path "C:\Windows\System32\notepad.exe"
$File | Resolve-Path -Relative


Write-Output "----------------Test 6----------------"

$path = "C:\folder\subfolder\FileName.txt"

#GetFileName from path
$fileName = Split-Path -Path $path -Leaf

Write-Output $FileName


Write-Output "----------------Test 7----------------"

#Parameter with Multiple Paths
$Paths = "C:\Temp\AppLog.txt", "C:\Users\Salaudeen\Desktop\invoice.docx"

#Get File Name from Paths
$Paths | ForEach-Object { Split-Path -Path $_ -Leaf}


Write-Output "----------------Test 8----------------"

$MediaFile = "C:\Media\Movies\movie.mkv"
$Extension = (Split-Path -Path $MediaFile -Leaf) -replace '^.+(\..+)$','$1'
Write-Output $Extension


Write-Output "----------------Test 9----------------"

Get-ChildItem -Path ".\" -File -Filter *.ps1 | Select-Object -ExpandProperty Name


Write-Output "----------------Test 10----------------"

$path = ".\03_Path.ps1"
$fileExists = Test-Path -Path $path
 
if ($fileExists) {
    Write-Host "The file exists."
} else {
    Write-Host "The file does not exist."
}
