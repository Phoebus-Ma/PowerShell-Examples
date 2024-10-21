###
# Read file example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Get the content of a text file.
1..100 | ForEach-Object { Add-Content -Path .\LineNumbers.txt -Value "This is line $_." }
Get-Content -Path .\LineNumbers.txt


Write-Output "----------------Test 2----------------"
# Limit the number of lines Get-Content returns.
Get-Content -Path .\LineNumbers.txt -TotalCount 5


Write-Output "----------------Test 3----------------"
# Get a specific line of content from a text file.
(Get-Content -Path .\LineNumbers.txt -TotalCount 25)[-1]


Write-Output "----------------Test 4----------------"
# Get the last line of a text file.
Get-Item -Path .\LineNumbers.txt | Get-Content -Tail 1


Write-Output "----------------Test 5----------------"
# Get raw content.
$raw = Get-Content -Path .\LineNumbers.txt -Raw
$lines = Get-Content -Path .\LineNumbers.txt
Write-Output "Raw contains $($raw.Count) lines."
Write-Output "Lines contains $($lines.Count) lines."


Write-Output "----------------Test 6----------------"
# Use Filters with Get-Content.
Get-Content -Path C:\Temp\* -Filter *.log


Write-Output "----------------Test 7----------------"
# Get the content of an alternate data stream.
Set-Content -Path .\Stream.txt -Value 'This is the content of the Stream.txt file'
# 1.
# Specify a wildcard to the Stream parameter to display all streams of the recently created file.
Get-Item -Path .\Stream.txt -Stream *

# 2.
# # Retrieve the content of the primary stream.
# Note the single quotes to prevent variable substitution.
Get-Content -Path .\Stream.txt -Stream ':$DATA'

# 3.
# Alternative way to get the same content.
Get-Content -Path .\Stream.txt -Stream ""

# 4.
# The primary stream doesn't need to be specified to get the primary stream of the file.
# This gets the same data as the prior two examples.
Get-Content -Path .\Stream.txt

# 5.
# Use the Stream parameter of Add-Content to create a new Stream containing sample content.
$addContentSplat = @{
    Path = '.\Stream.txt'
    Stream = 'NewStream'
    Value = 'Added a stream named NewStream to Stream.txt'
}
Add-Content @addContentSplat

# Use Get-Item to verify the stream was created.
Get-Item -Path .\Stream.txt -Stream *

# 6.
# Retrieve the content of your newly created Stream.
Get-Content -Path .\Stream.txt -Stream NewStream
