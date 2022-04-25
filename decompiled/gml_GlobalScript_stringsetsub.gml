var args;
stringsetsub = function() //gml_Script_stringsetsub
{
    var len = argument_count
    for (var i = 0; i < len; i++)
        args[i] = argument[i]
    var str = substringargs(argument[0], 1, args)
    return stringset(str);
}

