
# Installing Powershell

# Installing PowerShell on Windows

## 1. Winget

Recommended way to install PowerShell on Windows clients.

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

Best choice for Windows Servers and enterprise deployment scenarios.

- [PowerShell-7.4.5-win-x64.msi](https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/PowerShell-7.4.5-win-x64.msi)
- [PowerShell-7.4.5-win-x86.msi](https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/PowerShell-7.4.5-win-x86.msi)
- [PowerShell-7.4.5-win-arm64.msi](https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/PowerShell-7.4.5-win-arm64.msi)


## 3. ZIP package

Easiest way to "side load" or install multiple versions.
Use this method for Windows Nano Server, Windows IoT, and Arm-based systems.

- [PowerShell-7.4.5-win-x64.zip](https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/PowerShell-7.4.5-win-x64.zip)
- [PowerShell-7.4.5-win-x86.zip](https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/PowerShell-7.4.5-win-x86.zip)
- [PowerShell-7.4.5-win-arm64.zip](https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/PowerShell-7.4.5-win-arm64.zip)


## 4. .NET Global tool

A good choice for .NET developers that install and use other global tools.

```bash
$ dotnet tool install --global PowerShell
```


## 5. Microsoft Store package

An easy way to install for casual users of PowerShell but has limitations.

PowerShell can be installed from the Microsoft Store. You can find the PowerShell release in the [Microsoft Store](https://www.microsoft.com/store/apps/9MZ1SNWT0N5D) site or in the Store application in Windows.

Benefits of the Microsoft Store package:

- Automatic updates built right into Windows;
- Integrates with other software distribution mechanisms like Intune and Configuration Manager;
- Can install on Windows systems using x86, x64, or Arm64 processors.


# Installing PowerShell on Linux

## Installing on Alpine

### 1. Install

Installation on Alpine is based on downloading tar.gz package from the releases page. The URL to the package depends on the version of PowerShell you want to install.

- PowerShell 7.4.5 - <https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/powershell-7.4.5-linux-musl-x64.tar.gz>
- PowerShell 7.2.23 - <https://github.com/PowerShell/PowerShell/releases/download/v7.2.23/powershell-7.2.23-linux-alpine-x64.tar.gz>
- PowerShell 7.5-preview.4 - <https://github.com/PowerShell/PowerShell/releases/download/v7.5.0-preview.3/powershell-7.5.0-preview.3-linux-musl-x64.tar.gz>

Then, in the terminal, execute the following shell commands to install PowerShell 7.4:

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

- The profiles scripts are stored in the following locations:

    - AllUsersAllHosts - $PSHOME/profile.ps1
    - AllUsersCurrentHost - $PSHOME/Microsoft.PowerShell_profile.ps1
    - CurrentUserAllHosts - ~/.config/powershell/profile.ps1
    - CurrentUserCurrentHost - ~/.config/powershell/Microsoft.PowerShell_profile.ps1

- Modules are stored in the following locations:
    - User modules - ~/.local/share/powershell/Modules
    - Shared modules - /usr/local/share/powershell/Modules
    - Default modules - $PSHOME/Modules

- PSReadLine history is recorded in ~/.local/share/powershell/PSReadLine/ConsoleHost_history.txt

    - The profiles respect PowerShell's per-host configuration, so the default host-specific profiles exists at Microsoft.PowerShell_profile.ps1 in the same locations.

PowerShell respects the [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) on Linux.


## Installing on Debian

### Installation on Debian 10 or 11 via the Package Repository

Microsoft builds and supports a variety of software products for Linux systems and makes them available via Linux packaging clients (apt, dnf, yum, etc). These Linux software packages are hosted on the Linux package repository for Microsoft products, https://packages.microsoft.com, also known as PMC.

Installing PowerShell from PMC is the preferred method of installation.

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

PowerShell 7.2 introduced a universal package that makes installation easier. Download the universal package from the releases page onto your Debian machine.

The link to the current version is:

- PowerShell 7.4 (LTS) universal package for supported versions of Debian

    - <https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/powershell_7.4.5-1.deb_amd64.deb>

- PowerShell 7.2 (LTS) universal package for supported versions of Debian

    - <https://github.com/PowerShell/PowerShell/releases/download/v7.2.23/powershell_7.2.23-1.deb_amd64.deb>

- PowerShell 7.5-preview universal package for supported versions of Debian

    - <https://github.com/PowerShell/PowerShell/releases/download/v7.5.0-preview.3/powershell-preview_7.5.0-preview.3-1.deb_amd64.deb>

The following shell script downloads and installs the current release of PowerShell. You can change the URL to download the version of PowerShell that you want to install.

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

- The profiles scripts are stored in the following locations:

    - AllUsersAllHosts - $PSHOME/profile.ps1
    - AllUsersCurrentHost - $PSHOME/Microsoft.PowerShell_profile.ps1
    - CurrentUserAllHosts - ~/.config/powershell/profile.ps1
    - CurrentUserCurrentHost - ~/.config/powershell/Microsoft.PowerShell_profile.ps1

- Modules are stored in the following locations:

    - User modules - ~/.local/share/powershell/Modules
    - Shared modules - /usr/local/share/powershell/Modules
    - Default modules - $PSHOME/Modules

- PSReadLine history is recorded in ~/.local/share/powershell/PSReadLine/ConsoleHost_history.txt

PowerShell respects the [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) on Linux.


## Installing on RHEL

### Installation via the Package Repository

Microsoft builds and supports a variety of software products for Linux systems and makes them available via Linux packaging clients (apt, dnf, yum, etc). These Linux software packages are hosted on the Linux package repository for Microsoft products, https://packages.microsoft.com, also known as PMC.

Installing PowerShell from PMC is the preferred method of installation.

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

PowerShell 7.2 introduced a universal package that makes installation easier. Download the universal package from the releases page onto your RHEL machine.

The link to the current version is:

- PowerShell 7.4.5 universal package for supported versions of RHEL

    - <https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/powershell-7.4.5-1.rh.x86_64.rpm>

- PowerShell 7.2.23 universal package for supported versions of RHEL

    - <https://github.com/PowerShell/PowerShell/releases/download/v7.2.23/powershell-7.2.23-1.rh.x86_64.rpm>

- PowerShell 7.5-preview.4 universal package for supported versions of RHEL

    - <https://github.com/PowerShell/PowerShell/releases/download/v7.5.0-preview.3/powershell-preview-7.5.0_preview.2-1.rh.x86_64.rpm>

The following shell script downloads and installs the current preview release of PowerShell. You can change the URL to download the version of PowerShell that you want to install.

On RHEL 8 or 9:

```bash
$ sudo dnf install https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/powershell-7.4.5-1.rh.x86_64.rpm
```


### Uninstall PowerShell

On RHEL 8 or 9:

```bash
$ sudo dnf remove powershell
```


### Support for Arm processors

PowerShell 7.2 and newer supports running on RHEL using a 64-bit Arm processor. Use the binary archive installation method of installing PowerShell that's described in [Alternate ways to install PowerShell on Linux](https://learn.microsoft.com/en-us/powershell/scripting/install/install-other-linux?view=powershell-7.4#binary-archives).


### PowerShell paths

- $PSHOME is /opt/microsoft/powershell/7/

- The profiles scripts are stored in the following locations:

    - AllUsersAllHosts - $PSHOME/profile.ps1
    - AllUsersCurrentHost - $PSHOME/Microsoft.PowerShell_profile.ps1
    - CurrentUserAllHosts - ~/.config/powershell/profile.ps1
    - CurrentUserCurrentHost - ~/.config/powershell/Microsoft.PowerShell_profile.ps1

- Modules are stored in the following locations:

    - User modules - ~/.local/share/powershell/Modules
    - Shared modules - /usr/local/share/powershell/Modules
    - Default modules - $PSHOME/Modules

- PSReadLine history is recorded in ~/.local/share/powershell/PSReadLine/ConsoleHost_history.txt

PowerShell respects the [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) on Linux.


## Installing on Ubuntu

### Installation via Package Repository the Package Repository

Microsoft builds and supports a variety of software products for Linux systems and makes them available via Linux packaging clients (apt, dnf, yum, etc). These Linux software packages are hosted on the Linux package repository for Microsoft products, <https://packages.microsoft.com>, also known as PMC.

Installing PowerShell from PMC is the preferred method of installation.

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

PowerShell 7.2 introduced a universal package that makes installation easier. Download the universal package from the [releases](https://aka.ms/PowerShell-Release?tag=stable) page onto your Ubuntu machine.

The link to the current version is:

- PowerShell 7.4 (LTS) universal package for supported versions of Ubuntu

    - <https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/powershell_7.4.5-1.deb_amd64.deb>

- PowerShell 7.2 (LTS) universal package for supported versions of Ubuntu

    - <https://github.com/PowerShell/PowerShell/releases/download/v7.2.23/powershell_7.2.23-1.deb_amd64.deb>

- PowerShell 7.5-preview.4 universal package for supported versions of Ubuntu

    - <https://github.com/PowerShell/PowerShell/releases/download/v7.5.0-preview.3/powershell-preview_7.5.0-preview.3-1.deb_amd64.deb>

The following shell script downloads and installs the current preview release of PowerShell. You can change the URL to download the version of PowerShell that you want to install.

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

PowerShell 7.2 and newer supports running on Ubuntu using 32-bit Arm processors. Use the binary archive installation method of installing PowerShell that's described in [Alternate ways to install PowerShell on Linux](https://learn.microsoft.com/en-us/powershell/scripting/install/install-other-linux).


### PowerShell paths

- $PSHOME is /opt/microsoft/powershell/7/

- The profiles scripts are stored in the following locations:

    - AllUsersAllHosts - $PSHOME/profile.ps1
    - AllUsersCurrentHost - $PSHOME/Microsoft.PowerShell_profile.ps1
    - CurrentUserAllHosts - ~/.config/powershell/profile.ps1
    - CurrentUserCurrentHost - ~/.config/powershell/Microsoft.PowerShell_profile.ps1

- Modules are stored in the following locations:

    - User modules - ~/.local/share/powershell/Modules
    - Shared modules - /usr/local/share/powershell/Modules
    - Default modules - $PSHOME/Modules

- PSReadLine history is recorded in ~/.local/share/powershell/PSReadLine/ConsoleHost_history.txt

PowerShell respects the [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) on Linux.


# Installing PowerShell on MacOS

## Install the latest stable release of PowerShell

There are several ways to install PowerShell on macOS. Choose one of the following methods:

- Install using Homebrew. Homebrew is the preferred package manager for macOS.
- Install PowerShell via Direct Download
- Install from binary archives.

If the brew command isn't found, you need to install Homebrew following their instructions.

```bash
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Once brew is installed you can install PowerShell.

The following command installs the latest stable release of PowerShell:

```bash
$ brew install powershell/tap/powershell
```

Finally, verify that your install is working properly:

```bash
$ pwsh
```

When new versions of PowerShell are released, update Homebrew's formulae and upgrade PowerShell:

```bash
$ brew update
$ brew upgrade powershell
```


## Install the latest preview release of PowerShell

After you've installed Homebrew, you can install PowerShell.

```bash
$ brew install powershell/tap/powershell-preview
```

Run the following command to start the preview version of PowerShell:

```bash
$ pwsh-preview
```

When new versions of PowerShell are released, update Homebrew's formulae and upgrade PowerShell:

```bash
$ brew update
$ brew upgrade powershell-preview
```


## Install the latest LTS release of PowerShell

```bash
$ brew install powershell/tap/powershell-lts
```

You can now verify your install

```bash
$ pwsh
```

When new versions of PowerShell are released, run the following command.

```bash
$ brew upgrade powershell-lts
```


## Installation via Direct Download

tarting with version 7.2, PowerShell supports the Apple M-series Arm-based processors. Download the install package from the [releases](https://aka.ms/powershell-release?tag=stable) page onto your computer. The links to the current versions are:

- PowerShell 7.4

    - x64 processors - [powershell-7.4.5-osx-x64.pkg](https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/powershell-7.4.5-osx-x64.pkg)
    - Arm64 processors - [powershell-7.4.5-osx-arm64.pkg](https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/powershell-7.4.5-osx-arm64.pkg)

- PowerShell 7.2 (LTS)

    - x64 processors - [powershell-7.2.23-osx-x64.pkg](https://github.com/PowerShell/PowerShell/releases/download/v7.2.23/powershell-7.2.23-osx-x64.pkg)
    - Arm64 processors - [powershell-7.2.23-osx-arm64.pkg](https://github.com/PowerShell/PowerShell/releases/download/v7.2.23/powershell-7.2.23-osx-arm64.pkg)

- PowerShell 7.5-preview

    - x64 processors - [powershell-7.5.0-preview.3-osx-x64.pkg](https://github.com/PowerShell/PowerShell/releases/download/v7.5.0-preview.3/powershell-7.5.0-preview.3-osx-x64.pkg)
    - Arm64 processors - [powershell-7.5.0-preview.3-arm64.pkg](https://github.com/PowerShell/PowerShell/releases/download/v7.5.0-preview.3/powershell-7.5.0-preview.3-osx-arm64.pkg)

You can double-click the file and follow the prompts, or install it from the terminal using the following commands. Change the name of the file to match the file you downloaded.

```bash
$ sudo installer -pkg ./Downloads/powershell-7.4.5-osx-x64.pkg -target /
```

If you are running on macOS Big Sur 11.5 or higher you may receive the following error message when installing the package:

> "powershell-7.4.5-osx-x64.pkg" cannot be opened because Apple cannot check it for malicious software.

There are two ways to work around this issue:

Using the Finder

1. Find the package in Finder.

2. Control-click (click while pressing the Ctrl key) on the package.

3. Select Open from the context menu.

From the command line

1. Run `sudo xattr -rd com.apple.quarantine ./Downloads/powershell-7.4.5-osx-x64.pkg`. If you are using PowerShell 7 or higher, you can use the Unblock-File cmdlet. Include the full path to the .pkg file.

2. Install the package as you normally would.


## Install as a .NET Global tool

If you already have the .NET Core SDK installed, it's easy to install PowerShell as a .NET Global tool.

```bash
$ dotnet tool install --global PowerShell
```

The dotnet tool installer adds ~/.dotnet/tools to your PATH environment variable. However, the currently running shell doesn't have the updated PATH. You should be able to start PowerShell from a new shell by typing pwsh.


## Binary Archives

PowerShell binary tar.gz archives are provided for the macOS platform to enable advanced deployment scenarios. When you install using this method you must also manually install any dependencies.

Installing binary archives on macOS
Download the install package from the releases page onto your computer. The links to the current versions are:

- PowerShell 7.4 (LTS)

    - x64 processors - [powershell-7.4.5-osx-x64.tar.gz](https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/powershell-7.4.5-osx-x64.tar.gz)
    - Arm64 processors - [powershell-7.4.5-osx-arm64.tar.gz](https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/powershell-7.4.5-osx-arm64.tar.gz)

- PowerShell 7.2 (LTS)

    - x64 processors - [powershell-7.2.23-osx-x64.tar.gz](https://github.com/PowerShell/PowerShell/releases/download/v7.2.23/powershell-7.2.23-osx-x64.tar.gz)
    - Arm64 processors - [powershell-7.2.23-osx-arm64.tar.gz](https://github.com/PowerShell/PowerShell/releases/download/v7.2.23/powershell-7.2.23-osx-arm64.tar.gz)

- PowerShell 7.5-preview

    - x64 processors - [powershell-7.5.0-preview.3-osx-x64.tar.gz](https://github.com/PowerShell/PowerShell/releases/download/v7.5.0-preview.3/powershell-7.5.0-preview.3-osx-x64.tar.gz)
    - Arm64 processors - [powershell-7.5.0-preview.3-osx-arm64.tar.gz](https://github.com/PowerShell/PowerShell/releases/download/v7.5.0-preview.3/powershell-7.5.0-preview.3-osx-arm64.tar.gz)

Use the following commands to install PowerShell from the binary archive. Change the download URL to match the version you want to install.

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

If you installed PowerShell with Homebrew, use the following command to uninstall:

```bash
$ brew uninstall --cask powershell 
```

If you installed PowerShell via direct download, PowerShell must be removed manually:

```bash
$ sudo rm -rf /usr/local/bin/pwsh /usr/local/microsoft/powershell
```

To remove the additional PowerShell paths, refer to the paths section in this document and remove the paths using sudo rm.


## Paths

- $PSHOME is /usr/local/microsoft/powershell/7

    - The macOS install package creates a symbolic link, /usr/local/bin/pwsh that points to pwsh in the $PSHOME location.

- User profiles are read from ~/.config/powershell/profile.ps1

- Default profiles are read from $PSHOME/profile.ps1

- User modules are read from ~/.local/share/powershell/Modules

- Shared modules are read from /usr/local/share/powershell/Modules

- Default modules are read from $PSHOME/Modules

- PSReadLine history are recorded to ~/.local/share/powershell/PSReadLine/ConsoleHost_history.txt

PowerShell respects the XDG Base Directory Specification on macOS.
