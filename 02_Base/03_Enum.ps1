###
# Enum example.
#
# License - MIT.
###

Write-Output "----------------Test 1----------------"

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


Write-Output "----------------Test 3----------------"

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

# Result:
# file1 attributes are: Archive, Compressed, Device
# file2 attributes are: Device, Directory, Encrypted


Write-Output "----------------Test 4----------------"

enum EndOfLine {
    CR   = 1
    LF   = 2
    CRLF = 3
}

function ConvertTo-LineEndingRegex {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline)]
        [EndOfLine[]]$InputObject
    )

process {
        switch ($InputObject) {
            CR   {  '\r'  }
            LF   {  '\n'  }
            CRLF { '\r\n' }
        }
    }
}

[EndOfLine]::CR | ConvertTo-LineEndingRegex

'CRLF' | ConvertTo-LineEndingRegex

ConvertTo-LineEndingRegex 2


Write-Output "----------------Test 5----------------"
# Format
enum TaskState {
    ToDo
    Doing
    Done
}

# String format template for the statements
$Statement = "[System.Enum]::Format([TaskState], {0}, '{1}')"

foreach ($Format in @('G', 'D', 'X', 'F')) {
    $StatementToDo  = $Statement -f 0, $Format
    $StatementDoing = $Statement -f "([TaskState]'Doing')", $Format
    $StatementDone  = $Statement -f '[TaskState]::Done', $Format
    $FormattedToDo  = [System.Enum]::Format(
      [TaskState], 0, $Format
    )
    $FormattedDoing = [System.Enum]::Format(
        [TaskState], ([TaskState]'Doing'), $Format
    )
    $FormattedDone  = [System.Enum]::Format(
      [TaskState], [TaskState]::Done, $Format
    )

    "{0,-62} => {1}" -f $StatementToDo,  $FormattedToDo
    "{0,-62} => {1}" -f $StatementDoing, $FormattedDoing
    "{0,-62} => {1}" -f $StatementDone,  $FormattedDone
}


Write-Output "----------------Test 6----------------"
# GetEnumName
enum GateState {
    Unknown
    Open
    Opening
    Closing
    Closed
}

foreach ($Value in 0..4) {
    [pscustomobject]@{
      IntegerValue = $Value
      EnumName     = [GateState].GetEnumName($Value)
    }
}


Write-Output "----------------Test 7----------------"
# GetEnumNames
enum Season {
    Unknown
    Spring
    Summer
    Autumn
    Winter
    Fall   = 3
}

[Season].GetEnumNames()


Write-Output "----------------Test 8----------------"
# GetEnumValues
enum Season2 {
    Unknown
    Spring
    Summer
    Autumn
    Winter
    Fall   = 3
}

[Season2].GetEnumValues()


Write-Output "----------------Test 9----------------"
# HasFlag
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


Write-Output "----------------Test 10----------------"
# ToString
enum Shade {
    White
    Grey
    Gray = 1
    Black
}

[Shade].GetEnumValues() | Foreach-Object -Process {
    [pscustomobject]@{
        EnumValue    = $_
        StringValue  = $_.ToString()
        IntegerValue = [int]$_
    }
}
