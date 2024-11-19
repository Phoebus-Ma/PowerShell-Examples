###
# Write excel file in powershell example.
#
# Ref: <https://www.powershellgallery.com/packages/ImportExcel/6.0.0/Content/Export-Excel.ps1>
#
# License - MIT.
###

# Note, needs install module:
# Install-Module -Name ImportExcel

$file = ".\res\ExcelFile.xlsx"

$order = @(
    [PSCustOmobject]@{
        Time = "12:34:56"
        Usage = 0.56
    },

    [PSCustOmobject]@{
        Time = "12:34:57"
        Usage = 1.23
    },

    [PSCustOmobject]@{
        Time = "12:34:58"
        Usage = 1.76
    }
)

# Write data to file.
$order | Export-Excel -Path $file
