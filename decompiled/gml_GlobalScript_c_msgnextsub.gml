var args;
c_msgnextsub = function() //gml_Script_c_msgnextsub
{
    var len = argument_count
    for (var i = 0; i < len; i++)
        args[i] = argument[i]
    var str = substringargs(argument[0], 1, args)
    c_cmd("msgnext", str, 0, 0, 0)
    return;
}

