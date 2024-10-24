
# Manage modules

# 1. Install Module

Downloads one or more modules from a repository, and installs them on the local computer.

The Install-Module cmdlet gets one or more modules that meet specified criteria from an online repository. The cmdlet verifies that search results are valid modules and copies the module folders to the installation location. Installed modules aren't automatically imported after installation. You can filter which module is installed based on the minimum, maximum, and exact versions of specified modules.

This is a proxy cmdlet for the Get-InstalledPSResource cmdlet in the Microsoft.PowerShell.PSResourceGet. For more information, see [Install-PSResource](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.psresourceget/install-psresource?view=powershellget-3.x).


```bash
Install-Module
       [-Name] <String[]>
       [-MinimumVersion <String>]
       [-MaximumVersion <String>]
       [-RequiredVersion <String>]
       [-Repository <String[]>]
       [-Credential <PSCredential>]
       [-Scope <String>]
       [-Proxy <Uri>]
       [-ProxyCredential <PSCredential>]
       [-AllowClobber]
       [-SkipPublisherCheck]
       [-Force]
       [-AllowPrerelease]
       [-AcceptLicense]
       [-PassThru]
       [-WhatIf]
       [-Confirm]
       [<CommonParameters>]
```

```bash
Install-Module
       [-InputObject] <PSObject[]>
       [-Credential <PSCredential>]
       [-Scope <String>]
       [-Proxy <Uri>]
       [-ProxyCredential <PSCredential>]
       [-AllowClobber]
       [-SkipPublisherCheck]
       [-Force]
       [-AcceptLicense]
       [-PassThru]
       [-WhatIf]
       [-Confirm]
       [<CommonParameters>]
```


1. Example 1: Find and install a module

This example finds a module in the repository and installs the module.

```bash
Find-Module -Name PowerShellGet | Install-Module
```

The Find-Module uses the Name parameter to specify the PowerShellGet module. By default, the newest version of the module is downloaded from the repository. The object is sent down the pipeline to the Install-Module cmdlet. Install-Module installs the module for all users in $env:ProgramFiles\PowerShell\Modules.


2. Example 2: Install a module by name

In this example, the newest version of the PowerShellGet module is installed.

```bash
Install-Module -Name PowerShellGet
```

The Install-Module uses the Name parameter to specify the PowerShellGet module. By default, the newest version of the module is downloaded from the repository and installed.


3. Example 3: Install a module using its minimum version

In this example, the minimum version of the PowerShellGet module is installed. The MinimumVersion parameter specifies the lowest version of the module that should be installed. If a newer version of the module is available, that version is downloaded and installed for all users.

```bash
Install-Module -Name PowerShellGet -MinimumVersion 2.0.1
```

The Install-Module uses the Name parameter to specify the PowerShellGet module. The MinimumVersion parameter specifies that version 2.0.1 is downloaded from the repository and installed. Because version 2.0.4 is available, that version is downloaded and installed for all users.


4. Example 4: Install a specific version of a module

In this example, a specific version of the PowerShellGet module is installed.

```bash
Install-Module -Name PowerShellGet -RequiredVersion 2.0.0
```

The Install-Module uses the Name parameter to specify the PowerShellGet module. The RequiredVersion parameter specifies that version 2.0.0 is downloaded and installed for all users.


5. Example 5: Install a module only for the current user

This example downloads and installs the newest version of a module, only for the current user.

```bash
Install-Module -Name PowerShellGet -Scope CurrentUser
```

The Install-Module uses the Name parameter to specify the PowerShellGet module. Install-Module downloads and installs the newest version of PowerShellGet into the current user's directory, $HOME\Documents\PowerShell\Modules.


6. Example 6: Install the latest prerelease version of a module

This example shows how to install the latest version of a module when that version is a prerelease version. Installing a prerelease version requires the AllowPrerelease parameter.

```bash
Install-Module -Name Microsoft.PowerShell.Crescendo -AllowPrerelease
```

Using this method you get the latest version available. If the latest version isn't a prerelease, you get the latest stable version of the module.


7. Example 7: Install a specific prerelease version of a module

This example shows how to install a specific prerelease version of a module. The Find-Module cmdlet can be used to find prerelease versions of modules in the PowerShell Gallery.

Prerelease versions have a format of <version_number>-<prerelease_label>.

```bash
Find-Module PSReadLine -AllVersions -AllowPrerelease | Select-Object -First 5

Version        Name             Repository       Description
-------        ----             ----------       -----------
2.2.6          PSReadLine       PSGallery        Great command line editing in the PowerS…
2.2.5          PSReadLine       PSGallery        Great command line editing in the PowerS…
2.2.4-beta1    PSReadLine       PSGallery        Great command line editing in the PowerS…
2.2.3          PSReadLine       PSGallery        Great command line editing in the PowerS…
2.2.2          PSReadLine       PSGallery        Great command line editing in the PowerS…

Install-Module -Name PSReadLine -RequiredVersion 2.2.4-beta1 -AllowPrerelease
```

Use the version shown in the PowerShell Gallery for the value of the RequiredVersion parameter.


# 2. Uninstall Module

Uninstalls a module.

The Uninstall-Module cmdlet uninstalls a specified module from the local computer. You can't uninstall a module if other modules depend on it or the module wasn't installed with the Install-Module cmdlet.

This is a proxy cmdlet for the Uninstall-PSResource cmdlet in the Microsoft.PowerShell.PSResourceGet. For more information, see [Uninstall-PSResource](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.psresourceget/uninstall-psresource?view=powershellget-3.x).

```bash
Uninstall-Module
         [-Name] <String[]>
         [-MinimumVersion <String>]
         [-RequiredVersion <String>]
         [-MaximumVersion <String>]
         [-AllVersions]
         [-Force]
         [-AllowPrerelease]
         [-WhatIf]
         [-Confirm]
         [<CommonParameters>]
```

```bash
Uninstall-Module
         [-InputObject] <PSObject[]>
         [-Force]
         [-WhatIf]
         [-Confirm]
         [<CommonParameters>]
```


1. Example 1: Uninstall a module

This example uninstalls a module.

```bash
Uninstall-Module -Name SpeculationControl
```

Uninstall-Module uses the Name parameter to specify the module to uninstall from the local computer.


2. Example 2: Use the pipeline to uninstall a module

In this example, the pipeline is used to uninstall a module.

```bash
Get-InstalledModule -Name SpeculationControl | Uninstall-Module
```

Get-InstalledModule uses the Name parameter to specify the module. The object is sent down the pipeline to Uninstall-Module and is uninstalled.


# 3. Find Module

Finds modules in a repository that match specified criteria.

The Find-Module cmdlet finds modules in a repository that match the specified criteria. Find-Module returns a PSRepositoryItemInfo object for each module it finds. The objects can be sent down the pipeline to cmdlets such as Install-Module.

This is a proxy cmdlet for the Find-PSResource cmdlet in the Microsoft.PowerShell.PSResourceGet. For more information, see [Find-PSResource](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.psresourceget/find-psresource?view=powershellget-3.x).

```bash
Find-Module
    [[-Name] <string[]>]
    [-MinimumVersion <string>]
    [-MaximumVersion <string>]
    [-RequiredVersion <string>]
    [-AllVersions]
    [-IncludeDependencies]
    [-Filter <string>]
    [-Tag <string[]>]
    [-Includes <string[]>]
    [-DscResource <string[]>]
    [-RoleCapability <string[]>]
    [-Command <string[]>]
    [-Proxy <uri>]
    [-ProxyCredential <pscredential>]
    [-Repository <string[]>]
    [-Credential <pscredential>]
    [-AllowPrerelease]
    [<CommonParameters>]
```


1. Example 1: Find a module by name

This example finds a module in the default repository.

```bash
Find-Module -Name PowerShellGet

Version   Name              Repository           Description
-------   ----              ----------           -----------
2.1.0     PowerShellGet     PSGallery            PowerShell module with commands for discovering...
```

The Find-Module cmdlet uses the Name parameter to specify the PowerShellGet module.


2. Example 2: Find modules with similar names

This example uses the asterisk (*) wildcard to find modules with similar names.

```bash
Find-Module -Name PowerShell*

Version   Name                            Repository    Description
-------   ----                            ----------    -----------
0.4.0     powershell-yaml                 PSGallery     Powershell module for serializing and...
2.1.0     PowerShellGet                   PSGallery     PowerShell module with commands for...
1.9       Powershell.Helper.Extension     PSGallery     # Powershell.Helper.Extension...
3.1       PowerShellHumanizer             PSGallery     PowerShell Humanizer wraps Humanizer...
4.0       PowerShellISEModule             PSGallery     a module that adds capability to the ISE
```

The Find-Module cmdlet uses the Name parameter with the asterisk (*) wildcard to find all modules that contain PowerShell.


3. Example 3: Find a module by minimum version

This example searches for a module's minimum version. If the repository contains a newer version of the module, the newer version is returned.

```bash
Find-Module -Name PowerShellGet -MinimumVersion 1.6.5

Version   Name             Repository     Description
-------   ----             ----------     -----------
2.1.0     PowerShellGet    PSGallery      PowerShell module with commands for discovering...
```

The Find-Module cmdlet uses the Name parameter to specify the PowerShellGet module. The MinimumVersion specifies version 1.6.5. Find-Module returns PowerShellGet version 2.1.0 because it exceeds the minimum version and is the most current version.


4. Example 4: Find a module by specific version

This example shows how to install a specific prerelease version of a module. Prerelease versions have a format of <version_number>-<prerelease_label>.

```bash
Find-Module PSReadLine -AllowPrerelease -RequiredVersion 2.2.4-beta1

Version        Name             Repository       Description
-------        ----             ----------       -----------
2.2.4-beta1    PSReadLine       PSGallery        Great command line editing in the PowerS…
```

5. Example 5: Find a module in a specific repository

This example uses the Repository parameter to find a module in a specific repository.

```bash
Find-Module -Name PowerShellGet -Repository PSGallery

Version   Name             Repository     Description
-------   ----             ----------     -----------
2.1.0     PowerShellGet    PSGallery      PowerShell module with commands for discovering...
```

The Find-Module cmdlet uses the Name parameter to specify the PowerShellGet module. The Repository parameter specifies to search the PSGallery repository.


6. Example 6: Find a module in multiple repositories

This example uses the Register-PSRepository to specify a repository. Find-Module uses the repository to search for a module.

```bash
Register-PSRepository -Name MySource -SourceLocation https://www.myget.org/F/powershellgetdemo/
Find-Module -Name Contoso* -Repository PSGallery, MySource

Repository    Version   Name             Description
----------    -------   ----             -----------
PSGallery     2.0.0.0   ContosoServer    Cmdlets and DSC resources for managing Contoso Server...
MySource      1.2.0.0   ContosoClient    Cmdlets and DSC resources for managing Contoso Client...
```

The Register-PSRepository cmdlet registers a new repository. The Name parameter assigns the name MySource. The SourceLocation parameter specifies the repository's address.

The Find-Module cmdlet uses the Name parameter with the asterisk (*) wildcard to specify the Contoso module. The Repository parameter specifies to search two repositories, PSGallery and MySource.


7. Example 7: Find a module that contains a DSC resource

This command returns modules that contain DSC resources. The Includes parameter has four predefined functionalities that are used to search the repository. Use tab-complete to display the four functionalities supported by the Includes parameter.

```bash
Find-Module -Repository PSGallery -Includes DscResource

Version     Name                            Repository    Description
-------     ----                            ----------    -----------
2.7.0       Carbon                          PSGallery     Carbon is a PowerShell module...
8.5.0.0     xPSDesiredStateConfiguration    PSGallery     The xPSDesiredStateConfiguration module...
1.3.1       PackageManagement               PSGallery     PackageManagement (a.k.a. OneGet) is...
2.7.0.0     xWindowsUpdate                  PSGallery     Module with DSC Resources...
3.2.0.0     xCertificate                    PSGallery     This module includes DSC resources...
3.1.0.0     xPowerShellExecutionPolicy      PSGallery     This DSC resource can change the user...
```

The Find-Module cmdlet uses the Repository parameter to search the repository, PSGallery. The Includes parameter specifies DscResource, which is a functionality that the parameter can search for in the repository.


8. Example 8: Find a module with a filter

In this example, to find modules, a filter is used to search the repository.

For a NuGet-based repository, the Filter parameter searches through the name, description, and tags for the argument.

```bash
Find-Module -Filter AppDomain

Version    Name              Repository           Description
-------    ----              ----------           -----------
1.0.0.0  AppDomainConfig     PSGallery            Manipulate AppDomain configuration...
1.1.0    ClassExplorer       PSGallery            Quickly search the AppDomain for classes...
```

The Find-Module cmdlet uses the Filter parameter to search the repository for AppDomain.


9. Example 9: Find a module by tag

This example shows how to find modules by a tag. The CrescendoBuilt value is a tag that is automatically added to modules created using the Microsoft.PowerShell.Crescendo module.

```bash
Find-Module -Tag CrescendoBuilt

Version Name            Repository Description
------- ----            ---------- -----------
0.1.0   Foil            PSGallery  A PowerShell Crescendo wrapper for Chocolatey
0.3.1   Cobalt          PSGallery  A PowerShell Crescendo wrapper for WinGet
1.1.0   SysInternals    PSGallery  PowerShell cmdlets for SysInternal tools
0.0.4   Croze           PSGallery  A PowerShell Crescendo wrapper for Homebrew
0.0.2   AptPackage      PSGallery  PowerShell Crescendo-generated Module to query APT-Package Information
1.0.1   RoboCopy        PSGallery  PowerShell cmdlet for the official RoboCopy.exe
1.0.2   TShark          PSGallery  PowerShell cmdlet for tshark.exe
1.0.0   SpeedTestCLI    PSGallery  PowerShell cmdlets speedtest-cli
1.0.0   SpeedTest-CLI   PSGallery  PowerShell cmdlets for Internet Speed Test
1.0.2   Image2Text      PSGallery  PowerShell Images into ASCII art
0.1.1   Quser.Crescendo PSGallery  This module displays session information of users logged onto a local or remote m...
1.0.2   Takeown         PSGallery  Crescendo Powershell wrapper of takeown.exe
```


# 4. Update Module

Downloads and installs the newest version of specified modules from an online gallery to the local computer.

The Update-Module cmdlet installs a module's newest version from an online gallery. You're prompted to confirm the update before it's installed. Updates are installed only for modules that were installed on the local computer with Install-Module. Update-Module searches $env:PSModulePath for installed modules.

This is a proxy cmdlet for the Update-PSResource cmdlet in the Microsoft.PowerShell.PSResourceGet. For more information, see [Update-PSResource](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.psresourceget/update-psresource?view=powershellget-3.x).

```bash
Update-Module
      [[-Name] <String[]>]
      [-RequiredVersion <String>]
      [-MaximumVersion <String>]
      [-Credential <PSCredential>]
      [-Scope <String>]
      [-Proxy <Uri>]
      [-ProxyCredential <PSCredential>]
      [-Force]
      [-AllowPrerelease]
      [-AcceptLicense]
      [-PassThru]
      [-WhatIf]
      [-Confirm]
      [<CommonParameters>]
```


1. Example 1: Update all modules

This example updates all installed modules to the newest version in an online gallery.

```bash
Update-Module
```


2. Example 2: Update a module by name

This example updates a specific module to the newest version in an online gallery.

```bash
Update-Module -Name SpeculationControl
```

Update-Module uses the Name parameter to update a specific module, SpeculationControl.


3. Example 3: View what-if Update-Module runs

This example does a what-if scenario to show what happens if Update-Module is run. The command isn't run.

```bash
Update-Module -WhatIf

What if: Performing the operation "Update-Module" on target "Version '2.8.0' of module
  'Carbon', updating to version '2.8.1'".
What if: Performing the operation "Update-Module" on target "Version '1.0.10' of module
  'SpeculationControl', updating to version '1.0.14'".
```

Update-Module uses the WhatIf parameter display what would happen if Update-Module were run.


4. Example 4: Update a module to a specified version

In this example, a module is updated to a specific version. The version must exist in the online gallery or an error is displayed.

```bash
Update-Module -Name SpeculationControl -RequiredVersion 1.0.14
```

Update-Module uses the Name parameter to specify the module, SpeculationControl. The RequiredVersion parameter specifies the version, 1.0.14.


5. Example 5: Update a module without confirmation

This example doesn't request confirmation to update the module to the newest version from an online gallery. If the module is already installed, the Force parameter reinstalls the module.

```bash
Update-Module -Name SpeculationControl -Force
```

Update-Module uses the Name parameter to specify the module, SpeculationControl. The Force parameter updates the module without requesting user confirmation.


# 5. Import Module

Adds modules to the current session.

The Import-Module cmdlet adds one or more modules to the current session. Starting in PowerShell 3.0, installed modules are automatically imported to the session when you use any commands or providers in the module. However, you can still use the Import-Module command to import a module. You can disable automatic module importing using the $PSModuleAutoloadingPreference preference variable. For more information about the $PSModuleAutoloadingPreference variable, see about_Preference_Variables.

A module is a package that contains members that can be used in PowerShell. Members include cmdlets, providers, scripts, functions, variables, and other tools and files. After a module is imported, you can use the module members in your session. For more information about modules, see about_Modules.

By default, Import-Module imports all members that the module exports, but you can use the Alias, Function, Cmdlet, and Variable parameters to restrict which members are imported. The NoClobber parameter prevents Import-Module from importing members that have the same names as members in the current session.

Import-Module imports a module only into the current session. To import the module into every new session, add an Import-Module command to your PowerShell profile. For more information about profiles, see about_Profiles.

You can manage remote Windows computers that have PowerShell remoting enabled by creating a PSSession on the remote computer. Then use the PSSession parameter of Import-Module to import the modules that are installed on the remote computer. When you use the imported commands in the current session the commands implicitly run on the remote computer.

Starting in Windows PowerShell 3.0, you can use Import-Module to import Common Information Model (CIM) modules. CIM modules define cmdlets in Cmdlet Definition XML (CDXML) files. This feature lets you use cmdlets that are implemented in non-managed code assemblies, such as those written in C++.

For remote computers that don't have PowerShell remoting enabled, including computers that aren't running the Windows operating system, you can use the CIMSession parameter of Import-Module to import CIM modules from the remote computer. The imported commands run implicitly on the remote computer. A CIMSession is a connection to Windows Management Instrumentation (WMI) on the remote computer.

```bash
Import-Module
      [-Global]
      [-Prefix <String>]
      [-Name] <String[]>
      [-Function <String[]>]
      [-Cmdlet <String[]>]
      [-Variable <String[]>]
      [-Alias <String[]>]
      [-Force]
      [-SkipEditionCheck]
      [-PassThru]
      [-AsCustomObject]
      [-MinimumVersion <Version>]
      [-MaximumVersion <String>]
      [-RequiredVersion <Version>]
      [-ArgumentList <Object[]>]
      [-DisableNameChecking]
      [-NoClobber]
      [-Scope <String>] 
      [<CommonParameters>]
```

```bash
Import-Module
      [-Global]
      [-Prefix <String>]
      [-Name] <String[]>
      [-Function <String[]>]
      [-Cmdlet <String[]>]
      [-Variable <String[]>]
      [-Alias <String[]>]
      [-Force]
      [-SkipEditionCheck]
      [-PassThru]
      [-AsCustomObject]
      [-MinimumVersion <Version>]
      [-MaximumVersion <String>]
      [-RequiredVersion <Version>]
      [-ArgumentList <Object[]>]
      [-DisableNameChecking]
      [-NoClobber]
      [-Scope <String>]
      -PSSession <PSSession> 
      [<CommonParameters>]
```

```bash
Import-Module
      [-Global]
      [-Prefix <String>]
      [-Name] <String[]>
      [-Function <String[]>]
      [-Cmdlet <String[]>]
      [-Variable <String[]>]
      [-Alias <String[]>]
      [-Force]
      [-SkipEditionCheck]
      [-PassThru]
      [-AsCustomObject]
      [-MinimumVersion <Version>]
      [-MaximumVersion <String>]
      [-RequiredVersion <Version>]
      [-ArgumentList <Object[]>]
      [-DisableNameChecking]
      [-NoClobber]
      [-Scope <String>]
      -CimSession <CimSession>
      [-CimResourceUri <Uri>]
      [-CimNamespace <String>]
      [<CommonParameters>]
```

```bash
Import-Module
      [-Name] <string[]>
      -UseWindowsPowerShell
      [-Global]
      [-Prefix <string>]
      [-Function <string[]>]
      [-Cmdlet <string[]>]
      [-Variable <string[]>]
      [-Alias <string[]>]
      [-Force]
      [-PassThru]
      [-AsCustomObject]
      [-MinimumVersion <version>]
      [-MaximumVersion <string>]
      [-RequiredVersion <version>]
      [-ArgumentList <Object[]>]
      [-DisableNameChecking]
      [-NoClobber]
      [-Scope <string>]
      [<CommonParameters>]
```

```bash
Import-Module
      [-Global]
      [-Prefix <String>]
      [-FullyQualifiedName] <ModuleSpecification[]>
      [-Function <String[]>]
      [-Cmdlet <String[]>]
      [-Variable <String[]>]
      [-Alias <String[]>]
      [-Force]
      [-SkipEditionCheck]
      [-PassThru]
      [-AsCustomObject]
      [-ArgumentList <Object[]>]
      [-DisableNameChecking]
      [-NoClobber]
      [-Scope <String>] 
      [<CommonParameters>]
```

```bash
Import-Module
      [-Global]
      [-Prefix <String>]
      [-FullyQualifiedName] <ModuleSpecification[]>
      [-Function <String[]>]
      [-Cmdlet <String[]>]
      [-Variable <String[]>]
      [-Alias <String[]>]
      [-Force]
      [-SkipEditionCheck]
      [-PassThru]
      [-AsCustomObject]
      [-ArgumentList <Object[]>]
      [-DisableNameChecking]
      [-NoClobber]
      [-Scope <String>]
      -PSSession <PSSession> 
      [<CommonParameters>]
```

```bash
Import-Module
      [-FullyQualifiedName] <ModuleSpecification[]>
      -UseWindowsPowerShell
      [-Global]
      [-Prefix <string>]
      [-Function <string[]>]
      [-Cmdlet <string[]>]
      [-Variable <string[]>]
      [-Alias <string[]>]
      [-Force]
      [-PassThru]
      [-AsCustomObject]
      [-ArgumentList <Object[]>]
      [-DisableNameChecking]
      [-NoClobber]
      [-Scope <string>]
      [<CommonParameters>]
```

```bash
Import-Module
      [-Global]
      [-Prefix <String>]
      [-Assembly] <Assembly[]>
      [-Function <String[]>]
      [-Cmdlet <String[]>]
      [-Variable <String[]>]
      [-Alias <String[]>]
      [-Force]
      [-SkipEditionCheck]
      [-PassThru]
      [-AsCustomObject]
      [-ArgumentList <Object[]>]
      [-DisableNameChecking]
      [-NoClobber]
      [-Scope <String>] 
      [<CommonParameters>]
```

```bash
Import-Module
      [-Global]
      [-Prefix <String>]
      [-Function <String[]>]
      [-Cmdlet <String[]>]
      [-Variable <String[]>]
      [-Alias <String[]>]
      [-Force]
      [-SkipEditionCheck]
      [-PassThru]
      [-AsCustomObject]
      [-ModuleInfo] <PSModuleInfo[]>
      [-ArgumentList <Object[]>]
      [-DisableNameChecking]
      [-NoClobber]
      [-Scope <String>] 
      [<CommonParameters>]
```


1. Example 1: Import the members of a module into the current session

This example imports the members of the PSDiagnostics module into the current session.

```bash
Import-Module -Name PSDiagnostics
```


2. Example 2: Import all modules specified by the module path

This example imports all available modules in the path specified by the $env:PSModulePath environment variable into the current session.

```bash
Get-Module -ListAvailable | Import-Module
```


3. Example 3: Import the members of several modules into the current session

This example imports the members of the PSDiagnostics and Dism modules into the current session.

```bash
$m = Get-Module -ListAvailable PSDiagnostics, Dism
Import-Module -ModuleInfo $m
```

The Get-Module cmdlet gets the PSDiagnostics and Dism modules and saves the objects in the $m variable. The ListAvailable parameter is required when you're getting modules that aren't yet imported into the session.

The ModuleInfo parameter of Import-Module is used to import the modules into the current session.


4. Example 4: Import all modules specified by a path

This example uses an explicit path to identify the module to import.

```bash
Import-Module -Name c:\ps-test\modules\test -Verbose

VERBOSE: Loading module from path 'C:\ps-test\modules\Test\Test.psm1'.
VERBOSE: Exporting function 'my-parm'.
VERBOSE: Exporting function 'Get-Parameter'.
VERBOSE: Exporting function 'Get-Specification'.
VERBOSE: Exporting function 'Get-SpecDetails'.
```

Using the Verbose parameter causes Import-Module to report progress as it loads the module. Without the Verbose, PassThru, or AsCustomObject parameter, Import-Module doesn't generate any output when it imports a module.


5. Example 5: Restrict module members imported into a session

This example shows how to restrict which module members are imported into the session and the effect of this command on the session. The Function parameter limits the members that are imported from the module. You can also use the Alias, Variable, and Cmdlet parameters to restrict other members that a module imports.

The Get-Module cmdlet gets the object that represents the PSDiagnostics module. The ExportedCmdlets property lists all the cmdlets that the module exports, even though they were not all imported.

```bash
Import-Module PSDiagnostics -Function Disable-PSTrace, Enable-PSTrace
(Get-Module PSDiagnostics).ExportedCommands

Key                          Value
---                          -----
Disable-PSTrace              Disable-PSTrace
Disable-PSWSManCombinedTrace Disable-PSWSManCombinedTrace
Disable-WSManTrace           Disable-WSManTrace
Enable-PSTrace               Enable-PSTrace
Enable-PSWSManCombinedTrace  Enable-PSWSManCombinedTrace
Enable-WSManTrace            Enable-WSManTrace
Get-LogProperties            Get-LogProperties
Set-LogProperties            Set-LogProperties
Start-Trace                  Start-Trace
Stop-Trace                   Stop-Trace

Get-Command -Module PSDiagnostics

CommandType     Name                 Version    Source
-----------     ----                 -------    ------
Function        Disable-PSTrace      6.1.0.0    PSDiagnostics
Function        Enable-PSTrace       6.1.0.0    PSDiagnostics
```

Using the Module parameter of the Get-Command cmdlet shows the commands that were imported from the PSDiagnostics module. The results confirm that only the Disable-PSTrace and Enable-PSTrace cmdlets were imported.


6. Example 6: Import the members of a module and add a prefix

This example imports the PSDiagnostics module into the current session, adds a prefix to the member names, and then displays the prefixed member names. The Prefix parameter of Import-Module adds the x prefix to all members that are imported from the module. The prefix applies only to the members in the current session. It doesn't change the module. The PassThru parameter returns a module object that represents the imported module.

```bash
Import-Module PSDiagnostics -Prefix x -PassThru

ModuleType Version    Name               ExportedCommands
---------- -------    ----               ----------------
Script     6.1.0.0    PSDiagnostics      {Disable-xPSTrace, Disable-xPSWSManCombinedTrace, Disable-xW...

Get-Command -Module PSDiagnostics

CommandType     Name                                   Version    Source
-----------     ----                                   -------    ------
Function        Disable-xPSTrace                       6.1.0.0    PSDiagnostics
Function        Disable-xPSWSManCombinedTrace          6.1.0.0    PSDiagnostics
Function        Disable-xWSManTrace                    6.1.0.0    PSDiagnostics
Function        Enable-xPSTrace                        6.1.0.0    PSDiagnostics
Function        Enable-xPSWSManCombinedTrace           6.1.0.0    PSDiagnostics
Function        Enable-xWSManTrace                     6.1.0.0    PSDiagnostics
Function        Get-xLogProperties                     6.1.0.0    PSDiagnostics
Function        Set-xLogProperties                     6.1.0.0    PSDiagnostics
Function        Start-xTrace                           6.1.0.0    PSDiagnostics
Function        Stop-xTrace                            6.1.0.0    PSDiagnostics
```

Get-Command gets the members that have been imported from the module. The output shows that the module members were correctly prefixed.


7. Example 7: Get and use a custom object

This example demonstrates how to get and use the custom object returned by Import-Module.

Custom objects include synthetic members that represent each of the imported module members. For example, the cmdlets and functions in a module are converted to script methods of the custom object.

Custom objects are useful in scripting. They're also useful when several imported objects have the same names. Using the script method of an object is equivalent to specifying the fully qualified name of an imported member, including its module name.

The AsCustomObject parameter is only usable when importing a script module. Use Get-Module to determine which of the available modules is a script module.

```bash
Get-Module -List | Format-Table -Property Name, ModuleType -AutoSize

Name          ModuleType
----          ----------
Show-Calendar     Script
BitsTransfer    Manifest
PSDiagnostics   Manifest
TestCmdlets       Script
...

$a = Import-Module -Name Show-Calendar -AsCustomObject -Passthru
$a | Get-Member

TypeName: System.Management.Automation.PSCustomObject
Name          MemberType   Definition
----          ----------   ----------
Equals        Method       bool Equals(System.Object obj)
GetHashCode   Method       int GetHashCode()
GetType       Method       type GetType()
ToString      Method       string ToString()
Show-Calendar ScriptMethod System.Object Show-Calendar();

$a."Show-Calendar"()
```

The Show-Calendar script module is imported using the AsCustomObject parameter to request a custom object and the PassThru parameter to return the object. The resulting custom object is saved in the $a variable.

The $a variable is piped to the Get-Member cmdlet to show the properties and methods of the saved object. The output shows a Show-Calendar script method.

To call the Show-Calendar script method, the method name must be enclosed in quotation marks because the name includes a hyphen.


8. Example 8: Reimport a module into the same session

This example shows how to use the Force parameter of Import-Module when you're reimporting a module into the same session. The Force parameter removes the loaded module and then imports it again.

```bash
Import-Module PSDiagnostics
Import-Module PSDiagnostics -Force -Prefix PS
```

The first command imports the PSDiagnostics module. The second command imports the module again, this time using the Prefix parameter.

Without the Force parameter, the session would include two copies of each PSDiagnostics cmdlet, one with the standard name and one with the prefixed name.


9. Example 9: Run commands that have been hidden by imported commands

This example shows how to run commands that have been hidden by imported commands. The TestModule module includes a function named Get-Date that returns the year and day of the year.

```bash
Get-Date

Thursday, August 15, 2019 2:26:12 PM

Import-Module TestModule
Get-Date

19227

Get-Command Get-Date -All | Format-Table -Property CommandType, Name, ModuleName -AutoSize

CommandType     Name         ModuleName
-----------     ----         ----------
Function        Get-Date     TestModule
Cmdlet          Get-Date     Microsoft.PowerShell.Utility

Microsoft.PowerShell.Utility\Get-Date

Thursday, August 15, 2019 2:28:31 PM
```

The first Get-Date cmdlet returns a DateTime object with the current date. After importing the TestModule module, Get-Date returns the year and day of the year.

Using the All parameter of Get-Command show all the Get-Date commands in the session. The results show that there are two Get-Date commands in the session, a function from the TestModule module and a cmdlet from the Microsoft.PowerShell.Utility module.

Because functions take precedence over cmdlets, the Get-Date function from the TestModule module runs, instead of the Get-Date cmdlet. To run the original version of Get-Date, you must qualify the command name with the module name.

For more information about command precedence in PowerShell, see about_Command_Precedence.


10. Example 10: Import a minimum version of a module

This example imports the PowerShellGet module. It uses the MinimumVersion parameter of Import-Module to import only version 2.0.0 or greater of the module.

```bash
Import-Module -Name PowerShellGet -MinimumVersion 2.0.0
```

You can also use the RequiredVersion parameter to import a particular version of a module, or use the Module and Version parameters of the #Requires keyword to require a particular version of a module in a script.


11. Example 11: Import using a fully qualified name

This example imports a specific version of a module using the FullyQualifiedName.

```bash
PS> Get-Module -ListAvailable PowerShellGet | Select-Object Name, Version

Name          Version
----          -------
PowerShellGet 2.2.1
PowerShellGet 2.1.3
PowerShellGet 2.1.2
PowerShellGet 1.0.0.1

PS> Import-Module -FullyQualifiedName @{ModuleName = 'PowerShellGet'; ModuleVersion = '2.1.3' }
```


12. Example 12: Import using a fully qualified path

This example imports a specific version of a module using the fully qualified path.

```bash
PS> Get-Module -ListAvailable PowerShellGet | Select-Object Path

Path
----
C:\Program Files\PowerShell\Modules\PowerShellGet\2.2.1\PowerShellGet.psd1
C:\program files\powershell\6\Modules\PowerShellGet\PowerShellGet.psd1
C:\Program Files\WindowsPowerShell\Modules\PowerShellGet\2.1.2\PowerShellGet.psd1
C:\Program Files\WindowsPowerShell\Modules\PowerShellGet\1.0.0.1\PowerShellGet.psd1

PS> Import-Module -Name 'C:\Program Files\PowerShell\Modules\PowerShellGet\2.2.1\PowerShellGet.psd1'
```


13. Example 13: Import a module from a remote computer

This example shows how to use the Import-Module cmdlet to import a module from a remote computer. This command uses the Implicit Remoting feature of PowerShell.

When you import modules from another session, you can use the cmdlets in the current session. However, commands that use the cmdlets run in the remote session.

```bash
$s = New-PSSession -ComputerName Server01
Get-Module -PSSession $s -ListAvailable -Name NetSecurity

ModuleType Name             ExportedCommands
---------- ----             ----------------
Manifest   NetSecurity      {New-NetIPsecAuthProposal, New-NetIPsecMainModeCryptoProposal, New-Ne...

Import-Module -PSSession $s -Name NetSecurity
Get-Command -Module NetSecurity -Name Get-*Firewall*

CommandType     Name                                               ModuleName
-----------     ----                                               ----------
Function        Get-NetFirewallAddressFilter                       NetSecurity
Function        Get-NetFirewallApplicationFilter                   NetSecurity
Function        Get-NetFirewallInterfaceFilter                     NetSecurity
Function        Get-NetFirewallInterfaceTypeFilter                 NetSecurity
Function        Get-NetFirewallPortFilter                          NetSecurity
Function        Get-NetFirewallProfile                             NetSecurity
Function        Get-NetFirewallRule                                NetSecurity
Function        Get-NetFirewallSecurityFilter                      NetSecurity
Function        Get-NetFirewallServiceFilter                       NetSecurity
Function        Get-NetFirewallSetting                             NetSecurity

Get-NetFirewallRule -DisplayName "Windows Remote Management*" |
  Format-Table -Property DisplayName, Name -AutoSize

DisplayName                                              Name
-----------                                              ----
Windows Remote Management (HTTP-In)                      WINRM-HTTP-In-TCP
Windows Remote Management (HTTP-In)                      WINRM-HTTP-In-TCP-PUBLIC
Windows Remote Management - Compatibility Mode (HTTP-In) WINRM-HTTP-Compat-In-TCP
```

New-PSSession creates a remote session (PSSession) to the Server01 computer. The PSSession is saved in the $s variable.

Running Get-Module with the PSSession parameter shows that the NetSecurity module is installed and available on the remote computer. This command is equivalent to using the Invoke-Command cmdlet to run Get-Module command in the remote session. For example:

Invoke-Command $s {Get-Module -ListAvailable -Name NetSecurity}

Running Import-Module with the PSSession parameter imports the NetSecurity module from the remote computer into the current session. The Get-Command cmdlet retrieves commands that begin with Get and include Firewall from the NetSecurity module. The output confirms that the module and its cmdlets were imported into the current session.

Next, the Get-NetFirewallRule cmdlet gets Windows Remote Management firewall rules on the Server01 computer. This is equivalent to using the Invoke-Command cmdlet to run Get-NetFirewallRule on the remote session.


# 6. Publish Module

Publishes a specified module from the local computer to an online gallery.

The Publish-Module cmdlet publishes a module to an online NuGet-based gallery by using an API key, stored as part of a user's profile in the gallery. You can specify the module to publish either by the module's name, or by the path to the folder containing the module.

This is a proxy cmdlet for the Publish-PSResource cmdlet in the Microsoft.PowerShell.PSResourceGet. For more information, see [Publish-PSResource](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.psresourceget/publish-psresource?view=powershellget-3.x).

```bash
Publish-Module
       -Name <String>
       [-RequiredVersion <String>]
       [-NuGetApiKey <String>]
       [-Repository <String>]
       [-Credential <PSCredential>]
       [-FormatVersion <Version>]
       [-ReleaseNotes <String[]>]
       [-Tags <String[]>]
       [-LicenseUri <Uri>]
       [-IconUri <Uri>]
       [-ProjectUri <Uri>]
       [-Exclude <String[]>]
       [-Force]
       [-AllowPrerelease]
       [-SkipAutomaticTags]
       [-WhatIf]
       [-Confirm]
       [<CommonParameters>]
```

```bash
Publish-Module
       -Path <String>
       [-NuGetApiKey <String>]
       [-Repository <String>]
       [-Credential <PSCredential>]
       [-FormatVersion <Version>]
       [-ReleaseNotes <String[]>]
       [-Tags <String[]>]
       [-LicenseUri <Uri>]
       [-IconUri <Uri>]
       [-ProjectUri <Uri>]
       [-Force]
       [-SkipAutomaticTags]
       [-WhatIf]
       [-Confirm]
       [<CommonParameters>]
```


1. Example 1: Publish a module

In this example, MyDscModule is published to the online gallery by using the API key to indicate the module owner's online gallery account. If MyDscModule is not a valid manifest module that specifies a name, version, description, and author, an error occurs.

```bash
Publish-Module -Path c:\projects\MyDscModule\1.0.0 -NuGetApiKey "11e4b435-6cb4-4bf7-8611-5162ed75eb73"
```


2. Example 2: Publish a module with gallery metadata

In this example, MyDscModule is published to the online gallery by using the API key to indicate the module owner's gallery account. The additional metadata provided is displayed on the webpage for the module in the gallery. The owner adds two search tags for the module, relating it to Active Directory; a brief release note is added. If MyDscModule is not a valid manifest module that specifies a name, version, description, and author, an error occurs.

```bash
$parameters = @{
    Path        = 'c:\projects\MyDscModule\1.0.0'
    NuGetApiKey = '11e4b435-6cb4-4bf7-8611-5162ed75eb73'
    LicenseUri  = 'http://contoso.com/license'
    Tag         = 'Active Directory','DSC'
    ReleaseNote = 'Updated the ActiveDirectory DSC Resources to support adding users.'
}
Publish-Module @parameters
```
