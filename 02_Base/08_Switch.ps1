###
# Switch case example.
#
# License - MIT.
###

Write-Host "----------------Test 1----------------"

switch (3)
{
    1 {"It is one."  }
    2 {"It is two."  }
    3 {"It is three."}
    4 {"It is four." }
}


Write-Host "----------------Test 2----------------"

switch (3)
{
    1 {"It is one."  }
    2 {"It is two."  }
    3 {"It is three."}
    4 {"It is four." }
    3 {"Three again."}
}


Write-Host "----------------Test 3----------------"

switch (3)
{
    1 {"It is one."  }
    2 {"It is two."  }
    3 {"It is three."; Break}
    4 {"It is four." }
    3 {"Three again."}
}


Write-Host "----------------Test 4----------------"

switch (4, 2)
{
    1 {"It is one."   }
    2 {"It is two."   }
    3 {"It is three." }
    4 {"It is four."  }
    3 {"Three again." }
}


Write-Host "----------------Test 5----------------"

switch (4, 2)
{
    1 {"It is one.";    Break }
    2 {"It is two." ;   Break }
    3 {"It is three." ; Break }
    4 {"It is four." ;  Break }
    3 {"Three again."}
}


Write-Host "----------------Test 6----------------"

$var = @{A = 10; B = 'abc'}

foreach ($key in $var.Keys) {
    switch ($var[$key].GetType()) {
        { $_ -eq [int32]  }  { "$key + 10 = $($var[$key] + 10)" }
        { $_ -eq [string] }  { "$key = $($var[$key])"           }
    }
}


Write-Host "----------------Test 7----------------"

switch ("fourteen")
{
    1 {"It is one.";   Break }
    2 {"It is two.";   Break }
    3 {"It is three."; Break }
    4 {"It is four.";  Break }
    "fo*" {"That's too many."; Break }
    Default {
        "No matches"
    }
}


Write-Host "----------------Test 8----------------"

switch -Wildcard ("fourteen")
{
    1 {"It is one.";   Break }
    2 {"It is two.";   Break }
    3 {"It is three."; Break }
    4 {"It is four.";  Break }
    "fo*" {"That's too many."; Break }
    Default {
        "No matches"
    }
}


Write-Host "----------------Test 9----------------"

switch ("Test")
{
    {$_ -is [String]} {
        "Found a string"
    }
    "Test" {
        "This $_ executes as well"
    }
}
