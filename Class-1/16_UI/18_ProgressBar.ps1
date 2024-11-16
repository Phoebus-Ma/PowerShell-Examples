###
# WPF Progressbar in powershell.
#
# License - MIT.
###

Add-Type -Assembly PresentationFramework

[xml]$xaml = @"
<Window x:Name="MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        Title="MainWindow" Height="450" Width="800">
    <StackPanel>
        <ProgressBar x:Name="pbar_hello" Height="20" Width="200"/>
    </StackPanel>
</Window>
"@

$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$Window = [Windows.Markup.XamlReader]::Load($reader)

# ProgressBar.
$progressBar = $Window.FindName("pbar_hello")

# TODO: Needs add automation update value method.
$progressBar.Value = 95

$Window.ShowDialog()
