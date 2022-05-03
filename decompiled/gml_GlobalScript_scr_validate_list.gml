scr_validate_list = function(argument0, argument1) //gml_Script_scr_validate_list
{
    var loaded_list = scr_ds_list_read(argument0)
    var is_valid = 1
    i = 0
    while (i < ds_list_size(loaded_list))
    {
        if (ds_list_find_value(loaded_list, i) != argument1[i])
        {
            is_valid = 0
            break
        }
        else
        {
            i += 1
            continue
        }
    }
    ds_list_destroy(loaded_list)
    return is_valid;
}

