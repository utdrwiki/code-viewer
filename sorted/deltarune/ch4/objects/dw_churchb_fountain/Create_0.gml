timer = 0;
con = 0;
myfloor = scr_marker_ext(240, 280, spr_pxwhite, 161, 200, 0, undefined, undefined, 900000);
myfloorbg = scr_marker_ext(0, 280, spr_pxwhite, 640, 200, 0, undefined, c_black, 900001);
myint = instance_create(240, 240, obj_trigger_interact);
scr_size(10, 2.5, myint);
myint.strict = true;
myint.talked = 0;
fountain = instance_create(224, 0, obj_darkfountain);
scr_size(2, 2, fountain);
if (scr_debug())
{
    scr_setparty(1);
    if (keyboard_check(ord("W")))
    {
        if (keyboard_check_pressed(ord("V")))
        {
        }
    }
}
shadinit = 0;
con = -1;
customcon = 0;
clean_up = false;
if (global.plot >= 225 && global.plot < 230)
{
    con = 0;
    scr_setparty(1, 0, 0);
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    if (scr_debug())
    {
        with (obj_border_controller)
            hide_border();
    }
}
else if (global.plot >= 242)
{
    var kris_fountain = instance_create(300, 260, obj_ch4_churchb_fountain);
    with (kris_fountain)
        scr_depth();
    with (obj_caterpillarchara)
        visible = 0;
    with (obj_mainchara)
        visible = 0;
}
else if (!snd_is_playing(global.currentsong[1]))
{
    global.currentsong[0] = snd_init("wind_highplace.ogg");
    global.currentsong[1] = mus_loop(global.currentsong[0]);
}
