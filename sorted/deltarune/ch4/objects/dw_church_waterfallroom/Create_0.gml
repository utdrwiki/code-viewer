if (scr_debug())
    scr_setparty(1, 1);
layer_set_visible("BGCOLOR_DEBUG", 0);
layer_set_visible("TILES_BG", 0);
init = 0;
riparea = instance_create(0, 0, obj_church_ripple_area);
scr_sizeexact(room_width, room_height, riparea);
ripplemanager = instance_create(0, 0, obj_church_ripple_area_manager);
ripplemanager.active = true;
ripple = -4;
bellint = 0;
domove = 0;
scr_populatechars();
con = 0;
spawn = 0;
scr_musicer("darkchurch_intro.ogg", 0.7);
layerarray = layer_get_all();
shelvesinit = 0;
sprite_array_size = -1;
layersprite = [];
for (var i = 0; i < array_length(layerarray); i++)
{
    if (layer_get_name(layerarray[i]) == "CREATURES")
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
                layersprite[sprite_array_size].image_xscale = layer_sprite_get_xscale(elements[j]);
                layersprite[sprite_array_size].image_yscale = 2;
                with (layersprite[sprite_array_size])
                {
                    image_index = (x / 40) + (y / 40);
                    image_speed = 0.25;
                    scr_depth();
                    setxy(scr_even(x), scr_even(y));
                }
                layer_sprite_destroy(elements[j]);
            }
        }
        break;
    }
}
layer_set_visible("DEBUG_ASSETS", false);
blocker = -4;
if (global.plot >= 242)
{
    var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
    for (var i = 0; i < array_length(spritesArray); i++)
    {
        if (layer_sprite_get_sprite(spritesArray[i]) == 4343)
            blocker = scr_makenpc_fromasset(spritesArray[i]);
    }
}
with (obj_border_controller)
    hide_border(0.025);
