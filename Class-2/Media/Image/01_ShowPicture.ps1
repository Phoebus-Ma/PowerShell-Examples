###
# Display a picture.
#
# License - MIT.
###

param([string]$PicturePath)

if (!$PicturePath)
{
    $PicturePath = "C:\temp\hello.jpg"
}

Add-Type -AssemblyName System.Windows.Forms

$form = New-Object System.Windows.Forms.Form
$pic  = New-Object System.Windows.Forms.PictureBox

$pic.BackColor = [System.Drawing.Color]::Transparent
$pic.Dock = [System.Windows.Forms.DockStyle]::Fill
$pic.ImageLocation = $PicturePath
$pic.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::CenterImage

$form.Controls.Add($pic)

# Display.
$form.ShowDialog() | Out-Null

# Dispose.
$form.Dispose()
