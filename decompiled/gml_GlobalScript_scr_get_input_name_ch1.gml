scr_get_input_name_ch1 = function(argument0) //gml_Script_scr_get_input_name_ch1
{
    if (global.is_console || obj_gamecontroller.gamepad_active)
    {
        var _control = global.input_g[argument0]
        if (_control == gp_padr)
            return "\\*D  ";
        if (_control == gp_padl)
            return "\\*A  ";
        if (_control == global.button0)
            return "\\*Z  ";
        if (_control == global.button1)
            return "\\*X  ";
        if (_control == global.button2)
            return "\\*C  ";
    }
    else
    {
        _control = (("[" + global.asc_def[global.input_k[argument0]]) + "]")
        return _control;
    }
    return;
}

