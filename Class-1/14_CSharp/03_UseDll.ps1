###
# Using dll file example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Call native Windows APIs.
$Signature = @"
[DllImport("user32.dll")]
public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
"@

$addTypeSplat = @{
    MemberDefinition = $Signature
    Name = "Win32ShowWindowAsync"
    Namespace = 'Win32Functions'
    PassThru = $true
}

$ShowWindowAsync = Add-Type @addTypeSplat

# Minimize the PowerShell console

$ShowWindowAsync::ShowWindowAsync((Get-Process -Id $pid).MainWindowHandle, 2)

# Restore the PowerShell console

$ShowWindowAsync::ShowWindowAsync((Get-Process -Id $Pid).MainWindowHandle, 4)


Write-Output "----------------Test 2----------------"
# Using a dll.
$asm = [System.Reflection.Assembly]::LoadFrom($dllpath)
$cbbtypes = $asm.GetExportedTypes()
$cbbtypes | Get-Member -Static


Write-Output "----------------Test 3----------------"
# Using third-part dll.
[Reflection.Assembly]::LoadFile("d:\sandbox\psdll\MathLib.dll")
[MathLib.Methods]::Sum(10, 2)


Write-Output "----------------Test 4----------------"
# Using third-part dll 2.
$assembly = [Reflection.Assembly]::LoadFile("c:\path\file.dll")

$instance = New-Object Class.Of.Assembly

$instance.Property1 = $variable1
$instance.Property2 = $variable2
$instance.Property3 = $variable3

$result = $instance.function()


Write-Output "----------------Test 5----------------"
# Load dll style.
[Reflection.Assembly]::LoadFile("c:\path\file.dll")
[System.Reflection.Assembly]::LoadFrom('c:\path\file.dll')
Import-Module 'c:\path\file.dll'
Add-Type -Path "C:\path\file.dll"
