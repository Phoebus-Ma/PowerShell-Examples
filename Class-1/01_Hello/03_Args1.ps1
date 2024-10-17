###
# Passing arguments to the script.
#
# License - MIT.
###

# Style 1.
$Name = $args[0]
$Age  = $args[1]
$Sex  = $args[2]

Write-Host "name: $Name, age: $Age, sex: $Sex."


# Style 2.
for ( $i = 0; $i -lt $args.count; $i++ ) {
    Write-Host "Argument $i is $($args[$i])"
}
