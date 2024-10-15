###
# Lexical structure.
#
# License - MIT.
###

<#
    keyword: one of
        begin          break          catch       class
        continue       data           define      do
        dynamicparam   else           elseif      end
        exit           filter         finally     for
        foreach        from           function    if
        in             inlinescript   parallel    param
        process        return         switch      throw
        trap           try            until       using
        var            while          workflow
#>

<#
    variable:
        $$
        $?
        $^
        $   variable-scope~opt~  variable-characters
        @   variable-scope~opt~  variable-characters
        braced-variable


    braced-variable:
        ${   variable-scope~opt~   braced-variable-characters   }

    variable-scope:
        global:
        local:
        private:
        script:
        using:
        workflow:
        variable-namespace

    variable-namespace:
        variable-characters   :

    variable-characters:
        variable-character
        variable-characters   variable-character

    variable-character:
        A Unicode character of classes Lu, Ll, Lt, Lm, Lo, or Nd
        _   (The underscore character U+005F)
        ?

    braced-variable-characters:
        braced-variable-character
        braced-variable-characters   braced-variable-character

    braced-variable-character:
        Any Unicode character except
            }   (The closing curly brace character U+007D)
            `   (The backtick character U+0060)
        escaped-character

    escaped-character:
        `   (The backtick character U+0060) followed by any Unicode character
#>


# $_ The current pipeline object; used in script blocks, filters, the process clause of functions, where-object, foreach-object and switch
# $^ contains the first token of the last line input into the shell
# $$ contains the last token of last line input into the shell
# $? Contains the success/fail status of the last statement

Write-Output ("Hello World")
# Return last do command status, success: True, failed: False.
$?
$$
$^

1,2,3 | ForEach-Object {Write-Output $_}

