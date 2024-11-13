###
# WPF TextBox example.
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
    <StackPanel HorizontalAlignment="Center" VerticalAlignment="Center">
        <TextBox x:Name="tbox_hello" Width="120" TextWrapping="NoWrap"/>
        <Button x:Name="btn_hello" Content="Click" Width="50"/>
    </StackPanel>
</Window>
"@

Add-Type -Assembly PresentationFramework

$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$Window = [Windows.Markup.XamlReader]::Load($reader)

# TextBox.
$tbox_input = $Window.FindName("tbox_hello")

# Button.
$btn_show = $Window.FindName("btn_hello")
$btn_show.Add_Click({
    [MessageBox]::Show($tbox_input.Text)
})

$Window.ShowDialog()
