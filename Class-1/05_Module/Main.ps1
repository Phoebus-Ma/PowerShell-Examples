###
# Multi file example.
#
# License - MIT.
###

Param( 
    [parameter(Mandatory = $true)][int32]$a,
    [parameter(Mandatory = $true)][int32]$b
)


# Set to true if you need to hang the script at the end to check console output
$Global:debugFlag = $false

# Import the modules and functions    
try {
    Import-Module ".\Calculates.psm1" -ErrorAction Stop
}
catch {
    throw "Failed to import Calculates.psm1"
}

$r1  = Addition       -a $a -b $b
$r2  = Subtraction    -a $a -b $b
$r3  = Multiplication -a $a -b $b
$r4  = Division       -a $a -b $b

# .\Main.ps1 3 2
# Result: 5, 1, 6, 1.5.
Write-Output "Result: $r1, $r2, $r3, $r4."
