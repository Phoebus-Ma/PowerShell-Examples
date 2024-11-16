###
# WPF ListBox in powershell example.
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
        <ListBox x:Name="lbox_hello" Width="100">
            <ListBoxItem>Item 1</ListBoxItem>
            <ListBoxItem>Item 2</ListBoxItem>
            <ListBoxItem>Item 3</ListBoxItem>
        </ListBox>
    </StackPanel>
</Window>
"@

Add-Type -Assembly PresentationFramework

$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$Window = [Windows.Markup.XamlReader]::Load($reader)

# ListBox.
$listBox = $Window.FindName("lbox_hello")
$listBox.Add_SelectionChanged({
    [MessageBox]::Show($listBox.SelectedIndex.toString())
})

$Window.ShowDialog()
