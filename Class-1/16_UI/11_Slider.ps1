###
# WPF slider in powershell example.
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
        <Label x:Name="lbl_hello1" Width="50" Height="30" Content="{Binding ElementName=sld_hello1, Path=Value, UpdateSourceTrigger=PropertyChanged}"/>
        <Label x:Name="lbl_hello2" Width="50" Height="30"/>
        <Slider x:Name="sld_hello1" Width="120" Maximum="100" TickFrequency="10" TickPlacement="TopLeft" IsSnapToTickEnabled="True"/>
    </StackPanel>
</Window>
"@

Add-Type -Assembly PresentationFramework

$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$Window = [Windows.Markup.XamlReader]::Load($reader)

$xaml.SelectNodes("//*[@*[contains(translate(name(.),'n','N'),'Name')]]") | ForEach-Object {
    Set-Variable -Name ($_.Name) -Value $Window.FindName($_.Name)
}

# Slider.
$sld_hello1.Add_ValueChanged({
    $lbl_hello2.Content = $sld_hello1.Value.toString() + "%"
})

$Window.ShowDialog()
