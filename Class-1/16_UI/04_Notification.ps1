###
# Powershell toast Notification example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# WinForm.
Add-Type -AssemblyName System.Windows.Forms

$global:balmsg = New-Object System.Windows.Forms.NotifyIcon
$path = (Get-Process -id $pid).Path

$balmsg.Icon            = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
$balmsg.BalloonTipIcon  = [System.Windows.Forms.ToolTipIcon]::Warning
$balmsg.BalloonTipText  = "This is a pop-up message text for the Windows user"
$balmsg.BalloonTipTitle = "Attention $Env:USERNAME"
$balmsg.Visible         = $true
$balmsg.ShowBalloonTip(20000)


Write-Output "----------------Test 2----------------"
# Windows Runtime apps.
$bodyText = 'A single string wrapped across a maximum of three lines of text.'

$ToastText01 = [Windows.UI.Notifications.ToastTemplateType, Windows.UI.Notifications, ContentType = WindowsRuntime]::ToastText01
$TemplateContent = [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime]::GetTemplateContent($ToastText01)
$TemplateContent.SelectSingleNode('//text[@id="1"]').InnerText = $bodyText
$AppId = '{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\WindowsPowerShell\v1.0\powershell.exe'
[Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($AppId).Show($TemplateContent)
