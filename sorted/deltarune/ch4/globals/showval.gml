function showval(arg0, arg1, arg2)
{
    if (scr_debug())
    {
        var _debugstring = arg2 + " = " + string(variable_instance_get(self, arg2));
        draw_text_debug(arg0, arg1, _debugstring);
    }
}

function printval(arg0)
{
    if (scr_debug())
    {
        var _debugstring = arg0 + " = " + string(variable_instance_get(self, arg0));
        debug_print(_debugstring);
    }
}
