###
# Alarm shutdown system example.
#
# License - MIT.
###

#
# Example 1:
# .\03_AlarmOff.ps1 12:12
#
# Example 2:
# .\03_AlarmOff.ps1 09:35
#
Param([parameter(Mandatory = $true)][string] $sptime)

$start = (Get-Date -Format "yyyyMMdd-") + $sptime + ":00"

try {
    $start = [datetime]::ParseExact("$start", "yyyyMMdd-HH:mm:ss", $null)
    $current = Get-Date

    if (($start - $current) -lt 0)
    {
        Write-Output ("Needs input time more than current time.")
        return
    }

    while (($start - $current) -gt 0) {
        $current = Get-Date
        Start-Sleep -Seconds 5
    }

    Write-Output("Shutdown...")
    Stop-Computer -Force
}
catch {
    Write-Output ("Input parmeter error, Example:")
    Write-Output (".\03_AlarmOff.ps1 12:12")
    Write-Output (".\03_AlarmOff.ps1 09:35")
}
