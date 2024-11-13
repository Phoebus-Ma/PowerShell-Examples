###
# WPF Button example.
#
# License - MIT.
###

using namespace System.Windows


[xml]$xaml = @"
<Window x:Name="MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        Title="MainWindow" Height="450" Width="800">
    <Grid>
        <Button x:Name="btn_hello" Content="Click" HorizontalAlignment="Center" Margin="0,0,0,0" VerticalAlignment="Center"/>
    </Grid>
</Window>
"@

Add-Type -Assembly PresentationFramework

$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$Window = [Windows.Markup.XamlReader]::Load($reader)

# Button.
$button = $Window.FindName("btn_hello")
$button.Add_Click({
    [MessageBox]::Show("hello world")    
})

$Window.ShowDialog()
