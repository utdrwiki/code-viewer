with (obj_caterpillarchara)
    visible = false;
if (!shelvesinit)
{
    shelvesinit = true;
    layerarray = layer_get_all();
    for (var i = 0; i < array_length(layerarray); i++)
    {
        if (layer_get_name(layerarray[i]) == "spr_shelves")
        {
            elements = layer_get_all_elements(layerarray[i]);
            for (var j = 0; j < array_length(elements); j++)
            {
                if (layer_get_element_type(elements[j]) == 4)
                {
                    sprite_array_size++;
                    layersprite[sprite_array_size] = instance_create(layer_sprite_get_x(elements[j]), layer_sprite_get_y(elements[j]), obj_marker);
                    layersprite[sprite_array_size].sprite_index = layer_sprite_get_sprite(elements[j]);
                    layersprite[sprite_array_size].image_speed = 0;
                    layersprite[sprite_array_size].image_index = layer_sprite_get_index(elements[j]);
                    with (layersprite[sprite_array_size])
                    {
                        image_index = (x / 40) + (y / 40);
                        scr_size(2, 2);
                        scr_depth_alt(undefined, -38);
                        if (sprite_index == spr_church_ladder)
                            depth -= 4;
                    }
                    layer_sprite_destroy(elements[j]);
                }
            }
            break;
        }
    }
}
if (flooractive == 1)
{
    with (obj_solid_temp)
    {
        if (extflag == "FLOOR1")
            active = 1;
        else
            active = 0;
    }
}
if (flooractive == 2)
{
    with (obj_solid_temp)
    {
        if (extflag == "FLOOR2")
            active = 1;
        else
            active = 0;
    }
}
wasactive = flooractive;
