###
# Passing arguments to the script.
#
# License - MIT.
###

Param(
    [parameter(Mandatory=$true)][string]$Name,
    [parameter(Mandatory=$true)][int32]$Age,
    [parameter(Mandatory=$false)][string]$Sex = "male",
    [parameter(Mandatory=$false)][switch]$Student
)

Write-Host "name: $Name, age: $Age, sex: $Sex."

if ($Student) {
    Write-Host "$Name is a student."
}
