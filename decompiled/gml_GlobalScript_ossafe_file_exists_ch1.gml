ossafe_file_exists_ch1 = function(argument0) //gml_Script_ossafe_file_exists_ch1
{
    if (!global.is_console)
        return file_exists(argument0);
    else
        return (variable_global_exists("savedata") && (!(is_undefined(ds_map_find_value(global.savedata, argument0)))));
}

