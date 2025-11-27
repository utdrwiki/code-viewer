function scr_checkAndAdd(arg0)
{
    var varString = "";
    if (variable_instance_exists(id, arg0))
    {
        var __value = variable_instance_get(id, arg0);
        if (is_string(__value))
            varString += (" [" + __value + "]");
        else
            varString += (" [" + string(__value) + "]");
    }
    return varString;
}
