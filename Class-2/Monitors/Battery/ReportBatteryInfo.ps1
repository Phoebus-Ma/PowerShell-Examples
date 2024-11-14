###
# Report battery information example.
#
# License - MIT.
###

$Charging            = (Get-CimInstance -Namespace "ROOT\WMI" -ClassName "BatteryStatus").Charging
$DesignedCapacity    = (Get-WmiObject   -Namespace "ROOT\WMI" -ClassName "BatteryStaticData").DesignedCapacity
$FullChargedCapacity = (Get-CimInstance -Namespace "ROOT\WMI" -ClassName "BatteryFullChargedCapacity").FullChargedCapacity
$RemainingCapacity   = (Get-CimInstance -Namespace "ROOT\WMI" -ClassName "BatteryStatus").RemainingCapacity
$SerialNumber        = (Get-WmiObject   -Namespace "ROOT\WMI" -ClassName "BatteryStaticData").SerialNumber
$ManufactureName     = (Get-WmiObject   -Namespace "ROOT\WMI" -ClassName "BatteryStaticData").ManufactureName

Write-Output "$Charging, $DesignedCapacity, $FullChargedCapacity, $RemainingCapacity, $SerialNumber, $ManufactureName"
