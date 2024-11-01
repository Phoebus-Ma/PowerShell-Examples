###
# Starts, stops, and suspends a service, and changes its properties.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Change a display name.
Set-Service -Name LanmanWorkstation -DisplayName "LanMan Workstation"


Write-Output "----------------Test 2----------------"
# Change the startup type of services.
Set-Service -Name BITS -StartupType Automatic
Get-Service BITS | Select-Object -Property Name, StartType, Status


Write-Output "----------------Test 3----------------"
# Change the description of a service.
Get-CimInstance Win32_Service -Filter 'Name = "BITS"'  | Format-List  Name, Description


Write-Output "----------------Test 4----------------"
# Start a service.
Set-Service -Name WinRM -Status Running -PassThru


Write-Output "----------------Test 5----------------"
# Suspend a service.
Get-Service -Name Schedule | Set-Service -Status Paused


Write-Output "----------------Test 6----------------"
# Stop a service.
$S = Get-Service -Name Schedule
Set-Service -InputObject $S -Status Stopped


Write-Output "----------------Test 7----------------"
# Stop a service on a remote system.
$Cred = Get-Credential
$S = Get-Service -Name Schedule
Invoke-Command -ComputerName server01.contoso.com -Credential $Cred -ScriptBlock {
    Set-Service -InputObject $S -Status Stopped
}


Write-Output "----------------Test 8----------------"
# Change credential of a service.
$credential = Get-Credential
Set-Service -Name Schedule -Credential $credential


Write-Output "----------------Test 9----------------"
# Change the SecurityDescriptor of a service.
$SDDL = "D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;SU)"
Set-Service -Name "BITS" -SecurityDescriptorSddl $SDDL


Write-Output "----------------Test 10----------------"
# Set the startup type for multiple services.
Get-Service SQLWriter,spooler |
    Set-Service -StartupType Automatic -PassThru |
    Select-Object Name, StartType
