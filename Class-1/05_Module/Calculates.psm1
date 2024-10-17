###
# Calculate operations.
#
# License - MIT.
###

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
