###
# Base WPF example.
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
        <Label Content="hello world" HorizontalAlignment="Center" VerticalAlignment="Center" Margin="0,0,0,0"/>
    </Grid>
</Window>
"@

Add-Type -Assembly PresentationFramework

$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)
$window.ShowDialog()
