layer_set_visible("DEBUG_BGCOLOR", false);
layer_set_visible("BGCOLOR", true);
layer_set_visible("DEBUG_ASSETS", false);
proptimer = 0;
con = -1;
init = 0;
customcon = 0;
hidewall = 0;
cutscene_master = 0;
roomglow = instance_create(0, 0, obj_roomglow);
prophecy = instance_create(440, 1010, obj_dw_church_prophecy);
prophecy.extflag = "heroes1";
tempblack = scr_marker_ext(520, 680, spr_pxwhite, 120, 240, undefined, undefined, c_black, 900000);
lamp_marker = scr_dark_marker(2859, 977, spr_dw_church_lantern);
with (lamp_marker)
    scr_depth();
lamp_marker.image_index = 1;
light_marker = scr_dark_marker(2759, 1092, spr_dw_church_switch);
with (light_marker)
    depth = 100000;
light_marker.image_index = 0;
blackall = scr_dark_marker(-10, -10, spr_pixel_white);
blackall.image_xscale = 999;
blackall.image_yscale = 999;
blackall.depth = 100;
blackall.image_blend = c_black;
blackall.visible = 0;
prophecyshatter = 0;
propfade = 0;
if (scr_debug())
    scr_setparty(1, 1);
if (global.plot < 140)
{
    con = 0;
    ripple_manager = instance_find(obj_church_ripple_area_manager, 0);
    lighting = instance_create(0, 0, obj_ch4_DCA04_lighting);
    with (lighting)
    {
        turn_off = true;
        depth = 6000;
    }
    if (scr_debug())
    {
        if (global.tempflag[90] == 1)
        {
            with (obj_mainchara)
            {
                x = 2230;
                y = 1120;
            }
            con = 1;
            with (obj_church_ripple_area_manager)
            {
                active = true;
                layer_set_visible("WALLTILES", 1);
                layer_set_visible("FLOORTILES", 0);
                with (obj_mainchara)
                    image_blend = c_black;
                with (obj_treasure_room)
                    image_blend = c_black;
                with (obj_caterpillarchara)
                    image_blend = c_black;
                lightcon = 0;
            }
        }
        else
        {
            scr_musicer("church_wip.ogg");
        }
        if (scr_debug())
        {
            with (obj_border_controller)
                set_border(border_dw_church_a, 1);
        }
    }
}
else
{
    instance_destroy();
}
if (scr_debug())
{
    if (keyboard_check(ord("1")))
    {
        global.flag[203] = !global.flag[203];
        if (global.flag[203] == 0)
            debug_print("global.flag[203]=0 | Listened to the Prophecy");
        else
            debug_print("global.flag[203]=1 | Did not Listen to the Prophecy");
    }
}
if (scr_debug())
{
    if (keyboard_check(ord("P")))
        global.tempflag[90] = 7;
}
if (global.tempflag[90] == 7)
{
    global.interact = 1;
    global.tempflag[90] = 0;
    con = 2.79;
    with (obj_roomglow)
        instance_destroy();
    with (obj_floorshadow)
        instance_destroy();
    with (obj_sprhighlight)
        instance_destroy();
    with (obj_musicer)
        instance_destroy();
}
makerips = 0;
riptime = 0;
chaser = [];
