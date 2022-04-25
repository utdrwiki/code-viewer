var __tiles;
tile_get_ids_at_depth_ch1 = function(argument0) //gml_Script_tile_get_ids_at_depth_ch1
{
    var __depth = argument0
    __tiles[0] = -1
    var __currtile = 0
    var __layers = layer_get_all()
    var __numlayers = array_length_1d(__layers)
    for (var __i = 0; __i < __numlayers; __i++)
    {
        if (layer_get_depth(__layers[__i]) != __depth)
        {
        }
        else
        {
            var __els = layer_get_all_elements(__layers[__i])
            var __numels = array_length_1d(__els)
            for (var __j = 0; __j < __numels; __j++)
            {
                var __eltype = layer_get_element_type(__els[__j])
                if (__eltype == 7)
                {
                    __tiles[__currtile] = __els[__j]
                    __currtile++
                }
            }
        }
    }
    return __tiles;
}

