layerarray = layer_get_all();
for (var i = 0; i < array_length_1d(layerarray); i++)
{
    if (layer_get_name(layerarray[i]) == "GIVE_DEPTH")
    {
        elements = layer_get_all_elements(layerarray[i]);
        for (var j = 0; j < array_length_1d(elements); j++)
        {
            if (layer_get_element_type(elements[j]) == 4)
            {
                sprite_array_size++;
                if (palettemode == false)
                {
                    layersprite[sprite_array_size] = scr_marker(layer_sprite_get_x(elements[j]), layer_sprite_get_y(elements[j]), layer_sprite_get_sprite(elements[j]));
                }
                else
                {
                    layersprite[sprite_array_size] = instance_create(layer_sprite_get_x(elements[j]), layer_sprite_get_y(elements[j]), obj_marker_palette);
                    layersprite[sprite_array_size].sprite_index = layer_sprite_get_sprite(elements[j]);
                }
                layersprite[sprite_array_size].image_xscale = layer_sprite_get_xscale(elements[j]);
                layersprite[sprite_array_size].image_yscale = layer_sprite_get_yscale(elements[j]);
                layersprite[sprite_array_size].image_speed = layer_sprite_get_speed(elements[j]);
                layersprite[sprite_array_size].image_index = layer_sprite_get_index(elements[j]);
                with (layersprite[sprite_array_size])
                    scr_depth();
                layer_sprite_destroy(elements[j]);
            }
        }
        break;
    }
}
