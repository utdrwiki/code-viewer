scr_ds_list_read_ch1 = function(argument0) //gml_Script_scr_ds_list_read_ch1
{
    var new_list = ds_list_create()
    var list_string = ossafe_file_text_read_string_ch1(argument0)
    if (list_string != "")
        ds_list_read(new_list, list_string)
    return new_list;
}

