###
# Runs commands on local and remote computers..
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Run a script on a server.
Invoke-Command -FilePath c:\scripts\test.ps1 -ComputerName Server01


Write-Output "----------------Test 2----------------"
# Run a command on a remote server.
Invoke-Command -ComputerName Server01 -Credential Domain01\User01 -ScriptBlock {
    Get-Culture
}


Write-Output "----------------Test 3----------------"
# Run a command in a persistent connection.
$s = New-PSSession -ComputerName Server02 -Credential Domain01\User01
Invoke-Command -Session $s -ScriptBlock { Get-Culture }


Write-Output "----------------Test 4----------------"
# Use a session to run a series of commands that share data.
Invoke-Command -ComputerName Server02 -ScriptBlock { $p = Get-Process PowerShell }
Invoke-Command -ComputerName Server02 -ScriptBlock { $p.VirtualMemorySize }
$s = New-PSSession -ComputerName Server02
Invoke-Command -Session $s -ScriptBlock { $p = Get-Process PowerShell }
Invoke-Command -Session $s -ScriptBlock { $p.VirtualMemorySize }


Write-Output "----------------Test 5----------------"
# Invoke a command with a script block stored in a variable.
$command = {
    Get-WinEvent -LogName PowerShellCore/Operational |
      Where-Object -FilterScript { $_.Message -like '*certificate*' }
}
Invoke-Command -ComputerName S1, S2 -ScriptBlock $command


Write-Output "----------------Test 6----------------"
# Run a single command on several computers.
$parameters = @{
    ComputerName      = 'Server01', 'Server02', 'TST-0143', 'localhost'
    ConfigurationName = 'MySession.PowerShell'
    ScriptBlock       = { Get-WinEvent -LogName PowerShellCore/Operational }
}
Invoke-Command @parameters


Write-Output "----------------Test 7----------------"
# Get the version of the host program on multiple computers.
$version = Invoke-Command -ComputerName (Get-Content Machines.txt) -ScriptBlock {
    (Get-Host).Version
}


Write-Output "----------------Test 8----------------"
# Run a background job on several remote computers.
$s = New-PSSession -ComputerName Server01, Server02
Invoke-Command -Session $s -ScriptBlock { Get-EventLog system } -AsJob
$j = Get-Job
$j | Format-List -Property *
$results = $j | Receive-Job


Write-Output "----------------Test 9----------------"
# Include local variables in a command run on a remote computer.
$Log = 'PowerShellCore/Operational'
Invoke-Command -ComputerName Server01 -ScriptBlock {
    Get-WinEvent -LogName $Using:Log -MaxEvents 10
}


Write-Output "----------------Test 10----------------"
# Hide the computer name.
Invoke-Command -ComputerName S1, S2 -ScriptBlock { Get-Process PowerShell }
Invoke-Command -ComputerName S1, S2 -HideComputerName -ScriptBlock {
    Get-Process PowerShell
}


Write-Output "----------------Test 11----------------"
# Use the Param keyword in a script block.
$parameters = @{
    ComputerName = 'Server01'
    ScriptBlock  = {
        Param ($param1, $param2)
        Get-ChildItem -Name $param1 -Include $param2
    }
    ArgumentList = 'a*', '*.pdf'
}
Invoke-Command @parameters


Write-Output "----------------Test 12----------------"
# Use the $args automatic variable in a script block.
$parameters = @{
    ComputerName = 'Server01'
    ScriptBlock  = { Get-ChildItem $args[0] $args[1] }
    ArgumentList = 'C:\Test', '*.txt*'
}
Invoke-Command @parameters


Write-Output "----------------Test 13----------------"
# Run a script on all the computers listed in a text file.
$parameters = @{
    ComputerName = (Get-Content Servers.txt)
    FilePath     = 'C:\Scripts\Sample.ps1'
    ArgumentList = 'Process', 'Service'
}
Invoke-Command @parameters


Write-Output "----------------Test 14----------------"
# Run a command on a remote computer using a URI.
$LiveCred = Get-Credential
$parameters = @{
  ConfigurationName = 'Microsoft.Exchange'
  ConnectionUri     = 'https://ps.exchangelabs.com/PowerShell'
  Credential        = $LiveCred
  Authentication    = 'Basic'
  ScriptBlock       = { Set-Mailbox Dan -DisplayName 'Dan Park' }
}
Invoke-Command @parameters


Write-Output "----------------Test 15----------------"
# Use a session option.
$so = New-PSSessionOption -SkipCACheck -SkipCNCheck -SkipRevocationCheck
$parameters = @{
    ComputerName  = 'server01'
    UseSSL        = $true
    ScriptBlock   = { Get-HotFix }
    SessionOption = $so
    Credential    = 'server01\user01'
}
Invoke-Command @parameters


Write-Output "----------------Test 16----------------"
# Manage URI redirection in a remote command.
$max = New-PSSessionOption -MaximumRedirection 1
$parameters = @{
  ConnectionUri    = 'https://ps.exchangelabs.com/PowerShell'
  ScriptBlock      = { Get-Mailbox dan }
  AllowRedirection = $true
  SessionOption    = $max
}
Invoke-Command @parameters


Write-Output "----------------Test 17----------------"
# Access a network share in a remote session.
Enable-WSManCredSSP -Role Client -DelegateComputer Server02
$s = New-PSSession Server02
Invoke-Command -Session $s -ScriptBlock { Enable-WSManCredSSP -Role Server -Force }
$parameters = @{
  ComputerName   = 'Server02'
  ScriptBlock    = { Get-Item \\Net03\Scripts\LogFiles.ps1 }
  Authentication = 'CredSSP'
  Credential     = 'Domain01\Admin01'
}
Invoke-Command @parameters


Write-Output "----------------Test 18----------------"
# Start scripts on many remote computers.
$parameters = @{
    ComputerName          = (Get-Content -Path C:\Test\Servers.txt)
    InDisconnectedSession = $true
    FilePath              = '\\Scripts\Public\ConfigInventory.ps1'
    SessionOption         = @{
        OutputBufferingMode = 'Drop'
        IdleTimeout         = [timespan]::FromHours(12)
    }
}
Invoke-Command @parameters


Write-Output "----------------Test 19----------------"
# Run a command on a remote computer using SSH.
Invoke-Command -HostName UserA@LinuxServer01 -ScriptBlock { Get-MailBox * }


Write-Output "----------------Test 20----------------"
# Run a command on a remote computer using SSH and specify a user authentication key.
$parameters = @{
    HostName    = 'UserA@LinuxServer01'
    ScriptBlock = { Get-MailBox * }
    KeyFilePath = '/UserA/UserAKey_rsa'
}
Invoke-Command


Write-Output "----------------Test 21----------------"
# Run a script file on multiple remote computers using SSH as a job.
$sshConnections = @(
    @{
        HostName    = "WinServer1"
        UserName    = "Domain\UserA"
        KeyFilePath = "C:\Users\UserA\id_rsa"
    }
    @{
        HostName    = "UserB@LinuxServer5"
        KeyFilePath = "/Users/UserB/id_rsa"
    }
)
$results = Invoke-Command -FilePath c:\Scripts\GetInfo.ps1 -SSHConnection $sshConnections


Write-Output "----------------Test 22----------------"
# Connect to a remote SSH session using SSH options.
$options = @{
    Port=22
    User = 'UserB'
    Host = 'LinuxServer5'
}
$results = Invoke-Command -FilePath c:\Scripts\CollectEvents.ps1 -KeyFilePath '/Users/UserB/id_rsa' -Options $options
