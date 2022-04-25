ossafe_file_text_eof_ch1 = function(argument0) //gml_Script_ossafe_file_text_eof_ch1
{
    if (!global.is_console)
        return file_text_eof(argument0);
    else
    {
        var handle = argument0
        return ds_map_find_value(handle, "line") >= ds_map_find_value(handle, "num_lines");
    }
}

