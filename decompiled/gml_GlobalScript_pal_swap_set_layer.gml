pal_swap_set_layer = function(argument0, argument1, argument2, argument3) //gml_Script_pal_swap_set_layer
{
    var _pal_sprite = argument0
    var _pal_index = argument1
    var _layer_index = argument2
    var _pal_is_surface = argument3
    var _data = ds_map_find_value(global.Pal_Layer_Map, _layer_index)
    if (_data == undefined)
        return;
    ds_list_clear(_data)
    ds_list_add(_data, _pal_sprite, _pal_index, _pal_is_surface)
    return;
}

