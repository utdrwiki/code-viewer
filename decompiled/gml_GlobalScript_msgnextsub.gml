var args;
msgnextsub = function() //gml_Script_msgnextsub
{
    var len = argument_count
    for (var i = 0; i < len; i++)
        args[i] = argument[i]
    var str = substringargs(argument[0], 1, args)
    msgnext(str)
    return;
}

