###
# Run c# code file.
#
# License - MIT.
###

$source = Get-Content -Path "calc.cs"
Add-Type -TypeDefinition "$source"

# Static.
# Call a static method.
[Calcute]::add(4, 3)

# Non-static.
# Create an instance and call an instance method.
$basicTestObject = New-Object Calcute
$basicTestObject.mul(5, 2)
