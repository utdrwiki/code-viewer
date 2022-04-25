scr_84_load_map_json = function(argument0) //gml_Script_scr_84_load_map_json
{
    var filename = argument0
    if file_exists(filename)
    {
        var file_buffer = buffer_load(filename)
        var json = buffer_read(file_buffer, buffer_string)
        buffer_delete(file_buffer)
        return json_decode(json);
    }
    else
    {
        show_debug_message((("file: " + filename) + "does not exist"))
        return json_decode("{}");
    }
}

