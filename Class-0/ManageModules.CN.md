
# Manage modules

# 1. Install Module

从存储库下载一个或多个模块，并将它们安装在本地计算机上。

Install-Module cmdlet 从在线存储库获取一个或多个符合指定条件的模块。该 cmdlet 验证搜索结果是否为有效模块，并将模块文件夹复制到安装位置。安装后的模块不会自动导入。您可以根据指定模块的最小、最大和精确版本筛选要安装的模块。

这是 Microsoft.PowerShell.PSResourceGet 中 Get-InstalledPSResource cmdlet 的代理 cmdlet。有关详细信息，请参阅 [Install-PSResource](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.psresourceget/install-psresource?view=powershellget-3.x).


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


1. Example 1: 查找并安装模块

此示例在存储库中查找一个模块并安装该模块。

```bash
Find-Module -Name PowerShellGet | Install-Module
```

Find-Module 使用 Name 参数指定 PowerShellGet 模块。默认情况下，从存储库下载模块的最新版本。对象通过管道发送到 Install-Module cmdlet。Install-Module 为 $env:ProgramFiles\PowerShell\Modules 中的所有用户安装模块。


2. Example 2: 按名称安装模块

在此示例中，安装了最新版本的 PowerShellGet 模块。

```bash
Install-Module -Name PowerShellGet
```

Install-Module 使用 Name 参数指定 PowerShellGet 模块。默认情况下，从存储库下载并安装模块的最新版本。


3. Example 3: 使用最低版本安装模块

在此示例中，安装了 PowerShellGet 模块的最低版本。MinimumVersion 参数指定应安装的模块的最低版本。如果有较新版本的模块可用，则会为所有用户下载并安装该版本。

```bash
Install-Module -Name PowerShellGet -MinimumVersion 2.0.1
```

Install-Module 使用 Name 参数指定 PowerShellGet 模块。MinimumVersion 参数指定从存储库下载并安装版本 2.0.1。由于版本 2.0.4 可用，因此将为所有用户下载并安装该版本。


4. Example 4: 安装模块的特定版本

在此示例中，安装了特定版本的 PowerShellGet 模块。

```bash
Install-Module -Name PowerShellGet -RequiredVersion 2.0.0
```

Install-Module 使用 Name 参数指定 PowerShellGet 模块。RequiredVersion 参数指定为所有用户下载并安装版本 2.0.0。


5. Example 5: 仅为当前用户安装模块

此示例仅为当前用户下载并安装模块的最新版本。

```bash
Install-Module -Name PowerShellGet -Scope CurrentUser
```

Install-Module 使用 Name 参数指定 PowerShellGet 模块。 Install-Module 下载最新版本的 PowerShellGet 并将其安装到当前用户的目录 $HOME\Documents\PowerShell\Modules 中。


6. Example 6: 安装模块的最新预发布版本

此示例显示了当模块的最新版本为预发布版本时如何安装该版本。安装预发布版本需要 AllowPrerelease 参数。

```bash
Install-Module -Name Microsoft.PowerShell.Crescendo -AllowPrerelease
```

使用此方法，您可以获得最新版本。如果最新版本不是预发布版本，您将获得模块的最新稳定版本。


7. Example 7: 安装模块的特定预发布版本

此示例显示如何安装模块的特定预发布版本。Find-Module cmdlet 可用于在 PowerShell 库中查找模块的预发布版本。

预发布版本的格式为 <version_number>-<prerelease_label>.

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

使用 PowerShell 库中显示的版本作为RequiredVersion 参数的值。


# 2. Uninstall Module

卸载模块。

Uninstall-Module cmdlet 可从本地计算机卸载指定模块。如果其他模块依赖于某个模块，或者该模块未使用 Install-Module cmdlet 安装，则无法卸载该模块。

这是 Microsoft.PowerShell.PSResourceGet 中 Uninstall-PSResource cmdlet 的代理 cmdlet。有关详细信息，请参阅 [Uninstall-PSResource](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.psresourceget/uninstall-psresource?view=powershellget-3.x).

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


1. Example 1: 卸载模块

此示例卸载了一个模块。

```bash
Uninstall-Module -Name SpeculationControl
```

Uninstall-Module 使用 Name 参数指定要从本地计算机卸载的模块。


2. Example 2: 使用管道卸载模块s

在此示例中，管道用于卸载模块。

```bash
Get-InstalledModule -Name SpeculationControl | Uninstall-Module
```

Get-InstalledModule 使用 Name 参数指定模块。对象通过管道发送到 Uninstall-Module 并被卸载。


# 3. Find Module

在存储库中查找符合指定条件的模块。

Find-Module cmdlet 在存储库中查找符合指定条件的模块。 Find-Module 会为其找到的每个模块返回一个 PSRepositoryItemInfo 对象。 可以将对象通过管道发送到 Install-Module 等 cmdlet。

这是 Microsoft.PowerShell.PSResourceGet 中 Find-PSResource cmdlet 的代理 cmdlet。 有关更多信息，请参阅 [Find-PSResource](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.psresourceget/find-psresource?view=powershellget-3.x).

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


1. Example 1: 按名称查找模块

此示例在默认存储库中查找一个模块。

```bash
Find-Module -Name PowerShellGet

Version   Name              Repository           Description
-------   ----              ----------           -----------
2.1.0     PowerShellGet     PSGallery            PowerShell module with commands for discovering...
```

Find-Module cmdlet 使用 Name 参数指定 PowerShellGet 模块。


2. Example 2: 查找具有相似名称的模块

此示例使用星号 (*) 通配符来查找具有相似名称的模块。

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

Find-Module cmdlet 使用带有星号 (*) 通配符的 Name 参数来查找所有包含 PowerShell 的模块。


3. Example 3: 按最低版本查找模块

此示例搜索模块的最低版本。如果存储库包含该模块的较新版本，则返回较新版本。

```bash
Find-Module -Name PowerShellGet -MinimumVersion 1.6.5

Version   Name             Repository     Description
-------   ----             ----------     -----------
2.1.0     PowerShellGet    PSGallery      PowerShell module with commands for discovering...
```

Find-Module cmdlet 使用 Name 参数指定 PowerShellGet 模块。MinimumVersion 指定版本 1.6.5。Find-Module 返回 PowerShellGet 版本 2.1.0，因为它超过了最低版本并且是最新版本。


4. Example 4: 按特定版本查找模块

此示例显示如何安装模块的特定预发布版本。预发布版本的格式为 <version_number>-<prerelease_label>.

```bash
Find-Module PSReadLine -AllowPrerelease -RequiredVersion 2.2.4-beta1

Version        Name             Repository       Description
-------        ----             ----------       -----------
2.2.4-beta1    PSReadLine       PSGallery        Great command line editing in the PowerS…
```

5. Example 5: 在特定存储库中查找模块

此示例使用 Repository 参数在特定存储库中查找模块。

```bash
Find-Module -Name PowerShellGet -Repository PSGallery

Version   Name             Repository     Description
-------   ----             ----------     -----------
2.1.0     PowerShellGet    PSGallery      PowerShell module with commands for discovering...
```

Find-Module cmdlet 使用 Name 参数指定 PowerShellGet 模块。Repository 参数指定搜索 PSGallery 存储库。


6. Example 6: 在多个存储库中查找模块

此示例使用 Register-PSRepository 指定存储库。Find-Module 使用存储库搜索模块。

```bash
Register-PSRepository -Name MySource -SourceLocation https://www.myget.org/F/powershellgetdemo/
Find-Module -Name Contoso* -Repository PSGallery, MySource

Repository    Version   Name             Description
----------    -------   ----             -----------
PSGallery     2.0.0.0   ContosoServer    Cmdlets and DSC resources for managing Contoso Server...
MySource      1.2.0.0   ContosoClient    Cmdlets and DSC resources for managing Contoso Client...
```

Register-PSRepository cmdlet 注册一个新的存储库。Name 参数指定名称 MySource。SourceLocation 参数指定存储库的地址。

Find-Module cmdlet 使用带有星号 (*) 通配符的 Name 参数来指定 Contoso 模块。Repository 参数指定搜索两个存储库，PSGallery 和 MySource。


7. Example 7: 查找包含 DSC 资源的模块

此命令返回包含 DSC 资源的模块。Includes 参数有四个预定义功能，用于搜索存储库。使用 tab-complete 显示 Includes 参数支持的四个功能。

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

Find-Module cmdlet 使用 Repository 参数来搜索存储库 PSGallery。Includes 参数指定 DscResource，这是该参数可以在存储库中搜索的功能。


8. Example 8: 使用过滤器查找模块

在此示例中，为了查找模块，使用过滤器来搜索存储库。

对于基于 NuGet 的存储库，Filter 参数会搜索参数的名称、说明和标签。

```bash
Find-Module -Filter AppDomain

Version    Name              Repository           Description
-------    ----              ----------           -----------
1.0.0.0  AppDomainConfig     PSGallery            Manipulate AppDomain configuration...
1.1.0    ClassExplorer       PSGallery            Quickly search the AppDomain for classes...
```

Find-Module cmdlet 使用 Filter 参数在存储库中搜索 AppDomain。


9. Example 9: 通过标签查找模块

此示例显示如何通过标签查找模块。CrescendoBuilt 值是使用 Microsoft.PowerShell.Crescendo 模块创建的模块中自动添加的标签。

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

从在线库下载并安装指定模块的最新版本到本地计算机。

Update-Module cmdlet 从在线库安装模块的最新版本。系统会提示您在安装更新之前确认。仅针对使用 Install-Module 安装在本地计算机上的模块安装更新。Update-Module 在 $env:PSModulePath 中搜索已安装的模块。

这是 Microsoft.PowerShell.PSResourceGet 中 Update-PSResource cmdlet 的代理 cmdlet。有关详细信息，请参阅 [Update-PSResource](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.psresourceget/update-psresource?view=powershellget-3.x).

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


1. Example 1: 更新所有模块

此示例将在线图库中所有已安装的模块更新为最新版本。

```bash
Update-Module
```


2. Example 2: 按名称更新模块

此示例将在线图库中的特定模块更新为最新版本。

```bash
Update-Module -Name SpeculationControl
```

Update-Module 使用 Name 参数来更新特定模块 SpeculationControl。


3. Example 3: 查看假设更新模块运行情况

此示例执行假设情景，以显示运行 Update-Module 时会发生什么情况。该命令未运行。

```bash
Update-Module -WhatIf

What if: Performing the operation "Update-Module" on target "Version '2.8.0' of module
  'Carbon', updating to version '2.8.1'".
What if: Performing the operation "Update-Module" on target "Version '1.0.10' of module
  'SpeculationControl', updating to version '1.0.14'".
```

Update-Module 使用 WhatIf 参数显示运行 Update-Module 时会发生什么。


4. Example 4: 更新模块到指定版本

在此示例中，模块更新到特定版本。该版本必须存在于在线图库中，否则会显示错误。

```bash
Update-Module -Name SpeculationControl -RequiredVersion 1.0.14
```

Update-Module 使用 Name 参数指定模块 SpeculationControl。RequiredVersion 参数指定版本 1.0.14。


5. Example 5: 无需确认即可更新模块

此示例不请求确认从在线图库将模块更新为最新版本。如果模块已安装，则 Force 参数会重新安装该模块。

```bash
Update-Module -Name SpeculationControl -Force
```

Update-Module 使用 Name 参数指定模块 SpeculationControl。Force 参数更新模块而不请求用户确认。


# 5. Import Module

将模块添加到当前会话。

Import-Module cmdlet 会将一个或多个模块添加到当前会话。从 PowerShell 3.0 开始，当您使用模块中的任何命令或提供程序时，已安装的模块会自动导入到会话中。但是，您仍然可以使用 Import-Module 命令导入模块。您可以使用 $PSModuleAutoloadingPreference 首选项变量禁用自动模块导入。有关 $PSModuleAutoloadingPreference 变量的详细信息，请参阅 about_Preference_Variables。

模块是一个包含可在 PowerShell 中使用的成员的包。成员包括 cmdlet、提供程序、脚本、函数、变量以及其他工具和文件。导入模块后，您可以在会话中使用模块成员。有关模块的详细信息，请参阅 about_Modules。

默认情况下，Import-Module 会导入模块导出的所有成员，但您可以使用 Alias、Function、Cmdlet 和 Variable 参数来限制导入哪些成员。 NoClobber 参数可防止 Import-Module 导入与当前会话中的成员同名的成员。

Import-Module 仅将模块导入当前会话。若要将模块导入每个新会话，请将 Import-Module 命令添加到您的 PowerShell 配置文件中。有关配置文件的详细信息，请参阅 about_Profiles。

您可以通过在远程计算机上创建 PSSession 来管理已启用 PowerShell 远程处理的远程 Windows 计算机。然后使用 Import-Module 的 PSSession 参数导入安装在远程计算机上的模块。当您在当前会话中使用导入的命令时，这些命令会在远程计算机上隐式运行。

从 Windows PowerShell 3.0 开始，您可以使用 Import-Module 导入通用信息模型 (CIM) 模块。CIM 模块在 Cmdlet 定义 XML (CDXML) 文件中定义 cmdlet。此功能允许您使用在非托管代码程序集中实现的 cmdlet，例如用 C++ 编写的程序集。

对于未启用 PowerShell 远程处理的远程计算机（包括未运行 Windows 操作系统的计算机），您可以使用 Import-Module 的 CIMSession 参数从远程计算机导入 CIM 模块。导入的命令在远程计算机上隐式运行。CIMSession 是与远程计算机上的 Windows Management Instrumentation (WMI) 的连接。

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


1. Example 1: 将模块的成员导入当前会话

此示例将 PSDiagnostics 模块的成员导入当前会话。

```bash
Import-Module -Name PSDiagnostics
```


2. Example 2: 导入模块路径指定的所有模块

此示例将 $env:PSModulePath 环境变量指定的路径中的所有可用模块导入当前会话。

```bash
Get-Module -ListAvailable | Import-Module
```


3. Example 3: 将多个模块的成员导入到当前会话中

此示例将 PSDiagnostics 和 Dism 模块的成员导入当前会话。

```bash
$m = Get-Module -ListAvailable PSDiagnostics, Dism
Import-Module -ModuleInfo $m
```

Get-Module cmdlet 获取 PSDiagnostics 和 Dism 模块并将对象保存在 $m 变量中。获取尚未导入会话的模块时，需要 ListAvailable 参数。

Import-Module 的 ModuleInfo 参数用于将模块导入当前会话。


4. Example 4: 导入路径指定的所有模块

此示例使用显式路径来标识要导入的模块。

```bash
Import-Module -Name c:\ps-test\modules\test -Verbose

VERBOSE: Loading module from path 'C:\ps-test\modules\Test\Test.psm1'.
VERBOSE: Exporting function 'my-parm'.
VERBOSE: Exporting function 'Get-Parameter'.
VERBOSE: Exporting function 'Get-Specification'.
VERBOSE: Exporting function 'Get-SpecDetails'.
```

使用 Verbose 参数会导致 Import-Module 在加载模块时报告进度。如果没有 Verbose、PassThru 或 AsCustomObject 参数，Import-Module 在导入模块时不会生成任何输出。


5. Example 5: 限制导入会话的模块成员

此示例显示如何限制导入到会话中的模块成员以及此命令对会话的影响。Function 参数限制从模块导入的成员。您还可以使用 Alias、Variable 和 Cmdlet 参数来限制模块导入的其他成员。

Get-Module cmdlet 获取代表 PSDiagnostics 模块的对象。ExportedCmdlets 属性列出了模块导出的所有 cmdlet，即使它们并非全部导入。

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

使用 Get-Command cmdlet 的 Module 参数显示从 PSDiagnostics 模块导入的命令。结果确认仅导入了 Disable-PSTrace 和 Enable-PSTrace cmdlet。


6. Example 6: 导入模块成员并添加前缀

此示例将 PSDiagnostics 模块导入当前会话，为成员名称添加前缀，然后显示带前缀的成员名称。Import-Module 的 Prefix 参数将 x 前缀添加到从模块导入的所有成员。前缀仅适用于当前会话中的成员。它不会更改模块。PassThru 参数返回表示导入模块的模块对象。

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

Get-Command 获取已从模块导入的成员。输出显示模块成员的前缀正确。


7. Example 7: 获取并使用自定义对象

此示例演示如何获取和使用 Import-Module 返回的自定义对象。

自定义对象包括代表每个导入模块成员的合成成员。例如，模块中的 cmdlet 和函数将转换为自定义对象的脚本方法。

自定义对象在脚本编写中很有用。当多个导入的对象具有相同的名称时，它们也很有用。使用对象的脚本方法相当于指定导入成员的完全限定名称，包括其模块名称。

AsCustomObject 参数仅在导入脚本模块时可用。使用 Get-Module 确定哪个可用模块是脚本模块。

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

Show-Calendar 脚本模块使用 AsCustomObject 参数导入以请求自定义对象，并使用 PassThru 参数返回该对象。生成的自定义对象保存在 $a 变量中，$a 变量通过管道传输到 Get-Member cmdlet，以显示已保存对象的属性和方法。输出显示 Show-Calendar 脚本方法。

要调用 Show-Calendar 脚本方法，方法名称必须用引号括起来，因为名称中包含连字符。


8. Example 8: 将模块重新导入到同一会话中

此示例说明如何在将模块重新导入到同一会话中时使用 Import-Module 的 Force 参数。Force 参数会删除已加载的模块，然后再次导入它。

```bash
Import-Module PSDiagnostics
Import-Module PSDiagnostics -Force -Prefix PS
```

第一个命令导入 PSDiagnostics 模块。第二个命令再次导入该模块，这次使用 Prefix 参数。

如果没有 Force 参数，会话将包含每个 PSDiagnostics cmdlet 的两个副本，一个具有标准名称，另一个具有前缀名称。


9. Example 9: 运行被导入的命令隐藏的命令

此示例显示如何运行已被导入命令隐藏的命令。TestModule 模块包含一个名为 Get-Date 的函数，该函数返回年份和日期。

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

第一个 Get-Date cmdlet 返回带有当前日期的 DateTime 对象。导入 TestModule 模块后，Get-Date 将返回年份和日期。

使用 Get-Command 的 All 参数显示会话中的所有 Get-Date 命令。结果显示会话中有两个 Get-Date 命令，一个来自 TestModule 模块的函数和一个来自 Microsoft.PowerShell.Utility 模块的 cmdlet。

由于函数优先于 cmdlet，因此 TestModule 模块的 Get-Date 函数将运行，而不是 Get-Date cmdlet。要运行原始版本的 Get-Date，必须使用模块名称限定命令名称。

有关 PowerShell 中命令优先级的更多信息，请参阅 about_Command_Precedence。


10. Example 10: 导入模块的最低版本

此示例导入​​ PowerShellGet 模块。它使用 Import-Module 的 MinimumVersion 参数仅导入模块的 2.0.0 或更高版本。

```bash
Import-Module -Name PowerShellGet -MinimumVersion 2.0.0
```

您还可以使用RequiredVersion参数导入模块的特定版本，或者使用#Requires关键字的Module和Version参数在脚本中要求模块的特定版本。


11. Example 11: 使用完全限定名称导入

此示例使用 FullyQualifiedName 导入模块的特定版本。

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


12. Example 12: 使用完全限定路径导入

此示例使用完全限定路径导入模块的特定版本。

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


13. Example 13: 从远程计算机导入模块

此示例显示如何使用 Import-Module cmdlet 从远程计算机导入模块。此命令使用 PowerShell 的隐式远程处理功能。

从另一个会话导入模块时，您可以在当前会话中使用 cmdlet。但是，使用这些 cmdlet 的命令在远程会话中运行。

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

New-PSSession 创建到 Server01 计算机的远程会话 (PSSession)。PSSession 保存在 $s 变量中。

使用 PSSession 参数运行 Get-Module 表明 NetSecurity 模块已安装并可在远程计算机上使用。此命令相当于使用 Invoke-Command cmdlet 在远程会话中运行 Get-Module 命令。例如：

Invoke-Command $s {Get-Module -ListAvailable -Name NetSecurity}

使用 PSSession 参数运行 Import-Module 可将 NetSecurity 模块从远程计算机导入到当前会话中。Get-Command cmdlet 检索以 Get 开头并包含 NetSecurity 模块中的 Firewall 的命令。输出确认模块及其 cmdlet 已导入到当前会话中。

接下来，Get-NetFirewallRule cmdlet 获取 Server01 计算机上的 Windows 远程管理防火墙规则。这相当于使用 Invoke-Command cmdlet 在远程会话上运行 Get-NetFirewallRule。


# 6. Publish Module

将本地计算机中的指定模块发布到在线图库。

Publish-Module cmdlet 使用 API 密钥将模块发布到基于 NuGet 的在线图库，该密钥作为图库中用户个人资料的一部分存储。您可以通过模块名称或包含模块的文件夹路径指定要发布的模块。

这是 Microsoft.PowerShell.PSResourceGet 中 Publish-PSResource cmdlet 的代理 cmdlet。有关详细信息，请参阅 [Publish-PSResource](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.psresourceget/publish-psresource?view=powershellget-3.x).

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


1. Example 1: 发布模块

在此示例中，MyDscModule 使用 API 密钥发布到在线图库，以指示模块所有者的在线图库帐户。如果 MyDscModule 不是指定名称、版本、说明和作者的有效清单模块，则会发生错误。

```bash
Publish-Module -Path c:\projects\MyDscModule\1.0.0 -NuGetApiKey "11e4b435-6cb4-4bf7-8611-5162ed75eb73"
```


2. Example 2: 发布包含图库元数据的模块

在此示例中，MyDscModule 使用 API 密钥发布到在线图库，以指示模块所有者的图库帐户。提供的附加元数据显示在图库中模块的网页上。所有者为模块添加两个搜索标签，将其与 Active Directory 关联；添加了简短的发行说明。如果 MyDscModule 不是指定名称、版本、说明和作者的有效清单模块，则会发生错误。

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

