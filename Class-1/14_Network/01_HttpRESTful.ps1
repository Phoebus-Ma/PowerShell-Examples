###
# Sends an HTTP or HTTPS request to a RESTful web service.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Get the PowerShell RSS feed.
Invoke-RestMethod -Uri https://blogs.msdn.microsoft.com/powershell/feed/ |
  Format-Table -Property Title, pubDate


Write-Output "----------------Test 2----------------"
# Run a POST request.
$Cred = Get-Credential
$Url = "https://server.contoso.com:8089/services/search/jobs/export"
$Body = @{
    search = "search index=_internal | reverse | table index,host,source,sourcetype,_raw"
    output_mode = "csv"
    earliest_time = "-2d@d"
    latest_time = "-1d@d"
}
Invoke-RestMethod -Method 'Post' -Uri $url -Credential $Cred -Body $body -OutFile output.csv


Write-Output "----------------Test 3----------------"
# Follow relation links.
$url = 'https://api.github.com/repos/powershell/powershell/issues'
Invoke-RestMethod $url -FollowRelLink -MaximumFollowRelLink 2


Write-Output "----------------Test 4----------------"
# Simplified Multipart/Form-Data Submissionx.
$Uri = 'https://api.contoso.com/v2/profile'
$Form = @{
    firstName  = 'John'
    lastName   = 'Doe'
    email      = 'john.doe@contoso.com'
    avatar     = Get-Item -Path 'c:\Pictures\jdoe.png'
    birthday   = '1980-10-15'
    hobbies    = 'Hiking','Fishing','Jogging'
}
$Result = Invoke-RestMethod -Uri $Uri -Method Post -Form $Form
$Result


Write-Output "----------------Test 5----------------"
# Pass multiple headers.
$headers = @{
    'userId' = 'UserIDValue'
    'token' = 'TokenValue'
}
Invoke-RestMethod -Uri $uri -Method Post -Headers $headers -Body $body


Write-Output "----------------Test 6----------------"
# Enumerate returned items on the pipeline.
$uri = 'https://api.github.com/repos/microsoftdocs/powershell-docs/issues'
$x = 0
Invoke-RestMethod -Uri $uri | ForEach-Object { $x++ }
$x

$x = 0
(Invoke-RestMethod -Uri $uri) | ForEach-Object { $x++ }
$x

$x = 0
Invoke-RestMethod -Uri $uri | Write-Output | ForEach-Object { $x++ }
$x


Write-Output "----------------Test 7----------------"
# Skipping Header Validation.
$Uri = 'https://httpbin.org/headers'
$InvalidHeaders = @{
    'If-Match' = '12345'
}

Invoke-RestMethod -Uri $Uri -Headers $InvalidHeaders

Invoke-RestMethod -Uri $Uri -Headers $InvalidHeaders -SkipHeaderValidation |
    Format-List


Write-Output "----------------Test 8----------------"
# Send a request using HTTP 2.0.
$uri = 'https://api.github.com/repos/microsoftdocs/powershell-docs/issues'
Invoke-RestMethod -Uri $uri -HttpVersion 2.0 -SkipCertificateCheck


Write-Output "----------------Test 9----------------"
# Send a request to a Unix socket application.
Invoke-RestMethod -Uri "http://localhost/v1.40/images/json/" -UnixSocket "/var/run/docker.sock"
