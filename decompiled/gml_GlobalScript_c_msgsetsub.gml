var args;
c_msgsetsub = function() //gml_Script_c_msgsetsub
{
    var len = argument_count
    for (var i = 0; i < len; i++)
        args[i] = argument[i]
    var str = substringargs(argument[1], 2, args)
    c_cmd("msgset", argument[0], str, 0, 0)
    return;
}

