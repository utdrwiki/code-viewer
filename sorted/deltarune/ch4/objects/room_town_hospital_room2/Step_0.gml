if (con == 0 && !d_ex() && global.interact == 0)
{
    global.interact = 1;
    con = 1;
    alarm[0] = 30;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    blackall.image_alpha = 0;
    scr_lerp_instance_var(blackall, "image_alpha", 0, 1, 15);
}
if (con == 2)
{
    con = 3;
    scr_speaker("no_name");
    msgsetloc(0, "* (You changed the hot water bottle on his head.)/%", "obj_room_town_hospital_room2_slash_Step_0_gml_24_0");
    d_make();
}
if (con == 3 && !d_ex())
{
    con = 4;
    alarm[0] = 30;
    scr_lerp_instance_var(blackall, "image_alpha", 1, 0, 15);
}
if (con == 5 && !d_ex())
{
    scr_flag_set(756, 1);
    global.interact = 0;
    global.facing = 0;
    con = 99;
}
