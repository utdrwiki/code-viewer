string_hash_to_newline_ex = function(argument0) //gml_Script_string_hash_to_newline_ex
{
    if (string_pos("`", argument0) > 0)
    {
        var __newstring = string_replace(argument0, "`#", "<hash>")
        __newstring = string_hash_to_newline(__newstring)
        return string_replace(__newstring, "<hash>", "#");
    }
    else
        return string_hash_to_newline(argument0);
}

