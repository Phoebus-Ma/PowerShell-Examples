###
# Run alarm shutdown example.
#
# License - MIT.
###

# Example:
# .\16_AlarmOff2.ps1 19:00
Param([parameter(Mandatory = $true)][string] $sptime)

$start = (Get-Date -Format "yyyyMMdd-") + $sptime + ":00"

try {
    $start = [datetime]::ParseExact("$start", "yyyyMMdd-HH:mm:ss", $null)
    $current = Get-Date

    $totaltime = ($start - $current);

    if ($totaltime -lt 0)
    {
        Write-Output ("Needs input time more than current time.")
        return
    }

    $sec = "-s -t " + [int]$totaltime.TotalSeconds
    $sec

    Start-Process -FilePath "shutdown" -ArgumentList $sec
}
catch {
    Write-Output ("Input parmeter error, Example:")
    Write-Output (".\03_AlarmOff.ps1 12:12")
    Write-Output (".\03_AlarmOff.ps1 09:35")
}
