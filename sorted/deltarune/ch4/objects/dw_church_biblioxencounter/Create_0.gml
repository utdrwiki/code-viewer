if (scr_debug())
    scr_setparty(1, 1);
global.flag[7] = 0;
con = 0;
timer = 0;
bibliox = 0;
behindshelf = instance_create(446, 480, obj_trigger_interact);
with (behindshelf)
{
    talked = 0;
    strict = 1;
    scr_size(1.75, 1);
}
layerarray = layer_get_all();
shelvesinit = 0;
sprite_array_size = -1;
layersprite = [];
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
                    scr_depth_alt();
                    if (sprite_index == spr_bibliox_redbook)
                        depth -= 1200;
                }
                layer_sprite_destroy(elements[j]);
            }
        }
        break;
    }
}
