ossafe_file_text_close_ch1 = function(argument0) //gml_Script_ossafe_file_text_close_ch1
{
    var is_valid = 1
    if (!global.is_console)
        file_text_close(argument0)
    else
    {
        var handle = argument0
        if ds_map_find_value(handle, "is_write")
            ds_map_set(global.savedata, ds_map_find_value(handle, "filename"), ds_map_find_value(handle, "data"))
        ds_map_destroy(handle)
    }
    return is_valid;
}

