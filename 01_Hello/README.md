
# How to use

1. Print:

```bash
$ .\01_Print.ps1

Hello World
Hello World
Hello World
Hello World
Hello World
Hello World
VERBOSE: Hello World
Hello World
Hello World
DEBUG: Hello World
WARNING: Hello World
C:\tshark\goku\sourcecode\Ps1\01_Hello\01_Print.ps1 : Hello World
At line:1 char:1
+ .\01_Print.ps1
+ ~~~~~~~~~~~~~~
    + CategoryInfo          : NotSpecified: (:) [Write-Error], WriteErrorException
    + FullyQualifiedErrorId : Microsoft.PowerShell.Commands.WriteErrorException,01_Print.ps1

```

2. Input:

```bash
$ .\02_Input.ps1

Please enter: 123
123
Please enter: ***
System.Security.SecureString
-MaskInput Please enter: 123
123
Please enter: 123
123
```

3. Args:

```bash
$ .\03_Args1.ps1 Tom 18 male

name: Tom, age: 18, sex: male.
Argument 0 is Tom
Argument 1 is 18
Argument 2 is male
```

4. Args:

```bash
$ .\04_Args2.ps1 Tom 18

name: Tom, age: 18, sex: male.
```

```bash
$ .\04_Args2.ps1 -Name Tom -Age 18 -Sex male

Name: Tom, age: 18, Sex: male.
```

5. Args:

```bash
$ .\05_Args3.ps1 -Name Tom -Age 18 -Sex male -Student

name: Tom, age: 18, sex: male.
Tom is a student.
```

```bash
$ .\05_Args3.ps1 -Name Tom -Age 18 -Sex male

name: Tom, age: 18, sex: male.
```

6. Progress:

```bash
$ .\06_Progress.ps1
```
