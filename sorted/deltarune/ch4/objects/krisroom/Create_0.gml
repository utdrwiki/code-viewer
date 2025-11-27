con = 0;
image_speed = 0;
wallwindow = scr_marker(140, 40, spr_housewindow);
with (wallwindow)
    scr_depth();
show_border = false;
if (global.plot > 0)
{
    scr_depth();
    with (wallwindow)
        image_index = 1;
    image_index = 1;
}
else if (global.chapter == 1)
{
    scr_windowcaption(stringsetloc("The Beginning", "obj_krisroom_slash_Create_0_gml_16_0"));
    t = scr_marker(151, 97, spr_toriel_rt);
    with (t)
    {
        scr_depth();
        image_speed = 0.25;
    }
    global.msc = 0;
    global.typer = 7;
    global.fc = 4;
    global.fe = 1;
    global.msg[0] = stringsetloc("* KRIS!/", "obj_krisroom_slash_Create_0_gml_23_0");
    global.msg[1] = stringsetloc("* Kris^1, if you do not wake up^1, we will be late for school!/%", "obj_krisroom_slash_Create_0_gml_24_0");
    d = instance_create(0, 0, obj_dialoguer);
    con = 1;
    global.interact = 1;
    global.facing = 3;
}
else if (global.chapter == 2)
{
    global.msc = 0;
    scr_speaker("toriel");
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    con = 1;
    alarm[4] = 10;
    global.interact = 1;
    global.facing = 3;
}
if (global.chapter >= 4)
{
    with (wallwindow)
        image_index = 1;
    image_index = 1;
    if (scr_flag_get(832) == 0)
    {
        shine_marker = scr_marker_animated(113, 106, spr_shine);
        shine_marker.image_speed = 0.1;
    }
    if (scr_flag_get(747) > 0)
    {
        var kris_star = scr_marker(247, 42, spr_krisroom_star);
        with (kris_star)
            scr_depth();
        var asriel_star_cover = scr_marker(122, 45, spr_pixel_white);
        with (asriel_star_cover)
        {
            depth = 98000;
            image_blend = #FFCF80;
            image_xscale = 3;
            image_yscale = 2;
        }
    }
    if (scr_flag_get(748) > 0)
    {
        var stain_cover = scr_marker(264, 160, spr_pixel_white);
        with (stain_cover)
        {
            depth = 100000;
            image_blend = #EA7536;
            image_xscale = 4;
            image_yscale = 5;
        }
    }
}
