layer_set_visible("BGCOLOR_DEBUG", 0);
layer_set_visible("TILES_BG", 0);
layer_set_visible("DEBUG_ASSETS", 0);
init = 0;
riptime = 0;
riparea = instance_create(0, 0, obj_church_ripple_area);
scr_sizeexact(room_width, room_height, riparea);
ripplemanager = instance_create(0, 0, obj_church_ripple_area_manager);
ripplemanager.active = true;
if (!up_h() && !down_h() && !right_h() && !left_h())
{
    with (obj_mainchara)
        scr_fancy_ripple(x + 18, y + 72, 60, 16159050, 240, 1, 18);
}
scr_populatechars();
layerarray = layer_get_all();
shelvesinit = 0;
sprite_array_size = -1;
organik = [];
for (var i = 0; i < array_length(layerarray); i++)
{
    if (layer_get_name(layerarray[i]) == "DEBUG_ASSETS")
    {
        elements = layer_get_all_elements(layerarray[i]);
        for (var j = 0; j < array_length(elements); j++)
        {
            if (layer_get_element_type(elements[j]) == 4)
            {
                if (layer_sprite_get_sprite(elements[j]) == 5689)
                {
                    sprite_array_size++;
                    organik[sprite_array_size] = instance_create(layer_sprite_get_x(elements[j]), layer_sprite_get_y(elements[j]), obj_trigger_interact);
                    organik[sprite_array_size].sprite_index = spr_dw_church_worshipstatue;
                    organik[sprite_array_size].image_speed = 0;
                    organik[sprite_array_size].image_index = layer_sprite_get_index(elements[j]);
                    organik[sprite_array_size].image_xscale = layer_sprite_get_xscale(elements[j]);
                    organik[sprite_array_size].image_yscale = 2;
                    organik[sprite_array_size].image_blend = c_black;
                    organik[sprite_array_size].visible = true;
                    scr_depth_alt(organik[sprite_array_size]);
                    layer_sprite_destroy(elements[j]);
                }
            }
        }
        break;
    }
}
wafer = scr_makenpc("DEBUG_ASSETS", "dspr_wafer");
with (wafer.marker)
{
    image_speed = 0;
    image_blend = c_black;
}
var endareamarker = scr_heromarker("", "fakeblock");
endarea = instance_create(endareamarker[0], endareamarker[1], obj_solidblocksized);
with (endarea)
{
    sprite_index = spr_pxwhite;
    scr_sizeexact(endareamarker[2].image_xscale, endareamarker[2].image_yscale);
    image_blend = c_black;
    depth = 1000000;
    visible = true;
}
con = 0;
if (global.flag[1502] >= 1)
    safe_delete(endarea);
roomstart = false;
if (global.flag[1502] >= 2)
{
    roomstart = true;
    alarm[0] = 1;
}
scr_musicer("darkchurch_intro.ogg", 0.7, 0.7, undefined, 30);
