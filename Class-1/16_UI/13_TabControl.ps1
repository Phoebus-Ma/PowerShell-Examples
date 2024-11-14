###
# WPF TabControl in PowerShell example.
#
# License - MIT.
###

Add-Type -Assembly PresentationFramework


# Convert a .XAML file to an XMLDocument
function LoadXml ($filename) {
    $XmlLoader = (New-Object System.Xml.XmlDocument)
    $XmlLoader.Load($filename)

    return $XmlLoader
}

# Load the XAML files.
$XmlTabWindow = LoadXml("$PSScriptRoot\Xaml\TabWindow.xaml")
$XmlPage1 = LoadXml("$PSScriptRoot\Xaml\TabPage1.xaml")
$XmlPage2 = LoadXml("$PSScriptRoot\Xaml\TabPage2.xaml")

# Collection storing references to all named WPF controls in the UI.
$UIControls = [hashtable]::Synchronized(@{})

# Convert Windows and Pages to a XAML object graph.
$UIControls.TabWindow = [Windows.Markup.XamlReader]::Load((New-Object -TypeName System.Xml.XmlNodeReader -ArgumentList $XmlTabWindow))
$UIControls.TabPage1  = [Windows.Markup.XamlReader]::Load((New-Object -TypeName System.Xml.XmlNodeReader -ArgumentList $XmlPage1))
$UIControls.TabPage2  = [Windows.Markup.XamlReader]::Load((New-Object -TypeName System.Xml.XmlNodeReader -ArgumentList $XmlPage2))

# Add each named control to the $UIControls hashtable (repeat for each Window / Page).
$XmlTabWindow.SelectNodes("//*[@*[contains(translate(name(.),'n','N'),'Name')]]") | ForEach-Object -Process {
    $UIControls.$($_.Name) = $UIControls.TabWindow.FindName($_.Name)
}

$XmlPage1.SelectNodes("//*[@*[contains(translate(name(.),'n','N'),'Name')]]") | ForEach-Object -Process {
    $UIControls.$($_.Name) = $UIControls.TabPage1.FindName($_.Name)
}

$XmlPage2.SelectNodes("//*[@*[contains(translate(name(.),'n','N'),'Name')]]") | ForEach-Object -Process {
    $UIControls.$($_.Name) = $UIControls.TabPage2.FindName($_.Name)
}

# Add Page to TabControl.
$UIControls.tab_frame1.Content = $UIControls.TabPage1
$UIControls.tab_frame2.Content = $UIControls.TabPage2

# Display main window.
$UIControls.TabWindow.ShowDialog()
