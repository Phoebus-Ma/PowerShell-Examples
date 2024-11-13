###
# WPF RadioButton example.
#
# License - MIT.
###

[xml]$xaml = @"
<Window x:Name="MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        Title="MainWindow" Height="450" Width="800">
    <StackPanel x:Name='stack_hello'>
        <RadioButton x:Name="rbtn_hello1" GroupName="rbtn_g1" Content="Item 1"/>
        <RadioButton x:Name="rbtn_hello2" GroupName="rbtn_g1" Content="Item 2"/>
        <RadioButton x:Name="rbtn_hello3" GroupName="rbtn_g1" Content="Item 3"/>
        <Separator/>
        <TextBox x:Name='tbox_hello1'/>
        <TextBox x:Name='tbox_hello2'/>
    </StackPanel>
</Window>
"@

Add-Type -Assembly PresentationFramework

$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$Window = [Windows.Markup.XamlReader]::Load($reader)

$xaml.SelectNodes("//*[@*[contains(translate(name(.),'n','N'),'Name')]]") | ForEach-Object {
    Set-Variable -Name ($_.Name) -Value $Window.FindName($_.Name)
}

# RadioButton.
$rbtn_hello1.Add_Checked({
    $tbox_hello1.Text = $rbtn_hello1.Name + "," + $rbtn_hello1.IsChecked
})

# TextBox.
[System.Windows.RoutedEventHandler]$Script:CheckedEventHandler = {
    $tbox_hello2.Text = $_.source.Name
}

$stack_hello.AddHandler([System.Windows.Controls.RadioButton]::CheckedEvent, $CheckedEventHandler)

$Window.ShowDialog()
