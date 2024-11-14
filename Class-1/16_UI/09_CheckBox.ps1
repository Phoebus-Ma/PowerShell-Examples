###
# WPF checkbox in powershell example.
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
    <StackPanel>
        <CheckBox x:Name="cbox_hello1" Content="Item 1"/>
        <CheckBox x:Name="cbox_hello2" Content="Item 2"/>
        <CheckBox x:Name="cbox_hello3" Content="Item 3"/>
        <Button x:Name="btn_hello" Content="Click" Width="50"/>
    </StackPanel>
</Window>
"@

Add-Type -Assembly PresentationFramework

$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$Window = [Windows.Markup.XamlReader]::Load($reader)

$xaml.SelectNodes("//*[@*[contains(translate(name(.),'n','N'),'Name')]]") | ForEach-Object {
    Set-Variable -Name ($_.Name) -Value $Window.FindName($_.Name)
}

# Button.
$btn_hello.Add_Click({
    $ret = "Result: " + $cbox_hello1.IsChecked + "," + $cbox_hello2.IsChecked + "," + $cbox_hello3.IsChecked
    [MessageBox]::Show($ret)
})

$Window.ShowDialog()
