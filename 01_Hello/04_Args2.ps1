###
# Passing arguments to the script.
#
# License - MIT.
###

Param($Name, [int] $Age, $Sex = "male")

Write-Host "name: $Name, age: $Age, sex: $Sex."
