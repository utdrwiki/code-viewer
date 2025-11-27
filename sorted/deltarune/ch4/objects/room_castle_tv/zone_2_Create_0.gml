con = -1;
solo_mode = !scr_havechar(3) && !scr_havechar(2);
if (global.flag[1692] == 1)
    mike_controller = instance_create(0, 0, obj_mike_controller);
var platform = scr_dark_marker(440, 320, spr_dw_castle_tv_platform);
platform.depth = 999999;
var save_point_top = instance_create(470, 314, obj_savepoint);
with (save_point_top)
    scr_depth();

remove_statue = function(arg0)
{
    global.flag[1694] |= 1 << arg0;
};

statue_list = [];
var layerarray = layer_get_all();
for (var i = 0; i < array_length(layerarray); i++)
{
    if (layer_get_name(layerarray[i]) != "ASSETS_Statues")
        continue;
    var elements = layer_get_all_elements(layerarray[i]);
    var j = array_length(elements) - 1;
    while (j >= 0)
    {
        if (layer_get_element_type(elements[j]) != 4)
        {
        }
        else
        {
            var statue_cat_tall = instance_create(layer_sprite_get_x(elements[j]), layer_sprite_get_y(elements[j]), obj_mike_statue_cat_overworld);
            with (statue_cat_tall)
                sprite_index = spr_statue_cat_tall;
            statue_cat_tall.bit_index = layer_sprite_get_speed(elements[j]);
            statue_cat_tall.init("statue_cat_tall", remove_statue);
            statue_list[array_length(statue_list)] = statue_cat_tall;
            with (statue_cat_tall)
                scr_depth();
            layer_sprite_destroy(elements[j]);
        }
        j--;
    }
    break;
}

show_convo = function(arg0)
{
    switch (arg0)
    {
        case "statue_cat_tall":
            con = 5;
            break;
        case "glow_mic":
            con = (audio_get_recorder_count() == 0) ? 10 : 15;
            break;
    }
};

var remembered_flag = global.flag[1694];
if (remembered_flag > 0)
{
    for (var i = 0; i < array_length(statue_list); i++)
    {
        if (((remembered_flag >> statue_list[i].bit_index) & 1) != 0 || remembered_flag < 8)
            statue_list[i].clean_up();
    }
}
