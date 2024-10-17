###
# Html example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# String to html.
ConvertTo-Html -InputObject (Get-Date)


Write-Output "----------------Test 2----------------"
# String to html.
Get-Alias | ConvertTo-Html | Out-File aliases.htm
Invoke-Item aliases.htm


Write-Output "----------------Test 3----------------"
# String to html.
Get-EventLog -Log "Windows PowerShell" | ConvertTo-Html -Property EntryType, InstanceID | Out-File Test1.html


Write-Output "----------------Test 4----------------"
# Html to string.
$HtmlSrc = @'
<html>
    <body>
        <h1 id = "Key1">My First Heading</h1>
        <p>My first paragraph.</p>
    </body>
</html>
'@

$HtmlSrc | Out-File test2.html

$Source = Get-Content -path test2.html -raw
$HTML = New-Object -Com "HTMLFile"
$HTML.IHTMLDocument2_write($Source)

$node = $HTML.all.tags("h1")
# 1.
$node | % id
# 2.
$node | % InnerText
