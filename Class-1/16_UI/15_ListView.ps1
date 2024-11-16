###
# WPF ListView in Powershell example.
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
        <ListView x:Name="lstv_hello" Width="100">
            <ListViewItem>Item 1</ListViewItem>
            <ListViewItem>Item 2</ListViewItem>
            <ListViewItem>Item 3</ListViewItem>
        </ListView>
    </StackPanel>
</Window>
"@

Add-Type -Assembly PresentationFramework

$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$Window = [Windows.Markup.XamlReader]::Load($reader)

# ListView.
$listView = $Window.FindName("lstv_hello")

$view1 = New-Object System.Windows.Controls.ListViewItem
$view1.Content = "Item 4"
$listView.Items.Add($view1)

$Window.ShowDialog()
