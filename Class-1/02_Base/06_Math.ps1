###
# Mathematics operations.
#
# License - MIT.
###

$r1 = [Math]::Round(5 / 2, [MidpointRounding]::AwayFromZero)
$r2 = [int][Math]::Ceiling(5 / 2)
$r3 = [int][Math]::Floor(5 / 2)

# Result = 3, 3, 2.
Write-Host ("Result = $r1, $r2, $r3.")
