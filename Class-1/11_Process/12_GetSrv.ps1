###
# Gets the services on the computer.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Get all services on the computer.
Get-Service


Write-Output "----------------Test 2----------------"
# Get services that begin with a search string.
Get-Service "wmi*"


Write-Output "----------------Test 3----------------"
# Display services that include a search string.
Get-Service -Displayname "*network*"


Write-Output "----------------Test 4----------------"
# Get services that begin with a search string and an exclusion.
Get-Service -Name "win*" -Exclude "WinRM"


Write-Output "----------------Test 5----------------"
# Display services that are currently active.
Get-Service | Where-Object {$_.Status -eq "Running"}


Write-Output "----------------Test 6----------------"
# List the services on the computer that have dependent services.
Get-Service |
  Where-Object {$_.DependentServices} |
    Format-List -Property Name, DependentServices, @{
      Label="NoOfDependentServices"; Expression={$_.dependentservices.count}
    }


Write-Output "----------------Test 7----------------"
# Sort services by property value.
Get-Service "s*" | Sort-Object status


Write-Output "----------------Test 8----------------"
# Get the dependent services of a service.
Get-Service "WinRM" -RequiredServices


Write-Output "----------------Test 9----------------"
# Get a service through the pipeline operator.
"WinRM" | Get-Service
