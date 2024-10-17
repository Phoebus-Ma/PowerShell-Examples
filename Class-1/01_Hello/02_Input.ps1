###
# Read data and display.
#
# License - MIT.
###


$Data1 = Read-Host "Please enter"
Write-Output $Data1

# Secure string
$Data2 = Read-Host -AsSecureString "Please enter"
Write-Output $Data2

# Mask input.
$Data3 = Read-Host -MaskInput "Please enter"
Write-Output $Data3

# Prompt.
$Data4 = Read-Host -Prompt "Please enter"
Write-Output $Data4
