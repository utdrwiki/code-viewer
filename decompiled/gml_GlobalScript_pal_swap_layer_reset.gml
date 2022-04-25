pal_swap_layer_reset = function() //gml_Script_pal_swap_layer_reset
{
    ds_map_clear(global.Pal_Layer_Map)
    ds_priority_clear(global.Pal_Layer_Priority)
    ds_priority_clear(global.Pal_Layer_Temp_Priority)
    return;
}

