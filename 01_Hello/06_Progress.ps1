###
# Output progress.
#
# License - MIT.
###

for ($i = 0; $i -le 100; $i += 10) {
    Write-Progress -Activity "Search in Progress" -Status "$i% Complete:" -PercentComplete $i
    Start-Sleep -Milliseconds 200
}
