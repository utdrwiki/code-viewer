scr_84_get_font = function(argument0) //gml_Script_scr_84_get_font
{
    if (!variable_global_exists("chemg_last_get_font"))
        global.chemg_last_get_font = ""
    if (argument0 != global.chemg_last_get_font)
        global.chemg_last_get_font = argument0
    return ds_map_find_value(global.font_map, argument0);
}

