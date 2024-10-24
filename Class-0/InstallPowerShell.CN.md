
# Installing Powershell

# Installing PowerShell on Windows

## 1. Winget

在 Windows 客户端上安装 PowerShell 的推荐方法。

```bash
$ winget search Microsoft.PowerShell
```

```bash
$ winget install --id Microsoft.PowerShell --source winget
```

or:

```bash
$ winget install --id Microsoft.PowerShell.Preview --source winget
```


## 2. MSI package

Windows 服务器和企业部署场景的最佳选择。

- [PowerShell-7.4.5-win-x64.msi](https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/PowerShell-7.4.5-win-x64.msi)
- [PowerShell-7.4.5-win-x86.msi](https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/PowerShell-7.4.5-win-x86.msi)
- [PowerShell-7.4.5-win-arm64.msi](https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/PowerShell-7.4.5-win-arm64.msi)


## 3. ZIP package

“侧载”或安装多个版本的最简单方法。
此方法适用于 Windows Nano Server、Windows IoT 和基于 Arm 的系统。

- [PowerShell-7.4.5-win-x64.zip](https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/PowerShell-7.4.5-win-x64.zip)
- [PowerShell-7.4.5-win-x86.zip](https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/PowerShell-7.4.5-win-x86.zip)
- [PowerShell-7.4.5-win-arm64.zip](https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/PowerShell-7.4.5-win-arm64.zip)


## 4. .NET Global tool

对于安装和使用其他全局工具的 .NET 开发人员来说，这是一个不错的选择。

```bash
$ dotnet tool install --global PowerShell
```


## 5. Microsoft Store package

对于 PowerShell 的普通用户来说，这是一种简单的安装方法，但有局限性。

PowerShell 可以从 Microsoft Store 安装。您可以在[Microsoft Store](https://www.microsoft.com/store/apps/9MZ1SNWT0N5D)网站或 Windows 中的 Store 应用程序中找到 PowerShell 版本。

Microsoft Store 套餐的优势：

- 内置于 Windows 中的自动更新；
- 与其他软件分发机制（如 Intune 和 Configuration Manager）集成；
- 可以在使用 x86、x64 或 Arm64 处理器的 Windows 系统上安装。


# Installing PowerShell on Linux

## Installing on Alpine

### 1. Install

Alpine 上的安装基于从发布页面下载 tar.gz 包。包的 URL 取决于您要安装的 PowerShell 版本。

- PowerShell 7.4.5 - <https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/powershell-7.4.5-linux-musl-x64.tar.gz>
- PowerShell 7.2.23 - <https://github.com/PowerShell/PowerShell/releases/download/v7.2.23/powershell-7.2.23-linux-alpine-x64.tar.gz>
- PowerShell 7.5-preview.4 - <https://github.com/PowerShell/PowerShell/releases/download/v7.5.0-preview.3/powershell-7.5.0-preview.3-linux-musl-x64.tar.gz>

然后，在终端中执行以下 shell 命令来安装 PowerShell 7.4：

```bash
# install the requirements
sudo apk add --no-cache \
    ca-certificates \
    less \
    ncurses-terminfo-base \
    krb5-libs \
    libgcc \
    libintl \
    libssl1.1 \
    libstdc++ \
    tzdata \
    userspace-rcu \
    zlib \
    icu-libs \
    curl

sudo apk -X https://dl-cdn.alpinelinux.org/alpine/edge/main add --no-cache \
    lttng-ust

# Download the powershell '.tar.gz' archive
curl -L https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/powershell-7.4.5-linux-musl-x64.tar.gz -o /tmp/powershell.tar.gz

# Create the target folder where powershell will be placed
sudo mkdir -p /opt/microsoft/powershell/7

# Expand powershell to the target folder
sudo tar zxf /tmp/powershell.tar.gz -C /opt/microsoft/powershell/7

# Set execute permissions
sudo chmod +x /opt/microsoft/powershell/7/pwsh

# Create the symbolic link that points to pwsh
sudo ln -s /opt/microsoft/powershell/7/pwsh /usr/bin/pwsh

# Start PowerShell
pwsh
```


### 2. Uninstall

```bash
$ sudo rm -rf /usr/bin/pwsh /opt/microsoft/powershell
```


### PowerShell paths

- $PSHOME is /opt/microsoft/powershell/7/

- 配置文件脚本存储在以下位置：

    - AllUsersAllHosts - $PSHOME/profile.ps1
    - AllUsersCurrentHost - $PSHOME/Microsoft.PowerShell_profile.ps1
    - CurrentUserAllHosts - ~/.config/powershell/profile.ps1
    - CurrentUserCurrentHost - ~/.config/powershell/Microsoft.PowerShell_profile.ps1

- 模块存储在以下位置：

    - User modules - ~/.local/share/powershell/Modules
    - Shared modules - /usr/local/share/powershell/Modules
    - Default modules - $PSHOME/Modules

- PSReadLine 历史记录在 ~/.local/share/powershell/PSReadLine/ConsoleHost_history.txt

    - 配置文件尊重 PowerShell 的每个主机配置，因此默认主机特定配置文件存在于相同位置的 Microsoft.PowerShell_profile.ps1 中。

PowerShell 遵循 Linux 上的 [XDG 基本目录规范](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)。


## Installing on Debian

### Installation on Debian 10 or 11 via the Package Repository

Microsoft 为 Linux 系统构建并支持各种软件产品，并通过 Linux 打包客户端（apt、dnf、yum 等）提供这些产品。这些 Linux 软件包托管在 Microsoft 产品的 Linux 软件包存储库 <https://packages.microsoft.com>（也称为 PMC）上。

从 PMC 安装 PowerShell 是首选安装方法。

```bash
###################################
# Prerequisites

# Update the list of packages
sudo apt-get update

# Install pre-requisite packages.
sudo apt-get install -y wget

# Get the version of Debian
source /etc/os-release

# Download the Microsoft repository GPG keys
wget -q https://packages.microsoft.com/config/debian/$VERSION_ID/packages-microsoft-prod.deb

# Register the Microsoft repository GPG keys
sudo dpkg -i packages-microsoft-prod.deb

# Delete the Microsoft repository GPG keys file
rm packages-microsoft-prod.deb

# Update the list of packages after we added packages.microsoft.com
sudo apt-get update

###################################
# Install PowerShell
sudo apt-get install -y powershell

# Start PowerShell
pwsh
```


### Installation via direct download

PowerShell 7.2 引入了一个通用软件包，使安装更加容易。从发布页面将通用软件包下载到您的 Debian 计算机上。

当前版本的链接为：

- 适用于受支持的 Debian 版本的 PowerShell 7.4 (LTS) 通用软件包

    - <https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/powershell_7.4.5-1.deb_amd64.deb>

- 适用于受支持的 Debian 版本的 PowerShell 7.2 (LTS) 通用软件包

    - <https://github.com/PowerShell/PowerShell/releases/download/v7.2.23/powershell_7.2.23-1.deb_amd64.deb>

- 适用于受支持的 Debian 版本的 PowerShell 7.5 预览通用软件包

    - <https://github.com/PowerShell/PowerShell/releases/download/v7.5.0-preview.3/powershell-preview_7.5.0-preview.3-1.deb_amd64.deb>

以下 shell 脚本下载并安装当前版本的 PowerShell。您可以更改 URL 以下载要安装的 PowerShell 版本。

```bash
###################################
# Prerequisites

# Update the list of packages
sudo apt-get update

# Install pre-requisite packages.
sudo apt-get install -y wget

# Download the PowerShell package file
wget https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/powershell_7.4.5-1.deb_amd64.deb

###################################
# Install the PowerShell package
sudo dpkg -i powershell_7.4.5-1.deb_amd64.deb

# Resolve missing dependencies and finish the install (if necessary)
sudo apt-get install -f

# Delete the downloaded package file
rm powershell_7.4.5-1.deb_amd64.deb

# Start PowerShell
pwsh
```

### Uninstall PowerShell

```bash
$ sudo apt-get remove powershell
```


### PowerShell paths

- $PSHOME is /opt/microsoft/powershell/7/

- 配置文件脚本存储在以下位置：

    - AllUsersAllHosts - $PSHOME/profile.ps1
    - AllUsersCurrentHost - $PSHOME/Microsoft.PowerShell_profile.ps1
    - CurrentUserAllHosts - ~/.config/powershell/profile.ps1
    - CurrentUserCurrentHost - ~/.config/powershell/Microsoft.PowerShell_profile.ps1

- 模块存储在以下位置：

    - User modules - ~/.local/share/powershell/Modules
    - Shared modules - /usr/local/share/powershell/Modules
    - Default modules - $PSHOME/Modules

- PSReadLine 历史记录在 ~/.local/share/powershell/PSReadLine/ConsoleHost_history.txt

PowerShell 遵循 Linux 上的 [XDG 基本目录规范](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)。


## Installing on RHEL

### Installation via the Package Repository

Microsoft 为 Linux 系统构建并支持各种软件产品，并通过 Linux 打包客户端（apt、dnf、yum 等）提供这些产品。这些 Linux 软件包托管在 Microsoft 产品的 Linux 软件包存储库 <https://packages.microsoft.com>（也称为 PMC）上。

从 PMC 安装 PowerShell 是首选安装方法。

```bash
###################################
# Prerequisites

# Get version of RHEL
source /etc/os-release
if [ $(bc<<<"$VERSION_ID < 8") = 1 ]
then majorver=7
elif [ $(bc<<<"$VERSION_ID < 9") = 1 ]
then majorver=8
else majorver=9
fi

# Download the Microsoft RedHat repository package
curl -sSL -O https://packages.microsoft.com/config/rhel/$majorver/packages-microsoft-prod.rpm

# Register the Microsoft RedHat repository
sudo rpm -i packages-microsoft-prod.rpm

# Delete the downloaded package after installing
rm packages-microsoft-prod.rpm

# RHEL 7.x uses yum and RHEL 8+ uses dnf
if [ $(bc<<<"$majorver < 8") ]
then
    # Update package index files
    sudo yum update
    # Install PowerShell
    sudo yum install powershell -y
else
    # Update package index files
    sudo dnf update
    # Install PowerShell
    sudo dnf install powershell -y
fi
```


### Installation via direct download

PowerShell 7.2 引入了一个通用软件包，使安装更加容易。从发布页面将通用软件包下载到您的 RHEL 计算机上。

当前版本的链接为：

- 适用于受支持的 RHEL 版本的 PowerShell 7.4.5 通用包

    - <https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/powershell-7.4.5-1.rh.x86_64.rpm>

- 适用于受支持的 RHEL 版本的 PowerShell 7.2.23 通用包

    - <https://github.com/PowerShell/PowerShell/releases/download/v7.2.23/powershell-7.2.23-1.rh.x86_64.rpm>

- 适用于受支持的 RHEL 版本的 PowerShell 7.5-preview.4 通用包

    - <https://github.com/PowerShell/PowerShell/releases/download/v7.5.0-preview.3/powershell-preview-7.5.0_preview.2-1.rh.x86_64.rpm>

以下 shell 脚本下载并安装 PowerShell 的当前预览版本。您可以更改 URL 以下载要安装的 PowerShell 版本。

在 RHEL 8 或 9 上：

```bash
$ sudo dnf install https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/powershell-7.4.5-1.rh.x86_64.rpm
```


### Uninstall PowerShell

On RHEL 8 or 9:

```bash
$ sudo dnf remove powershell
```


### Support for Arm processors

PowerShell 7.2 及更高版本支持在使用 64 位 Arm 处理器的 RHEL 上运行。使用二进制存档安装方法安装 PowerShell，方法如下所述 [Alternate ways to install PowerShell on Linux](https://learn.microsoft.com/en-us/powershell/scripting/install/install-other-linux?view=powershell-7.4#binary-archives).


### PowerShell paths

- $PSHOME is /opt/microsoft/powershell/7/

- 配置文件脚本存储在以下位置：

    - AllUsersAllHosts - $PSHOME/profile.ps1
    - AllUsersCurrentHost - $PSHOME/Microsoft.PowerShell_profile.ps1
    - CurrentUserAllHosts - ~/.config/powershell/profile.ps1
    - CurrentUserCurrentHost - ~/.config/powershell/Microsoft.PowerShell_profile.ps1

- 模块存储在以下位置：

    - User modules - ~/.local/share/powershell/Modules
    - Shared modules - /usr/local/share/powershell/Modules
    - Default modules - $PSHOME/Modules

- PSReadLine 历史记录在 ~/.local/share/powershell/PSReadLine/ConsoleHost_history.txt

PowerShell 遵循 Linux 上的 [XDG 基本目录规范](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)。


## Installing on Ubuntu

### Installation via Package Repository the Package Repository

Microsoft 为 Linux 系统构建并支持各种软件产品，并通过 Linux 打包客户端（apt、dnf、yum 等）提供这些产品。这些 Linux 软件包托管在 Microsoft 产品的 Linux 软件包存储库 <https://packages.microsoft.com>（也称为 PMC）上。

从 PMC 安装 PowerShell 是首选安装方法。

```bash
###################################
# Prerequisites

# Update the list of packages
sudo apt-get update

# Install pre-requisite packages.
sudo apt-get install -y wget apt-transport-https software-properties-common

# Get the version of Ubuntu
source /etc/os-release

# Download the Microsoft repository keys
wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb

# Register the Microsoft repository keys
sudo dpkg -i packages-microsoft-prod.deb

# Delete the Microsoft repository keys file
rm packages-microsoft-prod.deb

# Update the list of packages after we added packages.microsoft.com
sudo apt-get update

###################################
# Install PowerShell
sudo apt-get install -y powershell

# Start PowerShell
pwsh
```


### Installation via direct download

PowerShell 7.2 引入了一个通用软件包，使安装更加简单。从 [releases](https://aka.ms/PowerShell-Release?tag=stable)页面将通用软件包下载到您的 Ubuntu 计算机上。

当前版本的链接是：

- 适用于受支持的 Ubuntu 版本的 PowerShell 7.4 (LTS) 通用软件包

    - <https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/powershell_7.4.5-1.deb_amd64.deb>

- 适用于受支持的 Ubuntu 版本的 PowerShell 7.2 (LTS) 通用软件包

    - <https://github.com/PowerShell/PowerShell/releases/download/v7.2.23/powershell_7.2.23-1.deb_amd64.deb>

- 适用于受支持的 Ubuntu 版本的 PowerShell 7.5-preview.4 通用包

    - <https://github.com/PowerShell/PowerShell/releases/download/v7.5.0-preview.3/powershell-preview_7.5.0-preview.3-1.deb_amd64.deb>

以下 shell 脚本下载并安装 PowerShell 的当前预览版本。您可以更改 URL 以下载要安装的 PowerShell 版本。

```bash
###################################
# Prerequisites

# Update the list of packages
sudo apt-get update

# Install pre-requisite packages.
sudo apt-get install -y wget

# Download the PowerShell package file
wget https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/powershell_7.4.5-1.deb_amd64.deb

###################################
# Install the PowerShell package
sudo dpkg -i powershell_7.4.5-1.deb_amd64.deb

# Resolve missing dependencies and finish the install (if necessary)
sudo apt-get install -f

# Delete the downloaded package file
rm powershell_7.4.5-1.deb_amd64.deb

# Start PowerShell Preview
pwsh
```


### Uninstall PowerShell

```bash
$ sudo apt-get remove powershell
```


### Support for Arm processors

PowerShell 7.2 及更新版本支持在使用 32 位 Arm 处理器的 Ubuntu 上运行。使用二进制存档安装方法安装 PowerShell，方法如下所述 [Alternate ways to install PowerShell on Linux](https://learn.microsoft.com/en-us/powershell/scripting/install/install-other-linux).


### PowerShell paths

- $PSHOME is /opt/microsoft/powershell/7/

- 配置文件脚本存储在以下位置：

    - AllUsersAllHosts - $PSHOME/profile.ps1
    - AllUsersCurrentHost - $PSHOME/Microsoft.PowerShell_profile.ps1
    - CurrentUserAllHosts - ~/.config/powershell/profile.ps1
    - CurrentUserCurrentHost - ~/.config/powershell/Microsoft.PowerShell_profile.ps1

- 模块存储在以下位置：

    - User modules - ~/.local/share/powershell/Modules
    - Shared modules - /usr/local/share/powershell/Modules
    - Default modules - $PSHOME/Modules

- PSReadLine 历史记录在 ~/.local/share/powershell/PSReadLine/ConsoleHost_history.txt

PowerShell 遵循 Linux 上的 [XDG 基本目录规范](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)。


# Installing PowerShell on MacOS

## Install the latest stable release of PowerShell

有几种方法可以在 macOS 上安装 PowerShell。请选择以下方法之一：

- 使用 Homebrew 安装。Homebrew 是 macOS 的首选软件包管理器。
- 通过直接下载安装 PowerShell
- 从二进制存档安装。

如果找不到 brew 命令，则需要按照其说明安装 Homebrew。

```bash
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

安装 brew 后，您可以安装 PowerShell。

以下命令安装 PowerShell 的最新稳定版本：

```bash
$ brew install powershell/tap/powershell
```

最后，验证你的安装是否正常工作：

```bash
$ pwsh
```

当 PowerShell 新版本发布时，更新 Homebrew 的公式并升级 PowerShell：

```bash
$ brew update
$ brew upgrade powershell
```


## Install the latest preview release of PowerShell

安装 Homebrew 后，可以安装 PowerShell。

```bash
$ brew install powershell/tap/powershell-preview
```

运行以下命令启动 PowerShell 的预览版本：

```bash
$ pwsh-preview
```

当 PowerShell 新版本发布时，更新 Homebrew 的公式并升级 PowerShell：

```bash
$ brew update
$ brew upgrade powershell-preview
```


## Install the latest LTS release of PowerShell

```bash
$ brew install powershell/tap/powershell-lts
```

您现在可以验证您的安装

```bash
$ pwsh
```

当 PowerShell 发布新版本时，运行以下命令。

```bash
$ brew upgrade powershell-lts
```


## Installation via Direct Download

从 7.2 版开始，PowerShell 支持 Apple M 系列基于 Arm 的处理器。从 [releases](https://aka.ms/powershell-release?tag=stable) 页面下载安装包到您的计算机上。当前版本的链接如下：

- PowerShell 7.4

    - x64 processors - [powershell-7.4.5-osx-x64.pkg](https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/powershell-7.4.5-osx-x64.pkg)
    - Arm64 processors - [powershell-7.4.5-osx-arm64.pkg](https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/powershell-7.4.5-osx-arm64.pkg)

- PowerShell 7.2 (LTS)

    - x64 processors - [powershell-7.2.23-osx-x64.pkg](https://github.com/PowerShell/PowerShell/releases/download/v7.2.23/powershell-7.2.23-osx-x64.pkg)
    - Arm64 processors - [powershell-7.2.23-osx-arm64.pkg](https://github.com/PowerShell/PowerShell/releases/download/v7.2.23/powershell-7.2.23-osx-arm64.pkg)

- PowerShell 7.5-preview

    - x64 processors - [powershell-7.5.0-preview.3-osx-x64.pkg](https://github.com/PowerShell/PowerShell/releases/download/v7.5.0-preview.3/powershell-7.5.0-preview.3-osx-x64.pkg)
    - Arm64 processors - [powershell-7.5.0-preview.3-arm64.pkg](https://github.com/PowerShell/PowerShell/releases/download/v7.5.0-preview.3/powershell-7.5.0-preview.3-osx-arm64.pkg)

您可以双击该文件并按照提示进行操作，也可以使用以下命令从终端进行安装。将文件的名称更改为与您下载的文件相匹配。

```bash
$ sudo installer -pkg ./Downloads/powershell-7.4.5-osx-x64.pkg -target /
```

如果您运行的是 macOS Big Sur 11.5 或更高版本，则在安装包时可能会收到以下错误消息：

> 无法打开“powershell-7.4.5-osx-x64.pkg”，因为 Apple 无法检查其是否存在恶意软件。

有两种方法可以解决此问题：

使用 Finder

1. 在 Finder 中找到包。

2. 按住 Control 键并单击（同时按住 Ctrl 键单击）包。

3. 从上下文菜单中选择“打开”。

从命令行

1. 运行 `sudo xattr -rd com.apple.quarantine ./Downloads/powershell-7.4.5-osx-x64.pkg`. 如果您使用的是 PowerShell 7 或更高版本，则可以使用 Unblock-File cmdlet。包括 .pkg 文件的完整路径。

2. 按照通常方式安装该包。


## Install as a .NET Global tool

如果您已经安装了 .NET Core SDK，则可以轻松地将 PowerShell 安装为 .NET 全局工具。

```bash
$ dotnet tool install --global PowerShell
```

dotnet 工具安装程序将 ~/.dotnet/tools 添加到您的 PATH 环境变量中。但是，当前运行的 shell 没有更新的 PATH。您应该能够通过键入 pwsh 从新 shell 启动 PowerShell。


## Binary Archives

为 macOS 平台提供了 PowerShell 二进制 tar.gz 存档，以支持高级部署方案。使用此方法安装时，您还必须手动安装任何依赖项。

在 macOS 上安装二进制存档
从发布页面将安装包下载到您的计算机上。当前版本的链接为：

- PowerShell 7.4 (LTS)

    - x64 processors - [powershell-7.4.5-osx-x64.tar.gz](https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/powershell-7.4.5-osx-x64.tar.gz)
    - Arm64 processors - [powershell-7.4.5-osx-arm64.tar.gz](https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/powershell-7.4.5-osx-arm64.tar.gz)

- PowerShell 7.2 (LTS)

    - x64 processors - [powershell-7.2.23-osx-x64.tar.gz](https://github.com/PowerShell/PowerShell/releases/download/v7.2.23/powershell-7.2.23-osx-x64.tar.gz)
    - Arm64 processors - [powershell-7.2.23-osx-arm64.tar.gz](https://github.com/PowerShell/PowerShell/releases/download/v7.2.23/powershell-7.2.23-osx-arm64.tar.gz)

- PowerShell 7.5-preview

    - x64 processors - [powershell-7.5.0-preview.3-osx-x64.tar.gz](https://github.com/PowerShell/PowerShell/releases/download/v7.5.0-preview.3/powershell-7.5.0-preview.3-osx-x64.tar.gz)
    - Arm64 processors - [powershell-7.5.0-preview.3-osx-arm64.tar.gz](https://github.com/PowerShell/PowerShell/releases/download/v7.5.0-preview.3/powershell-7.5.0-preview.3-osx-arm64.tar.gz)

使用以下命令从二进制存档安装 PowerShell。更改下载 URL 以匹配您要安装的版本。

```bash
# Download the powershell '.tar.gz' archive
curl -L -o /tmp/powershell.tar.gz https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/powershell-7.4.5-osx-x64.tar.gz

# Create the target folder where powershell is placed
sudo mkdir -p /usr/local/microsoft/powershell/7

# Expand powershell to the target folder
sudo tar zxf /tmp/powershell.tar.gz -C /usr/local/microsoft/powershell/7

# Set execute permissions
sudo chmod +x /usr/local/microsoft/powershell/7/pwsh

# Create the symbolic link that points to pwsh
sudo ln -s /usr/local/microsoft/powershell/7/pwsh /usr/local/bin/pwsh
```


## Uninstalling PowerShell

如果您使用 Homebrew 安装了 PowerShell，请使用以下命令进行卸载：

```bash
$ brew uninstall --cask powershell 
```

如果您通过直接下载安装了 PowerShell，则必须手动删除 PowerShell：

```bash
$ sudo rm -rf /usr/local/bin/pwsh /usr/local/microsoft/powershell
```

要删除其他 PowerShell 路径，请参阅本文档中的路径部分并使用 sudo rm 删除路径。


## Paths

- $PSHOME is /usr/local/microsoft/powershell/7

    - macOS 安装包创建一个符号链接 /usr/local/bin/pwsh，指向 $PSHOME 位置的 pwsh。

- 用户配置文件读取自 ~/.config/powershell/profile.ps1

- 默认配置文件读取自 $PSHOME/profile.ps1

- 用户模块读取自 ~/.local/share/powershell/Modules

- 共享模块读取自 /usr/local/share/powershell/Modules

- 默认模块读取自 $PSHOME/Modules

- PSReadLine 历史记录在 ~/.local/share/powershell/PSReadLine/ConsoleHost_history.txt

PowerShell 尊重 macOS 上的 XDG 基目录规范。
