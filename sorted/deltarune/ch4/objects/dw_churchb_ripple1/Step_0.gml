if (!windinit)
{
    var count = 0;
    with (obj_dw_church_window_glow)
    {
        depth = 6000;
        count++;
        pat = 0;
        if ((count % 2) == 0)
            pat = 1;
        image_alpha = 0;
    }
    windinit = 1;
}
if (con == 0)
{
    var trig = 0;
    with (obj_trigger)
    {
        if (extflag == "start")
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = 1;
        }
    }
    if (trig)
    {
        if (global.plot < 234)
            global.plot = 234;
        global.flag[7] = 1;
        timer = 0;
        con = 1;
        with (instance_create(0, 600, obj_solidblocksized))
        {
            visible = true;
            sprite_index = spr_pxwhite;
            image_blend = c_black;
            scr_size(80, 80);
            depth = 1000000;
        }
    }
}
if (con == 1)
{
    timer++;
    if (timer == 1)
        mus_play_ext("second_church.ogg", 1, 0.7, 1, 0);
    if (timer == (1 + round(0)) || timer == (1 + round(95.25)) || timer == (1 + round(190.5)) || timer == (1 + round(285.75)) || timer == (1 + round(381)) || timer == (1 + round(476.25)) || timer == (1 + round(571.5)) || timer == (1 + round(666.75)))
    {
        makerip = true;
        var seqtime = 0.17647;
        for (var i = 0; i < 9; i++)
            scr_delay_var("makerip", true, round(seqtime * 30 * i));
    }
    if (timer == 381)
    {
        with (obj_dw_church_window_glow)
            scr_lerpvar("image_alpha", 0, 1, 300);
    }
    var ripcol = 16777215;
    if (makerip)
    {
        makerip = false;
        var cx = camerax();
        var cy = cameray();
        var loc = [];
        var border = 80;
        array_push(loc, [cx + 0 + border, cy + 0 + border]);
        array_push(loc, [(cx + 640) - border, cy + 0 + border]);
        array_push(loc, [cx + 0 + border, (cy + 480) - border]);
        array_push(loc, [(cx + 640) - border, (cy + 480) - border]);
        border = 120;
        array_push(loc, [cx + 320, cy + 240 + border]);
        array_push(loc, [cx + 320, (cy + 240) - border]);
        border = 160;
        array_push(loc, [cx + 320 + border, cy + 240]);
        array_push(loc, [(cx + 320) - border, cy + 240]);
        var masterdir;
        with (obj_mainchara)
            masterdir = point_direction(x, y, x + px, y + py);
        ripcount++;
        var _hhsp = lengthdir_x(2, masterdir);
        var _vvsp = lengthdir_y(2, masterdir);
        scr_fancy_ripple_alt(loc[ripindex][0], loc[ripindex][1], 60, ripcol, 200, 1, 14, 5000, _hhsp, _vvsp, 0.25);
        ripindex++;
        if (ripindex > (array_length(loc) - 1))
            ripindex = 0;
    }
    if (timer == 720 || (scr_debug() && keyboard_check_pressed(ord("V"))))
    {
        if (global.interact == 0)
        {
            with (obj_doorAny)
                instance_destroy();
        }
        timer = 750;
        with (scr_marker_ext(camerax() - 400, cameray() - 400, spr_pxwhite, 1440, 1280, undefined, undefined, undefined, 0))
        {
            image_alpha = 0;
            scr_lerpvar("image_alpha", 0, 1, 30, 2, "out");
        }
    }
    if (timer == 780 || (scr_debug() && keyboard_check_pressed(ord("W"))))
    {
        with (obj_caterpillarchara)
        {
            global.tempflag[52] = obj_mainchara.x - x;
            global.tempflag[53] = obj_mainchara.y - y;
        }
        global.tempflag[90] = 24.8;
        with (instance_create(x, y, obj_persistentfadein))
            image_blend = c_white;
        global.flag[7] = 0;
        room_goto(room_dw_churchb_ripplepost);
        con = 2;
    }
}
