###
# Paly sound example.
#
# License - MIT.
###

param ([string]$audioPath)

if (!$audioPath)
{
    $audioPath = "C:\temp\hello.mp3"
}

Add-Type -AssemblyName presentationCore

$mediaPlayer = New-Object system.windows.media.mediaplayer
$mediaPlayer.Open($audioPath)
$mediaPlayer.Play()

Start-Sleep -Seconds 10
$mediaPlayer.Stop()
