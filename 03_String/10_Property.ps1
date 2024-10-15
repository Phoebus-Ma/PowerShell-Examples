###
# Property example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"

Get-Date | Get-Member -MemberType Property -Static


Write-Output "----------------Test 2----------------"

(Get-Service).DisplayName


Write-Output "----------------Test 3----------------"

(Get-Service).Count
(Get-Service Audiosrv).Count


Write-Output "----------------Test 4----------------"

$collection = @(
    [pscustomobject]@{length = "foo"}
    [pscustomobject]@{length = "bar"}
)
# PowerShell returns the collection's Length.
$collection.length


Write-Output "----------------Test 5----------------"

$assoc = New-Object PSObject -Property @{
    Id = 32
    Name = "Slim Shady"
    Owner = "Eminem"
}

Write-Output ($assoc.Id.ToString() + " - "  + $assoc.Name + " - " + $assoc.Owner)
