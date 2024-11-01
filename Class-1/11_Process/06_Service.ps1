###
# Creates a new Windows service.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Create a service.
New-Service -Name "TestService" -BinaryPathName 'C:\WINDOWS\System32\svchost.exe -k netsvcs'


Write-Output "----------------Test 2----------------"
# Create a service that includes description, startup type, and display name.
$params = @{
    Name = "TestService"
    BinaryPathName = 'C:\WINDOWS\System32\svchost.exe -k netsvcs'
    DependsOn = "NetLogon"
    DisplayName = "Test Service"
    StartupType = "Manual"
    Description = "This is a test service."
}
New-Service @params


Write-Output "----------------Test 3----------------"
# View the new service.
Get-CimInstance -ClassName Win32_Service -Filter "Name='testservice'"


Write-Output "----------------Test 4----------------"
# Set the SecurityDescriptor of a service when creating.
$SDDL = "D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;SU)"
$params = @{
    BinaryPathName = 'C:\WINDOWS\System32\svchost.exe -k netsvcs'
    DependsOn = "NetLogon"
    DisplayName = "Test Service"
    StartupType = "Manual"
    Description = "This is a test service."
    SecurityDescriptorSddl = $SDDL
}
New-Service @params
