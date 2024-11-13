###
# WPF TextBlock example.
#
# License - MIT.
###

[xml]$xaml = @"
<Window x:Name="MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        Title="MainWindow" Height="450" Width="800">
    <Grid>
        <TextBlock x:Name="tblk_hello" HorizontalAlignment="Center" VerticalAlignment="Center" Margin="0,0,0,0" TextWrapping="Wrap"/>
    </Grid>
</Window>
"@

Add-Type -Assembly PresentationFramework

$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$Window = [Windows.Markup.XamlReader]::Load($reader)

# TextBlock.
$tblk_show = $Window.FindName("tblk_hello")
$tblk_show.Text = "hello world"

$Window.ShowDialog()
