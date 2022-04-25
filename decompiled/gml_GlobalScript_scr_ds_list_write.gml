scr_ds_list_write = function(argument0, argument1) //gml_Script_scr_ds_list_write
{
    var new_list = ds_list_create()
    for (var i = 0; i < argument1; i += 1)
        ds_list_add(new_list, argument0[i])
    var list_string = ds_list_write(new_list)
    ds_map_set(myfileid, "data", (ds_map_find_value(myfileid, "data") + list_string))
    ds_list_destroy(new_list)
    return;
}

