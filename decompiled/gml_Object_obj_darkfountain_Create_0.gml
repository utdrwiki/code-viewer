siner = 0
bgsiner = 0
siner = 100
colcol = 0
hscroll = 0
eyebody = 1
adjust = 0
slowdown = 0
nowcolor = 65280
if (global.chapter == 2)
{
    if (room == room_dw_mansion_fountain)
    {
        fountainbg = scr_marker(0, 0, spr_whitepx_10)
        fountainbg.image_xscale = 64
        fountainbg.image_yscale = 48
        fountainbg.depth = 2000000
    }
}
change_fountain_color = function(argument0) //gml_Script_change_fountain_color_gml_Object_obj_darkfountain_Create_0
{
    if (room == room_cc_fountain)
    {
        __background_set_colour(argument0)
        nowcolor = argument0
    }
    else if (global.chapter == 2)
    {
        if (room == room_dw_mansion_fountain)
        {
            fountainbg.image_blend = argument0
            nowcolor = argument0
        }
    }
    return;
}

