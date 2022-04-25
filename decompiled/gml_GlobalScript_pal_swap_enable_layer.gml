pal_swap_enable_layer = function(argument0) //gml_Script_pal_swap_enable_layer
{
    var _layer_index = argument0
    if (!layer_exists(_layer_index))
        return;
    var _data = ds_list_create()
    ds_list_add(_data, undefined, undefined, undefined)
    layer_script_begin(_layer_index, gml_Script__pal_swap_layer_start)
    layer_script_end(_layer_index, gml_Script__pal_swap_layer_end)
    ds_map_add_list(global.Pal_Layer_Map, _layer_index, _data)
    ds_priority_add(global.Pal_Layer_Priority, _layer_index, layer_get_depth(_layer_index))
    return;
}

