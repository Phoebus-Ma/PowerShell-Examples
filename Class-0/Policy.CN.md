
# Introduction

内容包括：

1. 执行策略 - 描述 PowerShell 执行策略并说明如何管理它们。
2. Authenticode 签名 - 说明如何对脚本进行签名，以使其符合 PowerShell 执行策略。


# 1. Execution Policy

描述 PowerShell 执行策略并说明如何管理它们。

PowerShell 的执行策略是一种安全功能，可控制 PowerShell 加载配置文件和运行脚本的条件。此功能有助于防止恶意脚本的执行。

在 Windows 计算机上，您可以为本地计算机、当前用户或特定会话设置执行策略。您还可以使用组策略设置来为计算机和用户设置执行策略。

本地计算机和当前用户的执行策略存储在 PowerShell 配置文件中。您无需在 PowerShell 配置文件中设置执行策略。特定会话的执行策略仅存储在内存中，会话关闭时将丢失。

执行策略不是限制用户操作的安全系统。例如，当用户无法运行脚本时，他们可以通过在命令行中键入脚本内容轻松绕过策略。相反，执行策略可帮助用户设置基本规则并防止他们无意中违反这些规则。

在非 Windows 计算机上，默认执行策略为“不受限制”，无法更改。 Set-ExecutionPolicy cmdlet 可用，但 PowerShell 显示控制台消息，表示不支持。虽然 Get-ExecutionPolicy 在非 Windows 平台上返回“不受限制”，但该行为实际上与“绕过”相匹配，因为这些平台未实现 Windows 安全区域。

更多信息，请查看 [about_execution_policies](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.4).


## 1.1 Get Execution Policy

获取当前会话的执行策略。

```bash
Get-ExecutionPolicy
    [[-Scope] <ExecutionPolicyScope>]
    [-List]
    [<CommonParameters>]
```

- List

    获取会话的所有执行策略值。默认情况下，Get-ExecutionPolicy 仅获取有效的执行策略。

- Scope

    - `MachinePolicy` - 由组策略为计算机的所有用户设置。
    - `UserPolicy` - 由计算机当前用户的组策略设置。
    - `Process` - 仅影响当前 PowerShell 会话。
    - `LocalMachine` - 影响计算机所有用户的默认范围。
    - `CurrentUser` - 仅影响当前用户。

获取所有执行策略的示例：

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

为 Windows 计算机设置 PowerShell 执行策略。

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

    在运行 cmdlet 之前提示您确认。

- ExecutionPolicy

    - `AllSigned` - 要求所有脚本和配置文件都由受信任的发布者签名，包括在本地计算机上编写的脚本。

        - 脚本可以运行。
        - 要求所有脚本和配置文件都由受信任的发布者签名，包括您在本地计算机上编写的脚本。
        - 在运行您尚未归类为受信任或不受信任的发布者的脚本之前提示您。
        - 运行已签名但恶意的脚本存在风险。

    - `Bypass` - 没有任何内容被阻止，也没有任何警告或提示。

        - 没有任何内容被阻止，也没有任何警告或提示。
        - 此执行策略专为将 PowerShell 脚本构建到更大的应用程序中的配置或将 PowerShell 作为具有其自己的安全模型的程序的基础的配置而设计。


    - `Default` - 设置默认执行策略。对于 Windows 客户端为受限，对于 Windows 服务器为 RemoteSigned。

        - 设置默认执行策略。
        - 对于 Windows 客户端，限制。
        - 对于 Windows 服务器，RemoteSigned。

    - `RemoteSigned` - 要求从 Internet 下载的所有脚本和配置文件都由受信任的发布者签名。Windows 服务器计算机的默认执行策略。

        - Windows 服务器计算机的默认执行策略。
        - 脚本可以运行。
        - 要求从 Internet 下载的脚本和配置文件（包括电子邮件和即时通讯程序）具有来自受信任发布者的数字签名。
        - 不需要在本地计算机上编写且未从 Internet 下载的脚本上具有数字签名。
        - 如果脚本已解除阻止（例如通过使用 Unblock-File cmdlet），则运行从 Internet 下载且未签名的脚本。
        - 存在运行来自 Internet 以外来源的未签名脚本和可能为恶意的签名脚本的风险。

    - `Restricted` - 不加载配置文件或运行脚本。Windows 客户端计算机的默认执行策略。

        - Windows 客户端计算机的默认执行策略。
        - 允许单个命令，但不允许脚本。
        - 阻止运行所有脚本文件，包括格式和配置文件 (.ps1xml)、模块脚本文件 (.psm1) 和 PowerShell 配置文件 (.ps1)。

    - `Undefined` - 范围未设置执行策略。从未由组策略设置的范围中删除已分配的执行策略。如果所有范围中的执行策略均为“未定义”，则有效执行策略为“受限”。

        - 当前范围内未设置执行策略。
        - 如果所有范围内的执行策略均为“未定义”，则有效执行策略对于 Windows 客户端为“受限”，对于 Windows 服务器为“远程签名”。

- Force

    禁止所有确认提示。请谨慎使用此参数以避免出现意外结果。

- Scope

    - `MachinePolicy` - 由组策略为计算机的所有用户设置。

    - `UserPolicy` - 由计算机当前用户的组策略设置。

    - `Process` - 仅影响当前 PowerShell 会话。

    - `LocalMachine` - 影响计算机所有用户的默认范围。

    - `CurrentUser` - 仅影响当前用户。

- WhatIf

    显示如果运行 cmdlet 会发生什么情况。cmdlet 未运行。

设置执行策略的示例：

```bash
$ Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
$ Get-ExecutionPolicy -List
```

删除执行策略的示例：

```bash
$ Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope LocalMachine
```

注意:

- Unrestricted

    - 非 Windows 计算机的默认执行策略，无法更改。
    - 未签名的脚本可以运行。存在运行恶意脚本的风险。
    - 在运行非本地 Intranet 区域的脚本和配置文件之前警告用户。


# 2. Authenticode Signature

解释如何对脚本进行签名，以使其符合 PowerShell 执行策略。

“受限”执行策略不允许运行任何脚本。“AllSigned”和“RemoteSigned”执行策略阻止 PowerShell 运行没有数字签名的脚本。

本主题解释如何运行未签名的选定脚本（即使执行策略为 RemoteSigned），以及如何对脚本进行签名以供自己使用。

PowerShell 检查以下类型的 Authenticode 签名：

- .ps1 脚本文件。
- .psm1 模块文件。
- .psd1 模块清单和数据文件。
- .ps1xml 类型和格式 XML 文件。
- .cdxml CDXML 脚本文件。
- .xaml XAML 脚本文件。

更多信息，请查看 [about_signing](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_signing?view=powershell-7.4).


## 2.1 Get Authenticode Signature

获取有关文件的 Authenticode 签名的信息。

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

    以字节数组形式检索文件内容，其中已检索 Authenticode 签名。此参数必须与 SourcePathOrExtension 参数一起使用。在 PowerShell 7.4 之前，文件内容必须采用 Unicode (UTF-16LE) 格式。

-FilePath

    指定要检查的文件的路径。允许使用通配符，但它们必须指向单个文件。指定此参数的值时，无需在命令行中键入 FilePath。

-LiteralPath

    指定要检查的文件的路径。与 FilePath 不同，LiteralPath 参数的值按键入的方式使用。不会将任何字符解释为通配符。如果路径包含转义字符，请将其括在单引号中。单引号指示 PowerShell 不要将任何字符解释为转义字符。

-SourcePathOrExtension

    检索 Authenticode 签名的内容的文件或文件类型的路径。此参数与 Content 一起使用，其中文件内容以字节数组形式传递。


获取文件的 Authenticode 签名的示例：

```bash
$ Get-AuthenticodeSignature -FilePath "C:\Test\NewScript.ps1"
```


## 2.2 Set Authenticode Signature

将 Authenticode 签名添加到 PowerShell 脚本或其他文件。

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

    指定将用于对脚本或文件进行签名的证书。输入一个变量，该变量存储表示证书的对象或获取证书的表达式。

    要查找证书，请使用 Get-PfxCertificate 或使用证书 Cert: 驱动器中的 Get-ChildItem cmdlet。如果证书无效或没有代码签名权限，则命令失败。

-Confirm

    在运行 cmdlet 之前提示您确认。

-Content

    此参数出现在语法列表中，因为它是在 Set-AuthenticodeSignature 派生自的基类中定义的。但是，Set-AuthenticodeSignature 中未实现对此参数的支持。

-FilePath

    指定正在签名的文件的路径。

-Force

    允许 cmdlet 将签名附加到只读文件。即使使用 Force 参数，cmdlet 也无法覆盖安全限制。

-HashAlgorithm

    指定 Windows 用于计算文件数字签名的哈希算法。

-IncludeChain

    确定证书信任链中的哪些证书包含在数字签名中。NotRoot 是默认值。

-LiteralPath

    指定要签名的文件的路径。与 FilePath 不同，LiteralPath 参数的值按键入的方式使用。任何字符都不会被解释为通配符。如果路径包含转义字符，请将其括在单引号中。单引号指示 PowerShell 不要将任何字符解释为转义序列。

-SourcePathOrExtension

    此参数出现在语法列表中，因为它是在 Set-AuthenticodeSignature 派生自的基类中定义的。但是，Set-AuthenticodeSignature 中未实现对此参数的支持。

-TimestampServer

    使用指定的时间戳服务器为签名添加时间戳。以字符串形式键入时间戳服务器的 URL。URL 必须以 https:// 或 http:// 开头。

-WhatIf

    显示如果运行 cmdlet 会发生什么情况。cmdlet 未运行。

使用 PFX 文件中的证书签署脚本的示例：

```bash
$ $cert = Get-PfxCertificate -FilePath C:\Test\Mysign.pfx
$ Set-AuthenticodeSignature -FilePath ServerProps.ps1 -Certificate $cert
```
