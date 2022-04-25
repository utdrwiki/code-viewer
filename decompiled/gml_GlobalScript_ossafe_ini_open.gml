ossafe_ini_open = function(argument0) //gml_Script_ossafe_ini_open
{
    if (!global.is_console)
        ini_open(argument0)
    else
    {
        var name = string_lower(argument0)
        global.current_ini = name
        var file = ds_map_find_value(global.savedata, name)
        if is_undefined(file)
            var data = ""
        else
            data = file
        ini_open_from_string(data)
    }
    return;
}

