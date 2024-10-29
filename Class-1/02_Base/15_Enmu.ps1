###
# The enum statement declares an enumeration.
# An enumeration is a distinct type that consists of
# a set of named labels called the enumerator list.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"
# Minimal enumeration.
enum MarkdownUnorderedListCharacter {
    Asterisk
    Dash
    Plus
}

$ValuesToConvert = @(0, 'Asterisk', 1, 'Dash', 2, 'Plus')
foreach ($Value in $ValuesToConvert) {
    [MarkdownUnorderedListCharacter]$EnumValue = $Value

[pscustomobject]@{
        AssignedValue = $Value
        Enumeration   = $EnumValue
        AreEqual      = $Value -eq $EnumValue
    }
}



Write-Output "----------------Test 2----------------"
# Explicit and synonym enumeration values.
enum MediaTypes {
    unknown
    music   = 10
    mp3
    aac
    ogg     = 15
    oga     = 15
    mogg    = 15
    picture = 20
    jpg
    jpeg    = 21
    png
    video   = 40
    mpg
    mpeg    = 41
    avi
    m4v
}

[MediaTypes].GetEnumNames()
[MediaTypes].GetEnumValues()
[MediaTypes].GetEnumName(15)

[MediaTypes].GetEnumNames() | ForEach-Object {
    [pscustomobject]@{
      Name = $_
      Value = [int]([MediaTypes]::$_)
    }
}


Write-Output "----------------Test 3----------------"
# Enumeration as flags.
[Flags()] enum FileAttributes {
    Archive    = 1
    Compressed = 2
    Device     = 4
    Directory  = 8
    Encrypted  = 16
    Hidden     = 32
}

[FileAttributes]$file1 =  [FileAttributes]::Archive
[FileAttributes]$file1 += [FileAttributes]::Compressed
[FileAttributes]$file1 += [FileAttributes]::Device
"file1 attributes are: $file1"

[FileAttributes]$file2 = [FileAttributes]28 ## => 16 + 8 + 4
"file2 attributes are: $file2"


Write-Output "----------------Test 4----------------"
# The HasFlag instance method determines whether a bit flag is set for a flag enumeration value.
[Flags()] enum ModuleFeatures {
    Commands  = 1
    Classes   = 2
    Enums     = 4
    Types     = 8
    Formats   = 16
    Variables = 32
}

$Features = [ModuleFeatures]39

foreach ($Feature in [ModuleFeatures].GetEnumValues()) {
    "Has flag {0,-12}: {1}" -f "'$Feature'", ($Features.HasFlag($Feature))
}


Write-Output "----------------Test 5----------------"
# The IsDefined() static method returns $true if the input value
# is defined for the enumeration and otherwise $false.
enum Season {
    Unknown
    Spring
    Summer
    Autumn
    Winter
    Fall   = 3
}

foreach ($Value in 0..5) {
    $IsValid   = [Season]::IsDefined([Season], $Value)
    $EnumValue = if ($IsValid) { [Season]$Value }

[pscustomobject] @{
        InputValue = $Value
        IsValid    = $IsValid
        EnumValue  = $EnumValue
    }
}
