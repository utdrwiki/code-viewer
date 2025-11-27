init = 0;
timer = 0;
con = 0;
myinteract = 0;
piano_was_engaged = false;
flooractive = 1;
wasactive = 0;
layer_set_visible("DEBUG_ASSETS", 0);
if (scr_debug())
{
    scr_setparty(1);
    if (keyboard_check(ord("P")))
        global.plot = 237;
}
global.flag[7] = 0;
cutscene = 0;
if (global.plot < 237)
    global.plot = 237;
if (global.plot > 237)
    cutscene = -1;
scr_walkntalk_create();
var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
npc1 = -4;
npc2 = -4;
npc3 = -4;
for (var i = 0; i < array_length(spritesArray); i++)
{
    if (layer_sprite_get_sprite(spritesArray[i]) == 2094 && layer_sprite_get_xscale(spritesArray[i]) == 2)
        npc1 = scr_makenpc_fromasset(spritesArray[i]);
    if (layer_sprite_get_sprite(spritesArray[i]) == 3020 && layer_sprite_get_xscale(spritesArray[i]) == -2)
    {
        npc2 = scr_makenpc_fromasset(spritesArray[i]);
        npc2.y = npc2.y - 1000;
    }
    if (layer_sprite_get_sprite(spritesArray[i]) == 1614 && layer_sprite_get_xscale(spritesArray[i]) == 2)
        npc3 = scr_makenpc_fromasset(spritesArray[i]);
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
                layersprite[sprite_array_size].image_blend = layer_sprite_get_blend(elements[j]);
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
