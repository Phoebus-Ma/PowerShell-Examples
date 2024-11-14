###
# WPF combobox in powershell example.
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
        <TextBlock x:Name="tblk_hello1" TextWrapping="Wrap" Width="120"/>
        <ComboBox x:Name="cbox_hello1" Width="120">
            <ComboBoxItem IsSelected="True">Item 1</ComboBoxItem>
            <ComboBoxItem>Item 2</ComboBoxItem>
            <ComboBoxItem>Item 3</ComboBoxItem>
        </ComboBox>
    </StackPanel>
</Window>
"@

Add-Type -Assembly PresentationFramework

$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$Window = [Windows.Markup.XamlReader]::Load($reader)

$xaml.SelectNodes("//*[@*[contains(translate(name(.),'n','N'),'Name')]]") | ForEach-Object {
    Set-Variable -Name ($_.Name) -Value $Window.FindName($_.Name)
}

# ComboBox.
$cbox_hello1.Add_SelectionChanged({
    $tblk_hello1.Text = $cbox_hello1.SelectedIndex + 1
})

$Window.ShowDialog()
