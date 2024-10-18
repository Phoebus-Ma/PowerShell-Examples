###
# Compress archive examples.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"

$compress = @{
    Path = "C:\Reference\Draftdoc.docx", "C:\Reference\Images\*.vsd"
    CompressionLevel = "Fastest"
    DestinationPath = "C:\Archives\Draft1.zip"
}

Compress-Archive @compress


Write-Output "----------------Test 2----------------"

$compress = @{
    LiteralPath = "C:\Reference\Draft Doc.docx", "C:\Reference\Images\diagram2.vsd"
    CompressionLevel = "Fastest"
    DestinationPath = "C:\Archives\Draft2.zip"
}

Compress-Archive @compress


Write-Output "----------------Test 3----------------"
# Includes the root directory.
Compress-Archive -Path C:\Reference -DestinationPath C:\Archives\Draft3.zip


Write-Output "----------------Test 4----------------"
# Excludes the root directory.
Compress-Archive -Path C:\Reference\* -DestinationPath C:\Archives\Draft4.zip


Write-Output "----------------Test 5----------------"

Compress-Archive -Path C:\Reference\*.* -DestinationPath C:\Archives\Draft5.zip


Write-Output "----------------Test 6----------------"

Get-ChildItem -Path C:\Reference\Afile.txt, C:\Reference\Images\Bfile.txt |
    Compress-Archive -DestinationPath C:\Archives\PipelineFiles1.zip


Write-Output "----------------Test 7----------------"

Get-ChildItem -Path C:\LogFiles | Compress-Archive -DestinationPath C:\Archives\PipelineDir2.zip


Write-Output "----------------Test 8----------------"

Get-ChildItem -Path C:\TestLog -Recurse |
    Compress-Archive -DestinationPath C:\Archives\PipelineRecurse.zip


Write-Output "----------------Test 9----------------"

Compress-Archive -Path C:\Reference -Update -DestinationPath C:\Archives\Draft6.zip
