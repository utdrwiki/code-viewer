if (con == 0)
{
    timer = 0;
    buff--;
}
var _krx = 300;
var _kry = 298;
if (con == 0 || con == 99999)
{
    global.flag[7] = 0;
    with (obj_gameshow_swordroute)
    {
        depth = 999980;
        bg.depth = 999994;
        gameconsole.depth = 999985;
    }
    depth = 999980;
    with (obj_board_controller)
        depth = 999980;
    with (obj_marker)
    {
        if (x == 0 && y == 380)
            depth = 999979;
    }
    with (obj_mainchara)
    {
        ignoredepth = 1;
        depth = 999979;
    }
}
else
{
    global.flag[7] = 1;
    with (obj_gameshow_swordroute)
    {
        depth = 5000;
        bg.depth = 99994;
        gameconsole.depth = 99985;
    }
    with (obj_mainchara)
        ignoredepth = 0;
    with (obj_board_controller)
        depth = 99900;
}
if (con == 1)
{
    global.interact = 1;
    timer++;
    if (timer == 1)
    {
        depth = 100000;
        with (kris)
        {
            fun = 1;
            var dist = round(abs(_krx - x) / 2);
            other.walktime = dist;
            debug_message("dist=" + string(dist));
            if (dist > 0)
            {
                scr_move_to_point_over_time(_krx, _kry, dist);
                if (x < _krx)
                    sprite_index = spr_krisr_dark;
                else
                    sprite_index = spr_krisl_dark;
                image_speed = 0.25;
            }
        }
    }
    if (timer >= (1 + walktime))
    {
        kris.x = _krx;
        kris.y = _kry;
        kris.image_speed = 0;
        kris.image_index = 0;
        kris.sprite_index = spr_krisu_dark;
        timer = 0;
        con = 2;
        if (specialskip == 1)
            con = 120;
    }
}
if (con == 2)
{
    scr_speaker("no_name");
    global.msc = 1252;
    scr_text(global.msc);
    d_make();
    con = 3;
}
if (con == 3 && !i_ex(obj_choicer_neo) && !d_ex())
{
    timer = 0;
    if (global.choice == 0)
    {
        if (ver == 0)
            con = 10;
    }
    if (global.choice == 1)
    {
        kris.fun = 0;
        global.facing = 0;
        global.interact = 0;
        con = 0;
        buff = 3;
    }
}
if (con == 10)
{
    timer++;
    if (timer == 1)
    {
        depth = 100000;
        obj_board_controller.drawcrt = true;
        snd_play(snd_tv_poweron2);
        draw_green_intro = true;
    }
    if (timer == 31)
    {
        draw_green_intro = false;
        draw_blue = true;
    }
    if (timer == 55)
    {
        draw_blue = false;
        draw_green = true;
    }
    if (timer == 77)
    {
        draw_blue = true;
        draw_green = false;
    }
    if (timer == 100)
    {
        draw_blue = false;
        with (obj_gameshow_swordroute)
            screencolor = c_black;
        if (standalone == 1)
            instance_destroy();
    }
    if (timer == 110)
    {
        if (standalone == 2)
            snd_play(snd_nes_intro_extended);
        else
            snd_play(snd_nes_intro);
        drawlogo = true;
        logocolor = merge_color(c_black, #1F289F, 0);
        createstars = 1;
    }
    if (timer == 111)
    {
        if (standalone == 2)
        {
            timer = 0;
            con = 10.1;
            with (obj_GSA02_B0)
                con = 2;
        }
    }
    if (timer == 154)
    {
        drawboxcolor = true;
        drawcolor = #1B2063;
        logocolor = merge_color(c_black, #1F289F, 0.4);
    }
    if (timer == 174)
    {
        drawboxcolor = true;
        drawcolor = #2F38B0;
        logocolor = merge_color(c_black, #1F289F, 1);
    }
    if (timer == 194)
        drawboxcolor = true;
    if (timer == 214)
    {
        createstars = 2;
        snd_free_all();
        drawboxcolor = false;
        drawlogo = false;
        draw_blue = true;
        controllerprompt = true;
        snd_play(snd_nes_nocontroller);
    }
    if (timer >= 274)
    {
        snd_free_all();
        timer = 0;
        var havecontroller = scr_keyitemcheck(16);
        if (havecontroller)
        {
            con = 12;
        }
        else
        {
            con = 11;
            if (global.flag[1176] == 0)
                global.flag[1176] = 1;
        }
    }
}
if (con == 11)
{
    timer++;
    if (timer == 1)
    {
        controllerprompt = false;
        draw_static = true;
        snd_play(snd_tv_static);
    }
    if (timer == 10)
    {
        snd_stop(snd_tv_static);
        obj_board_controller.drawcrt = false;
        draw_blue = false;
        draw_static = false;
        drawlogo = false;
        controllerprompt = false;
        draw_green = false;
        boxy = 0;
        draw_green_intro = false;
        screenlerp = false;
        drawboxcolor = false;
        drawcolor = c_black;
        startimer = 0;
        starindex = 0;
        draw_stars = 0;
        logoalpha = 0;
        with (obj_gameshow_swordroute)
            screencolor = c_black;
        controllerprompt = false;
    }
    if (timer == 40)
    {
        con = 0;
        obj_mainchara.fun = 0;
        global.facing = 0;
        with (obj_mainchara)
        {
            walktimer = 0;
            setxy(300, 298);
        }
        global.interact = 0;
        timer = 0;
    }
}
if (con == 120)
    room_goto(roomtogoto);
if (con == 12)
{
}
if (createstars == 1)
{
    startimer++;
    if ((startimer % 4) == 0)
    {
        var vxx = board_tilex(irandom(22) / 2);
        var vyy = board_tiley(irandom(14) / 2);
        var star = scr_board_marker(vxx, vyy, spr_5x5shine, 0.125, depth - 1, 2, true);
    }
}
if (createstars == 2)
{
    with (obj_board_marker)
        instance_destroy();
    createstars = 3;
}
