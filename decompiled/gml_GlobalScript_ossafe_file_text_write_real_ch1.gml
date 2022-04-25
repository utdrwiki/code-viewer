ossafe_file_text_write_real_ch1 = function(argument0, argument1) //gml_Script_ossafe_file_text_write_real_ch1
{
    if (!global.is_console)
        return file_text_write_real(argument0, argument1);
    else
    {
        var handle = argument0
        ds_map_set(handle, "data", (ds_map_find_value(handle, "data") + string(argument1)))
    }
    return;
}

