###
# Adds a Microsoft .NET class to a PowerShell session.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Add a .NET type to a session.
$source = @"
public class BasicTest
{
    public static int Add(int a, int b)
    {
        return (a + b);
    }

    public int Multiply(int a, int b)
    {
        return (a * b);
    }
}
"@

Add-Type -TypeDefinition $source

# Call static methods.
[BasicTest]::Add(4, 3)

# Call non-static methods.
$BasicTestObject = New-Object BasicTest
$BasicTestObject.Multiply(5, 2)


Write-Output "----------------Test 2----------------"
# Examine an added type.
# 1.
[BasicTest] | Get-Member

# 2.
[BasicTest] | Get-Member -Static

# 3.
$BasicTestObject | Get-Member


Write-Output "----------------Test 3----------------"
# Add types from an assembly.
Set-Location -Path $PSHOME
$AccType = Add-Type -AssemblyName *jsonschema* -PassThru
