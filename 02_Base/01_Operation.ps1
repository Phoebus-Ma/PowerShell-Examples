###
# Four mixed operations.
#
# License - MIT.
###

<#
    [char]
    [byte]
    [int]
    [long]
    [float]
    [double]
    [decimal]
    [bool]
    [string]
    [void]
    [object]
    [numeric]
#>

# Addition (+)
function Addition {
    param ([int] $a, [int] $b)

    return $a + $b
}

# Subtraction (-)
function Subtraction {
    param ([int] $a, [int] $b)

    return $a - $b
}

# Multiplication (*)
function Multiplication {
    param ([int] $a, [int] $b)

    return $a * $b
}

# Division (/)
function Division {
    param ([int] $a, [int] $b)

    $c = -1

    if ($b -ne 0) {
        $c = $a / $b
    }

    return $c
}

# Modulus (%)
function Modulus {
    param ([int] $a, [int] $b)

    return $a % $b
}

# Bitwise AND (-band)
function BitwiseAND {
    param ([int] $a, [int] $b)

    return $a -band $b
}

# Bitwise NOT (-bnot)
function BitwiseNOT {
    param ([int] $a)

    return -bnot $a
}

# Bitwise OR (-bor)
function BitwiseOR {
    param ([int] $a, [int] $b)

    return $a -bor $b
}

# Bitwise XOR (-bxor)
function BitwiseXOR {
    param ([int] $a, [int] $b)

    return $a -bxor $b
}

# Shifts bits to the left (-shl)
function ShiftsBitsLeft {
    param ([int] $a, [int] $b)

    return $a -shl $b
}

# Shifts bits to the right (-shr)
function ShiftsBitsRight {
    param ([int] $a, [int] $b)

    return $a -shr $b
}

$r1  = Addition 1 2
$r2  = Subtraction -a 1 -b 2
$r3  = Multiplication  -a 1 -b 2
$r4  = Division   -a 1 -b 2
$r5  = Modulus    -a 5 -b 3
$r6  = BitwiseAND -a 5 -b 3
$r7  = BitwiseNOT -a 5
$r8  = BitwiseOR  -a 5 -b 0x03
$r9  = BitwiseXOR -a 5 -b 3
$r10 = ShiftsBitsLeft  -a 1 -b 2
$r11 = ShiftsBitsRight -a 4 -b 1

# Result: 3, -1, 2, 0.5, 2, 1, -6, 7, 6, 4, 2.
Write-Host "Result: $r1, $r2, $r3, $r4, $r5, $r6, $r7, $r8, $r9, $r10, $r11."
