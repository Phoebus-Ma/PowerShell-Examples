###
# Run wpf example.
#
# License - MIT.
###

[xml]$xaml = @"
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    x:Name="Window">
    <Grid x:Name="Grid">
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
        </Grid.RowDefinitions>
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="Auto"/>
            <ColumnDefinition Width="Auto"/>
        </Grid.ColumnDefinitions>
        <TextBox x:Name = "PathTextBox"
            Width="150"
            Grid.Column="0"
            Grid.Row="0"
        />
        <Button x:Name = "ValidateButton"
            Content="Validate"
            Grid.Column="1"
            Grid.Row="0"
        />
        <Button x:Name = "RemoveButton"
            Content="Remove"
            Grid.Column="0"
            Grid.Row="1"
        />
    </Grid>
</Window>
"@

Add-Type -Assembly PresentationFramework

$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)
$window.ShowDialog()
