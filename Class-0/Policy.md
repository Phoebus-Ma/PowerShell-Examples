
# Introduction

The content includes:

1. Execution Policy - Describes the PowerShell execution policies and explains how to manage them.
2. Authenticode Signature - Explains how to sign scripts so that they comply with the PowerShell execution policies.


# 1. Execution Policy

Describes the PowerShell execution policies and explains how to manage them.

PowerShell's execution policy is a safety feature that controls the conditions under which PowerShell loads configuration files and runs scripts. This feature helps prevent the execution of malicious scripts.

On a Windows computer you can set an execution policy for the local computer, for the current user, or for a particular session. You can also use a Group Policy setting to set execution policies for computers and users.

Execution policies for the local computer and current user are stored in the PowerShell configuration files. You don't need to set execution policies in your PowerShell profile. The execution policy for a particular session is stored only in memory and is lost when the session is closed.

The execution policy isn't a security system that restricts user actions. For example, users can easily bypass a policy by typing the script contents at the command line when they cannot run a script. Instead, the execution policy helps users to set basic rules and prevents them from violating them unintentionally.

On non-Windows computers, the default execution policy is Unrestricted and cannot be changed. The Set-ExecutionPolicy cmdlet is available, but PowerShell displays a console message that it's not supported. While Get-ExecutionPolicy returns Unrestricted on non-Windows platforms, the behavior really matches Bypass because those platforms do not implement the Windows Security Zones.

For more detail, see [about_execution_policies](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.4).


## 1.1 Get Execution Policy

Gets the execution policies for the current session.

```bash
Get-ExecutionPolicy
    [[-Scope] <ExecutionPolicyScope>]
    [-List]
    [<CommonParameters>]
```

- List

    Gets all execution policy values for the session. By default, Get-ExecutionPolicy gets only the effective execution policy.

- Scope

    - `MachinePolicy` - Set by a Group Policy for all users of the computer.
    - `UserPolicy` - Set by a Group Policy for the current user of the computer.
    - `Process` - Affects only the current PowerShell session.
    - `LocalMachine` - Default scope that affects all users of the computer.
    - `CurrentUser` - Affects only the current user.

Example for get all execution policies:

```bash
Get-ExecutionPolicy -List

Scope          ExecutionPolicy
-----          ---------------
MachinePolicy  Undefined
UserPolicy     Undefined
Process        Undefined
CurrentUser    AllSigned
LocalMachine   Undefined
```


## 1.2 Set Execution Policy

Sets the PowerShell execution policies for Windows computers.

```bash
Set-ExecutionPolicy
    [-ExecutionPolicy] <ExecutionPolicy>
    [[-Scope] <ExecutionPolicyScope>]
    [-Force]
    [-WhatIf]
    [-Confirm]
    [<CommonParameters>]
```

- Confirm

    Prompts you for confirmation before running the cmdlet.

- ExecutionPolicy

    - `AllSigned` - Requires that all scripts and configuration files are signed by a trusted publisher, including scripts written on the local computer.

        - Scripts can run.
        - Requires that all scripts and configuration files be signed by a trusted publisher, including scripts that you write on the local computer.
        - Prompts you before running scripts from publishers that you haven't yet classified as trusted or untrusted.
        - Risks running signed, but malicious, scripts.

    - `Bypass` - Nothing is blocked and there are no warnings or prompts.

        - Nothing is blocked and there are no warnings or prompts.
        - This execution policy is designed for configurations in which a PowerShell script is built into a larger application or for configurations in which PowerShell is the foundation for a program that has its own security model.


    - `Default` - Sets the default execution policy. Restricted for Windows clients or RemoteSigned for Windows servers.

        - Sets the default execution policy.
        - Restricted for Windows clients.
        - RemoteSigned for Windows servers.

    - `RemoteSigned` - Requires that all scripts and configuration files downloaded from the Internet are signed by a trusted publisher. The default execution policy for Windows server computers.

        - The default execution policy for Windows server computers.
        - Scripts can run.
        - Requires a digital signature from a trusted publisher on scripts and configuration files that are downloaded from the internet which includes email and instant messaging programs.
        - Doesn't require digital signatures on scripts that are written on the local computer and not downloaded from the internet.
        - Runs scripts that are downloaded from the internet and not signed, if the scripts are unblocked, such as by using the Unblock-File cmdlet.
        - Risks running unsigned scripts from sources other than the internet and signed scripts that could be malicious.

    - `Restricted` - Doesn't load configuration files or run scripts. The default execution policy for Windows client computers.

        - The default execution policy for Windows client computers.
        - Permits individual commands, but does not allow scripts.
        - Prevents running of all script files, including formatting and configuration files (.ps1xml), module script files (.psm1), and PowerShell profiles (.ps1).

    - `Undefined` - No execution policy is set for the scope. Removes an assigned execution policy from a scope that is not set by a Group Policy. If the execution policy in all scopes is Undefined, the effective execution policy is Restricted.

        - There is no execution policy set in the current scope.
        - If the execution policy in all scopes is Undefined, the effective execution policy is Restricted for Windows clients and RemoteSigned for Windows Server.

- Force

    Suppresses all the confirmation prompts. Use caution with this parameter to avoid unexpected results.

- Scope

    - `MachinePolicy` - Set by a Group Policy for all users of the computer.

    - `UserPolicy` - Set by a Group Policy for the current user of the computer.

    - `Process` - Affects only the current PowerShell session.

    - `LocalMachine` - Default scope that affects all users of the computer.

    - `CurrentUser` - Affects only the current user.

- WhatIf

    Shows what would happen if the cmdlet runs. The cmdlet is not run.

Example for set an execution policy:

```bash
$ Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
$ Get-ExecutionPolicy -List
```

Example for remove the execution policy:

```bash
$ Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope LocalMachine
```

Note:

- Unrestricted

    - The default execution policy for non-Windows computers and cannot be changed.
    - Unsigned scripts can run. There is a risk of running malicious scripts.
    - Warns the user before running scripts and configuration files that are not from the local intranet zone.


# 2. Authenticode Signature

Explains how to sign scripts so that they comply with the PowerShell execution policies.

The Restricted execution policy doesn't permit any scripts to run. The AllSigned and RemoteSigned execution policies prevent PowerShell from running scripts that don't have a digital signature.

This topic explains how to run selected scripts that aren't signed, even while the execution policy is RemoteSigned, and how to sign scripts for your own use.

PowerShell checks the Authenticode signature of the following type types:

- .ps1 script files.
- .psm1 module files.
- .psd1 module manifest and data files.
- .ps1xml type and format XML files.
- .cdxml CDXML script files.
- .xaml XAML script files.

For more detail, see [about_signing](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_signing?view=powershell-7.4).


## 2.1 Get Authenticode Signature

Gets information about the Authenticode signature for a file.

```bash
Get-AuthenticodeSignature
    [-FilePath] <String[]>
    [<CommonParameters>]
```

```bash
Get-AuthenticodeSignature
    -LiteralPath <String[]>
    [<CommonParameters>]
```

```bash
Get-AuthenticodeSignature
    -SourcePathOrExtension <String[]>
    -Content <Byte[]>
    [<CommonParameters>]
```

-Content

    Contents of a file as a byte array for which the Authenticode signature is retrieved. This parameter must be used with SourcePathOrExtension parameter. Prior to PowerShell 7.4, the contents of the file must be in Unicode (UTF-16LE) format.

-FilePath

    Specifies the path to the file to examine. Wildcards are permitted, but they must lead to a single file. It is not necessary to type FilePath at the command line when you specify a value for this parameter.

-LiteralPath

    Specifies the path to the file being examined. Unlike FilePath, the value of the LiteralPath parameter is used exactly as it is typed. No characters are interpreted as wildcards. If the path includes an escape character, enclose it in single quotation marks. Single quotation marks tell PowerShell not to interpret any characters as escape characters.

-SourcePathOrExtension

    Path to the file or file type of the content for which the Authenticode signature is retrieved. This parameter is used with Content where file content is passed as a byte array.


Example for get the Authenticode signature for a file:

```bash
$ Get-AuthenticodeSignature -FilePath "C:\Test\NewScript.ps1"
```


## 2.2 Set Authenticode Signature

Adds an Authenticode signature to a PowerShell script or other file.

```bash
Set-AuthenticodeSignature
    [-Certificate] <X509Certificate2>
    [-IncludeChain <String>]
    [-TimestampServer <String>]
    [-HashAlgorithm <String>]
    [-Force]
    [-FilePath] <String[]>
    [-WhatIf]
    [-Confirm]
    [<CommonParameters>]
```

```bash
Set-AuthenticodeSignature
    [-Certificate] <X509Certificate2>
    [-IncludeChain <String>]
    [-TimestampServer <String>]
    [-HashAlgorithm <String>]
    [-Force]
    -LiteralPath <String[]>
    [-WhatIf]
    [-Confirm]
    [<CommonParameters>]
```

```bash
Set-AuthenticodeSignature
    [-Certificate] <X509Certificate2>
    [-IncludeChain <String>]
    [-TimestampServer <String>]
    [-HashAlgorithm <String>]
    [-Force]
    -SourcePathOrExtension <String[]>
    -Content <Byte[]>
    [-WhatIf]
    [-Confirm]
    [<CommonParameters>]
```

-Certificate

    Specifies the certificate that will be used to sign the script or file. Enter a variable that stores an object representing the certificate or an expression that gets the certificate.

    To find a certificate, use Get-PfxCertificate or use the Get-ChildItem cmdlet in the Certificate Cert: drive. If the certificate is not valid or does not have code-signing authority, the command fails.

-Confirm

    Prompts you for confirmation before running the cmdlet.

-Content

    This parameter appears in the syntax listing because it is defined in the base class that Set-AuthenticodeSignature is derived from. However, support for this parameter is not implemented in Set-AuthenticodeSignature.

-FilePath

    Specifies the path to a file that is being signed.

-Force

    Allows the cmdlet to append a signature to a read-only file. Even using the Force parameter, the cmdlet cannot override security restrictions.

-HashAlgorithm

    Specifies the hashing algorithm that Windows uses to compute the digital signature for the file.

-IncludeChain

    Determines which certificates in the certificate trust chain are included in the digital signature. NotRoot is the default.

-LiteralPath

    Specifies the path to a file that is being signed. Unlike FilePath, the value of the LiteralPath parameter is used exactly as it is typed. No characters are interpreted as wildcards. If the path includes escape characters, enclose it in single quotation marks. Single quotation marks tell PowerShell not to interpret any characters as escape sequences.

-SourcePathOrExtension

    This parameter appears in the syntax listing because it is defined in the base class that Set-AuthenticodeSignature is derived from. However, support for this parameter is not implemented in Set-AuthenticodeSignature.

-TimestampServer

    Uses the specified time stamp server to add a time stamp to the signature. Type the URL of the time stamp server as a string. The URL must start with https:// or http://.

-WhatIf

    Shows what would happen if the cmdlet runs. The cmdlet is not run.

Example for sign a script using a certificate from a PFX file:

```bash
$ $cert = Get-PfxCertificate -FilePath C:\Test\Mysign.pfx
$ Set-AuthenticodeSignature -FilePath ServerProps.ps1 -Certificate $cert
```
