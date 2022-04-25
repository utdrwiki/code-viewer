scr_84_get_subst_string_ch1 = function() //gml_Script_scr_84_get_subst_string_ch1
{
    var str = argument[0]
    var sub_id = 1
    length = string_length(str)
    pos = 0
    while (sub_id < argument_count)
    {
        var sub = ("~" + string(sub_id))
        str = string_replace_all(str, sub, argument[sub_id])
        sub_id = (sub_id + 1)
    }
    return str;
}

