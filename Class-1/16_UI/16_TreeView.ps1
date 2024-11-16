###
# WPF TreeView in Powershell example.
#
# License - MIT.
###

[xml]$xaml = @"
<Window x:Name="MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        Title="MainWindow" Height="450" Width="800">
    <StackPanel>
        <TreeView x:Name="tview_hello" Width="150">
        <TreeViewItem Header="Level 1"/>
        <TreeViewItem Header="Level 2" IsExpanded="True">
            <TreeViewItem Header="Level 2.1" />
            <TreeViewItem Header="Level 2.2" />
        </TreeViewItem>
        <TreeViewItem Header="Level 3" />
    </TreeView>
    </StackPanel>
</Window>
"@

Add-Type -Assembly PresentationFramework

$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$Window = [Windows.Markup.XamlReader]::Load($reader)

# TreeView.
$treeView = $Window.FindName("tview_hello")

$view1 = New-Object System.Windows.Controls.TreeViewItem
$view1.Header = "Level 4"
$treeView.Items.Add($view1)

$Window.ShowDialog()
