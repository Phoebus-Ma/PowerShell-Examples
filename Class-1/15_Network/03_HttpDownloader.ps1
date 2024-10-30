###
# Download file example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Using Invoke-WebRequest.
Invoke-WebRequest https://www.python.org/ftp/python/3.12.7/python-3.12.7-amd64.exe -OutFile C:\tmp\python-3.12.7-amd64.exe


Write-Output "----------------Test 2----------------"
# Using C#.
(new-object System.Net.WebClient).DownloadFile('https://www.python.org/ftp/python/3.12.7/python-3.12.7-amd64.exe', 'C:\tshark\goku\docs\others\python-3.12.7-amd64.exe')
