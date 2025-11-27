if (scr_debug())
{
    if (keyboard_check_pressed(ord("0")) && keyboard_check(ord("W")))
        room_goto(room_dw_b3bs_extrapuzzle);
}
if (con == 0)
{
    if (resettile == true)
    {
        resettile = false;
        with (obj_b3bs_switchtile)
        {
            with (instance_create(x, y, obj_board_smokepuff))
            {
                image_blend = #FFECBD;
                depth = 100000;
            }
            image_index = 0;
        }
        tile[3].image_index = 1;
        tile[8].image_index = 1;
    }
    if (scr_debug())
    {
        if (keyboard_check_pressed(vk_f5))
        {
            with (obj_b3bs_switchtile)
                image_index = 1;
            update = 1;
        }
    }
    if (update == true)
    {
        var count = 0;
        with (obj_b3bs_switchtile)
        {
            if (image_index == 1)
                count++;
        }
        if (count == 12)
        {
            with (obj_mainchara_board)
                facing = 0;
            global.interact = 1;
            snd_play(snd_won);
            con = 1;
            timer = -30;
            for (var i = 0; i < 12; i++)
            {
                with (tile[i])
                {
                    other.tile[i] = scr_board_marker(x, y, spr_board_holemarker, 0, depth, 2);
                    other.tile[i].image_index = 1;
                    instance_destroy();
                }
            }
        }
        update = false;
    }
}
if (con == 1)
{
    timer++;
    for (var i = 0; i < 12; i++)
    {
        if (timer == (i * 2))
        {
            with (tile[i])
            {
                snd_stop(snd_board_splash);
                snd_play(snd_board_splash);
                with (instance_create(x, y, obj_board_smokepuff))
                    image_blend = #FFECBD;
                instance_destroy();
            }
        }
    }
    if (timer == 24)
    {
        var xloc = 256;
        var yloc = 196;
        var checkagain = false;
        var col = collision_rectangle(xloc, yloc, xloc + 32, yloc + 32, obj_mainchara_board, true, true);
        if (i_ex(col))
        {
            debug_print("can't drop it there");
            checkagain = true;
            xloc = 288;
            yloc = 160;
        }
        if (checkagain)
        {
            col = collision_rectangle(xloc, yloc, xloc + 32, yloc + 32, obj_mainchara_board, true, true);
            if (i_ex(col))
            {
                debug_print("can't drop it there again");
                xloc = 224;
                yloc = 192;
            }
        }
        yend = yloc;
        block = instance_create(xloc, 32, obj_pushableblock_board);
        snd_play(snd_fall);
        with (block)
            gravity = 0.5;
        timer = 0;
        con++;
    }
}
if (con == 2)
{
    if (instance_exists(block))
    {
        if (block.y >= (yend - 8))
        {
            block.y = yend;
            global.flag[1111] = 1;
            global.flag[1109] = block.x;
            global.flag[1110] = block.y;
            snd_play_x(snd_noise, 0.5, 0.8);
            block.vspeed = 0;
            block.gravity = 0;
            global.interact = 0;
            con = 3;
            update = false;
        }
    }
}
if (con == 3.2)
{
    global.interact = 0;
    con = 3;
    update = true;
}
if (con <= 3)
{
    spike[0].image_index = switchtile1.pressed;
    spike[2].image_index = switchtile1.pressed;
    spike[1].image_index = switchtile2.pressed;
    spike[3].image_index = switchtile2.pressed;
    if (i_ex(floorblock))
    {
        floorblock.image_xscale = 2;
        if (switchtile2.pressed)
            floorblock.image_xscale = 1;
    }
}
if (con == 3)
{
    if (global.flag[1111] == 1)
    {
        var solved = false;
        if (switchtile1.pressed == true && switchtile2.pressed == true)
            solved = true;
        if (solved)
        {
            switchtile1.used = true;
            switchtile2.used = true;
            snd_play(snd_impact);
            scr_shakescreen();
            for (var i = 0; i < 4; i++)
                spike[i].image_index = 1;
            safe_delete(floorblock);
            global.flag[1111] = 2;
        }
    }
    if (resettile == true)
    {
        resettile = false;
        var sucleanup = false;
        if (i_ex(obj_board_grabobject))
            sucleanup = true;
        if (instance_exists(block))
        {
            if ((block.x != 256 || block.y != 192) && block.x != 999999)
            {
                if (sucleanup)
                {
                    with (obj_board_grabobject)
                    {
                        if (i_ex(marker))
                        {
                            var markx = marker.x;
                            var marky = marker.y;
                            with (grabbedid)
                                setxy(markx, marky);
                        }
                        else
                        {
                            with (grabbedid)
                                setxy(other.x, other.y);
                        }
                        grabbedid.visible = true;
                        with (marker)
                            instance_destroy();
                        if (i_ex(grabdaddy))
                        {
                            grabdaddy.grabbed = 0;
                            grabdaddy.grab = 0;
                            grabdaddy.canfreemove = 1;
                        }
                        instance_destroy();
                    }
                }
                var delaytime = round(point_distance(256, 192, block.x, block.y) / 8) + 1;
                debug_print("delaytime=" + string(delaytime));
                con = 3.1;
                scr_delay_var("con", 3.2, delaytime);
                global.interact = 1;
                with (block)
                {
                    scr_lerpvar("x", x, 256, delaytime, -1, "out");
                    scr_lerpvar("y", y, 192, delaytime, -1, "out");
                    con = 999;
                    scr_delay_var("con", 0, delaytime + 1);
                }
            }
        }
    }
    if (update == false)
    {
        if (instance_exists(obj_board_grabobject))
            update = true;
    }
    var doupdate = true;
    with (obj_pushableblock_board)
    {
        if (con != 0)
            doupdate = false;
    }
    if (update == true && global.interact == 0 && doupdate == true)
    {
        if (!instance_exists(obj_board_grabobject))
        {
            update = false;
            if (instance_exists(block))
            {
                global.flag[1109] = block.x;
                global.flag[1110] = block.y;
            }
            debug_message("block x/y=" + string(global.flag[1109]) + "|" + string(global.flag[1110]));
        }
    }
}
if (endcon == 1)
{
    if (obj_b3bs_console.swordinteract == 1)
    {
        endcon = 2;
        global.interact = 1;
        global.msc = 1411;
        scr_text(global.msc);
        d_make();
    }
}
if (endcon == 2 && !d_ex())
{
    endcon = 1;
    with (obj_b3bs_console)
        swordinteract = 0;
    global.interact = 0;
}
if (global.flag[1111] == 2)
{
    for (var i = 0; i < 4; i++)
        spike[i].image_index = 1;
}
if (global.flag[1055] >= 6)
{
    with (obj_pushableblock_board)
        visible = false;
    with (obj_solidblocksized)
    {
        if (x == 120 && y == 320)
            x = room_width * 40;
    }
}
