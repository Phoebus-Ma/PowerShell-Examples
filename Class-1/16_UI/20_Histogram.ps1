###
# WinForms histogram chart in powershell example.
#
# License - MIT.
###

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.windows.Forms.DataVisualization

# Create the chart.
$chart = New-Object System.Windows.Forms.DataVisualization.Charting.Chart
$chart.Width = 500
$chart.Height = 400
$chart.Left = 40

# Create in a chart area.
$chartArea = New-Object System.Windows.Forms.DataVisualization.Charting.ChartArea
$chart.ChartAreas.Add($chartArea)

# Adding data to chart.
$cities = @{
    Beijing = 100; Shanghai = 95; Shenzhen = 90; Wuhan = 85
}

$chart.Series.Add("Data") | Out-Null
$chart.Series["Data"].Points.DataBindXY($cities.Keys, $cities.Values)

# Save image.
$chart.SaveImage((Get-Location).toString() + "\res\HistogramChart.jpeg", "jpeg")

# Create the form.
$form = New-Object System.Windows.Forms.Form
$form.Width = 600
$form.Height = 600
$form.Controls.add($chart)

$form.ShowDialog()
