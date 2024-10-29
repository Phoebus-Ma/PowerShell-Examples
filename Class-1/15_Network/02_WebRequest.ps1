###
# Gets content from a web page on the internet.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Send a web request.
$Response = Invoke-WebRequest -URI https://www.bing.com/search?q=how+many+feet+in+a+mile
$Response.InputFields | Where-Object {
    $_.name -like "* Value*"
} | Select-Object Name, Value


Write-Output "----------------Test 2----------------"
# Use a stateful web service.
$LoginParameters = @{
    Uri             = 'https://www.contoso.com/login/'
    SessionVariable = 'Session'
    Method          = 'POST'
    Body            = @{
        User     = 'jdoe'
        Password = 'P@S$w0rd!'
    }
}
$LoginResponse = Invoke-WebRequest @LoginParameters
$ProfileResponse = Invoke-WebRequest 'https://www.contoso.com/profile/' -WebSession $Session
$LoginResponse
$ProfileResponse


Write-Output "----------------Test 3----------------"
# Get links from a web page.
(Invoke-WebRequest -Uri "https://aka.ms/pscore6-docs").Links.Href


Write-Output "----------------Test 4----------------"
# Write response content to a file using the encoding defined in the requested page.
$Response = Invoke-WebRequest -Uri "https://aka.ms/pscore6-docs"
$Stream = [System.IO.StreamWriter]::new('.\docspage.html', $false, $Response.Encoding)
try {
    $Stream.Write($Response.Content)
} finally {
    $Stream.Dispose()
}


Write-Output "----------------Test 5----------------"
# Submit a multipart/form-data file.
$FilePath = 'c:\document.txt'
$FieldName = 'document'
$ContentType = 'text/plain'

$FileStream = [System.IO.FileStream]::new($filePath, [System.IO.FileMode]::Open)
$FileHeader = [System.Net.Http.Headers.ContentDispositionHeaderValue]::new('form-data')
$FileHeader.Name = $FieldName
$FileHeader.FileName = Split-Path -leaf $FilePath
$FileContent = [System.Net.Http.StreamContent]::new($FileStream)
$FileContent.Headers.ContentDisposition = $FileHeader
$FileContent.Headers.ContentType = [System.Net.Http.Headers.MediaTypeHeaderValue]::Parse($ContentType)

$MultipartContent = [System.Net.Http.MultipartFormDataContent]::new()
$MultipartContent.Add($FileContent)

$Response = Invoke-WebRequest -Body $MultipartContent -Method 'POST' -Uri 'https://api.contoso.com/upload'


Write-Output "----------------Test 6----------------"
# Simplified Multipart/Form-Data Submission.
$Uri = 'https://api.contoso.com/v2/profile'
$Form = @{
    firstName  = 'John'
    lastName   = 'Doe'
    email      = 'john.doe@contoso.com'
    avatar     = Get-Item -Path 'c:\Pictures\jdoe.png'
    birthday   = '1980-10-15'
    hobbies    = 'Hiking','Fishing','Jogging'
}
$Result = Invoke-WebRequest -Uri $Uri -Method Post -Form $Form
$Result


Write-Output "----------------Test 7----------------"
# Catch non success messages from Invoke-WebRequest.
try
{
    $Response = Invoke-WebRequest -Uri "www.microsoft.com/unkownhost"
    # This will only execute if the Invoke-WebRequest is successful.
    $StatusCode = $Response.StatusCode
} catch {
    $StatusCode = $_.Exception.Response.StatusCode.value__
}
$StatusCode


Write-Output "----------------Test 8----------------"
# Download multiple files at the same time.
$baseUri = 'https://github.com/PowerShell/PowerShell/releases/download'
$files = @(
    @{
        Uri = "$baseUri/v7.3.0-preview.5/PowerShell-7.3.0-preview.5-win-x64.msi"
        OutFile = 'PowerShell-7.3.0-preview.5-win-x64.msi'
    },
    @{
        Uri = "$baseUri/v7.3.0-preview.5/PowerShell-7.3.0-preview.5-win-x64.zip"
        OutFile = 'PowerShell-7.3.0-preview.5-win-x64.zip'
    },
    @{
        Uri = "$baseUri/v7.2.5/PowerShell-7.2.5-win-x64.msi"
        OutFile = 'PowerShell-7.2.5-win-x64.msi'
    },
    @{
        Uri = "$baseUri/v7.2.5/PowerShell-7.2.5-win-x64.zip"
        OutFile = 'PowerShell-7.2.5-win-x64.zip'
    }
)

$jobs = @()

foreach ($file in $files) {
    $jobs += Start-ThreadJob -Name $file.OutFile -ScriptBlock {
        $params = $using:file
        Invoke-WebRequest @params
    }
}

Write-Host "Downloads started..."
Wait-Job -Job $jobs

foreach ($job in $jobs) {
    Receive-Job -Job $job
}


Write-Output "----------------Test 9----------------"
# Skipping Header Validation.
$Uri = 'https://httpbin.org/headers'
$InvalidHeaders = @{
    'If-Match' = '12345'
}

Invoke-WebRequest -Uri $Uri -Headers $InvalidHeaders

Invoke-WebRequest -Uri $Uri -Headers $InvalidHeaders -SkipHeaderValidation


Write-Output "----------------Test 10----------------"
# Send a request using HTTP 2.0.
(Invoke-WebRequest -Uri 'https://aka.ms/pscore6-docs' -HttpVersion 2.0).Links.Href


Write-Output "----------------Test 11----------------"
# Send a request to a Unix socket application.
Invoke-WebRequest -Uri "http://localhost/v1.40/images/json/" -UnixSocket "/var/run/docker.sock"
