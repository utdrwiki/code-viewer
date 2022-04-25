ossafe_file_text_readln_ch1 = function(argument0) //gml_Script_ossafe_file_text_readln_ch1
{
    if (!global.is_console)
        return file_text_readln(argument0);
    else
    {
        var handle = argument0
        ds_map_set(handle, "line_read", 0)
        var line = ds_map_set_post(handle, "line", (ds_map_find_value(handle, "line") + 1))
        if (line >= ds_map_find_value(handle, "num_lines"))
            return "";
        text = ds_map_find_value(handle, "text")
        return (text[line] + "\r\n");
    }
}

