###
# Print message to stdout.
#
# License - MIT.
###

$Msg = "Hello World"

# --------------------------------
# Display.
$Msg

# --------------------------------
# Display.
Write-Output $Msg
Write-Output $Msg
$Msg | Write-Output

# --------------------------------
# Dispaly.
Write-Host $Msg
Write-Host $Msg -ForegroundColor Red -BackgroundColor White

# --------------------------------
# No display.
Write-Verbose $Msg

# --------------------------------
# Display.
$VerbosePreference = "Continue"
Write-Verbose $Msg

# --------------------------------
# No display.
Write-Information $Msg

# Display.
Write-Information $Msg -InformationAction Continue

# Display.
$InformationPreference = "Continue"
Write-Information $Msg

# --------------------------------
# No display.
Write-Debug $Msg

# Display.
$DebugPreference = "Continue"
Write-Debug $Msg

# --------------------------------
# Display.
Write-Warning $Msg

# --------------------------------
# Display the red color string.
Write-Error $Msg

# Display.
$name = "Tom"
$age  = 18
Write-Debug ("Name: {0}, Age: {1}" -f $name, $age)
