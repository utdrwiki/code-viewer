ossafe_file_text_open_write_ch1 = function(argument0) //gml_Script_ossafe_file_text_open_write_ch1
{
    if (!global.is_console)
        return file_text_open_write(argument0);
    else
    {
        var handle = ds_map_create()
        ds_map_set(handle, "is_write", 1)
        ds_map_set(handle, "filename", string_lower(argument0))
        ds_map_set(handle, "data", "")
        return handle;
    }
}

