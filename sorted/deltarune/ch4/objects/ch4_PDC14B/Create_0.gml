con = -1;
customcon = 0;
leave_con = 0;
x_offset = -20;
random_shake = false;
shake_timer = 0;
vaccuum_pos_x = 310;
vaccuum_pos_y = 256;
if (global.plot >= 90 && global.plot < 95)
{
    con = !scr_sideb_active() ? 0 : 50;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = -110;
    blackall.image_blend = c_black;
    platter_marker = instance_create(360 + x_offset, 290, obj_ch4_PDC14B_snacktray);
    with (platter_marker)
        visible = 0;
    if (!snd_is_playing(global.currentsong[1]))
    {
        global.currentsong[0] = snd_init("noelleshouseoutside.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
    }
    if (scr_debug())
    {
        with (obj_border_controller)
            hide_border();
    }
}
if (global.plot < 90)
    instance_destroy();
