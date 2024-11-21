###
# WPF multi windows in powershell example.
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
$XmlMainWindow = LoadXml("$PSScriptRoot\res\MainWindow.xaml")
$XmlSecWindow  = LoadXml("$PSScriptRoot\res\SecWindow.xaml")

# Collection storing references to all named WPF controls in the UI.
$UIControls = [hashtable]::Synchronized(@{})

# Convert Windows and Pages to a XAML object graph.
$UIControls.MainWindow = [Windows.Markup.XamlReader]::Load((New-Object -TypeName System.Xml.XmlNodeReader -ArgumentList $XmlMainWindow))
$UIControls.SecWindow  = [Windows.Markup.XamlReader]::Load((New-Object -TypeName System.Xml.XmlNodeReader -ArgumentList $XmlSecWindow))

# Add each named control to the $UIControls hashtable (repeat for each Window / Page).
$XmlMainWindow.SelectNodes("//*[@*[contains(translate(name(.),'n','N'),'Name')]]") | ForEach-Object -Process {
    $UIControls.$($_.Name) = $UIControls.MainWindow.FindName($_.Name)
}

$XmlSecWindow.SelectNodes("//*[@*[contains(translate(name(.),'n','N'),'Name')]]") | ForEach-Object -Process {
    $UIControls.$($_.Name) = $UIControls.SecWindow.FindName($_.Name)
}

# Button.
$UIControls.btn_hello.Add_Click({
    $UIControls.SecWindow.ShowDialog()
})

# Display main window.
$UIControls.MainWindow.ShowDialog()
