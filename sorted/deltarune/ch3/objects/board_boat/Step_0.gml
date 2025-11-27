if (buffer > -5)
    buffer--;
if (myinteract == 3)
{
    scr_pathfind_end("ralsei");
    scr_pathfind_end("susie");
    scr_pathfind_end("kris");
    with (obj_mainchara_board)
        canfreemove = false;
    kris = 0;
    with (obj_mainchara_board)
    {
        if (controlled == 1)
        {
            visible = true;
            boat = true;
            other.kris = id;
        }
    }
    canfreemove = true;
    facing = 0;
    myinteract = 20;
    buffer = 5;
    embark = 1;
}
if (embark == 1)
{
    embarktimer++;
    var jumptime = 10;
    if (embarktimer == 1)
    {
        global.interact = 1;
        if (!scr_swordroom())
            mus_volume(global.currentsong[1], 0, jumptime);
        engaged = 0;
        with (obj_mainchara_board)
        {
            visible = true;
            if (name == "kris")
            {
                other.kris = id;
                var amt = round(distance_to_point(other.x, other.y) / 6);
                var jumpheight = clamp(amt, 10, 32);
                scr_jump_to_point_board(other.x, other.y, jumpheight, jumptime);
                snd_play_delay(snd_board_lift, jumptime, 1, 1);
            }
        }
    }
    if (embarktimer == (1 + jumptime))
    {
        if (!scr_swordroom())
        {
            var oceansound = snd_init("ch3_board2.ogg");
            oceansong = mus_loop(oceansound);
            snd_stop(icemusic);
        }
    }
    if (embarktimer == 6)
    {
        with (obj_mainchara_board)
        {
            if (name == "susie")
            {
                facing = other.kris.facing;
                var amt = round(distance_to_point(other.x, other.y) / 6);
                var jumpheight = clamp(amt, 10, 32);
                scr_jump_to_point_board(other.x, other.y, jumpheight, jumptime);
                snd_play_delay(snd_board_lift, jumptime, 1, 1.2);
            }
        }
    }
    if (embarktimer == 11)
    {
        with (obj_mainchara_board)
        {
            if (name == "ralsei")
            {
                facing = other.kris.facing;
                var amt = round(distance_to_point(other.x, other.y) / 6);
                var jumpheight = clamp(amt, 10, 32);
                scr_jump_to_point_board(other.x, other.y, jumpheight, jumptime);
                snd_play_delay(snd_board_lift, jumptime, 1, 1.4);
            }
        }
    }
    if (embarktimer == (11 + jumptime))
    {
        with (obj_mainchara_board)
        {
        }
        embark = 0;
        embarktimer = 0;
        engaged = true;
        global.interact = 0;
    }
}
if (engaged == true)
{
    press_l = 0;
    press_r = 0;
    press_u = 0;
    press_d = 0;
    with (obj_mainchara_board)
    {
        if (name == "ralsei")
            follow = false;
    }
    if (canfreemove && !i_ex(obj_board_playercamera) && global.interact == 0)
    {
        if (left_h())
            press_l = 1;
        if (right_h())
            press_r = 1;
        if (up_h())
            press_u = 1;
        if (down_h())
            press_d = 1;
        px = 0;
        py = 0;
        pressdir = -1;
        if (press_r == 1)
        {
            px = wspeed;
            pressdir = 1;
        }
        if (press_l == 1)
        {
            px = -wspeed;
            pressdir = 3;
        }
        if (press_d == 1)
        {
            py = wspeed;
            pressdir = 0;
        }
        if (press_u == 1)
        {
            py = -wspeed;
            pressdir = 2;
        }
        if (nopress == 1 && pressdir != -1)
            facing = pressdir;
        if (facing == 2)
        {
            if (press_d == 1)
                facing = 0;
            if (press_u == 0 && pressdir != -1)
                facing = pressdir;
        }
        if (facing == 0)
        {
            if (press_u == 1)
                facing = 2;
            if (press_d == 0 && pressdir != -1)
                facing = pressdir;
        }
        if (facing == 3)
        {
            if (press_r == 1)
                facing = 1;
            if (press_l == 0 && pressdir != -1)
                facing = pressdir;
        }
        if (facing == 1)
        {
            if (press_l == 1)
                facing = 3;
            if (press_r == 0 && pressdir != -1)
                facing = pressdir;
        }
        nopress = 0;
        xmeet = 0;
        ymeet = 0;
        xymeet = 0;
        var lenient_x = px;
        var lenient_y = py;
        if (place_meeting(x + px, y + py, obj_board_boatsolid))
            xymeet = 1;
        if (place_meeting(x + px, y, obj_board_boatsolid))
        {
            var block = instance_place(x + px, y, obj_board_boatsolid);
            if (block.object_index == obj_pushableblock_board && block.jello == true)
            {
            }
            else
            {
                if (place_meeting(x + px, y, obj_board_boatsolid))
                {
                    for (g = wspeed; g > 0; g -= 1)
                    {
                        mvd = 0;
                        if (press_d == 0 && !place_meeting(x + px, y - g, obj_board_boatsolid))
                        {
                            y -= g;
                            py = 0;
                            break;
                            mvd = 1;
                        }
                        if (press_u == 0 && mvd == 0 && !place_meeting(x + px, y + g, obj_board_boatsolid))
                        {
                            y += g;
                            py = 0;
                            break;
                        }
                    }
                }
                xmeet = 1;
                bkx = 0;
                if (px > 0)
                {
                    for (i = px; i >= 0; i -= 1)
                    {
                        if (!place_meeting(x + i, y, obj_board_boatsolid))
                        {
                            px = i;
                            bkx = 1;
                            break;
                        }
                    }
                }
                if (px < 0)
                {
                    for (i = px; i <= 0; i += 1)
                    {
                        if (!place_meeting(x + i, y, obj_board_boatsolid))
                        {
                            px = i;
                            bkx = 1;
                            break;
                        }
                    }
                }
                if (bkx == 0)
                    px = 0;
            }
        }
        if (place_meeting(x, y + py, obj_board_boatsolid))
        {
            var block = instance_place(x, y + py, obj_board_boatsolid);
            if (block.object_index == obj_pushableblock_board && block.jello == true)
            {
            }
            else
            {
                ymeet = 1;
                bky = 0;
                if (place_meeting(x, y + py, obj_board_boatsolid))
                {
                    for (g = wspeed; g > 0; g -= 1)
                    {
                        mvd = 0;
                        if (press_r == 0 && !place_meeting(x - g, y + py, obj_board_boatsolid))
                        {
                            x -= g;
                            px = 0;
                            break;
                            mvd = 1;
                        }
                        if (mvd == 0 && press_l == 0 && !place_meeting(x + g, y + py, obj_board_boatsolid))
                        {
                            x += g;
                            px = 0;
                            break;
                        }
                    }
                }
                if (py > 0)
                {
                    for (i = py; i >= 0; i -= 1)
                    {
                        if (!place_meeting(x, y + i, obj_board_boatsolid))
                        {
                            py = i;
                            bky = 1;
                            break;
                        }
                    }
                }
                if (py < 0)
                {
                    for (i = py; i <= 0; i += 1)
                    {
                        if (!place_meeting(x, y + i, obj_board_boatsolid))
                        {
                            py = i;
                            bky = 1;
                            break;
                        }
                    }
                }
                if (bky == 0)
                    py = 0;
            }
        }
        if (place_meeting(x + px, y + py, obj_board_boatsolid))
        {
            xymeet = 1;
            bkxy = 0;
            i = px;
            j = py;
            while (j != 0 || i != 0)
            {
                if (!place_meeting(x + i, y + j, obj_board_boatsolid))
                {
                    px = i;
                    py = j;
                    bkxy = 1;
                    break;
                }
                if (abs(j) >= 1)
                {
                    if (j > 0)
                        j -= 1;
                    if (j < 0)
                        j += 1;
                }
                else
                {
                    j = 0;
                }
                if (abs(i) >= 1)
                {
                    if (i > 0)
                        i -= 1;
                    if (i < 0)
                        i += 1;
                }
                else
                {
                    i = 0;
                }
            }
            if (bkxy == 0)
            {
                px = 0;
                py = 0;
            }
        }
        var lenient_amount = 8;
        if (px == 0 && lenient_y == 0 && lenient_x > 0)
        {
            var colllide_count = 0;
            for (i = 0; i <= 16; i += 1)
            {
                if (position_meeting(x + 32, (y + 32) - i, obj_board_boatsolid))
                    colllide_count = i;
            }
            if (colllide_count <= lenient_amount)
                y -= wspeed;
            colllide_count = 0;
            for (i = 0; i <= 16; i += 1)
            {
                if (position_meeting(x + 32, y + 16 + i, obj_board_boatsolid))
                    colllide_count = i;
            }
            if (colllide_count <= lenient_amount)
                y += wspeed;
        }
        if (px == 0 && lenient_y == 0 && lenient_x < 0)
        {
            var colllide_count = 0;
            for (i = 0; i <= 16; i += 1)
            {
                if (position_meeting(x - 1, (y + 32) - i, obj_board_boatsolid))
                    colllide_count = i;
            }
            if (colllide_count <= lenient_amount)
                y -= wspeed;
            colllide_count = 0;
            for (i = 0; i <= 16; i += 1)
            {
                if (position_meeting(x - 1, y + 16 + i, obj_board_boatsolid))
                    colllide_count = i;
            }
            if (colllide_count <= lenient_amount)
                y += wspeed;
        }
        if (py == 0 && lenient_x == 0 && lenient_y > 0)
        {
            lenient_amount = 12;
            var colllide_count = 0;
            for (i = 0; i <= 32; i += 1)
            {
                if (position_meeting((x + 32) - i, y + 32, obj_board_boatsolid))
                    colllide_count = i;
            }
            if (colllide_count <= lenient_amount)
                x -= wspeed;
            colllide_count = 0;
            for (i = 0; i <= 32; i += 1)
            {
                if (position_meeting(x + i, y + 32, obj_board_boatsolid))
                    colllide_count = i;
            }
            if (colllide_count <= lenient_amount)
                x += wspeed;
            lenient_amount = 8;
        }
        if (py == 0 && lenient_x == 0 && lenient_y < 0)
        {
            var colllide_count = 0;
            for (i = 0; i <= 32; i += 1)
            {
                if (position_meeting((x + 32) - i, y, obj_board_boatsolid))
                    colllide_count = i;
            }
            if (colllide_count <= lenient_amount)
                x -= wspeed;
            colllide_count = 0;
            for (i = 0; i <= 32; i += 1)
            {
                if (position_meeting(x + i, y, obj_board_boatsolid))
                    colllide_count = i;
            }
            if (colllide_count <= lenient_amount)
                x += wspeed;
        }
        x += px;
        y += py;
    }
    var __canscreentransition = true;
    if (__canscreentransition == true)
    {
        if (x > 480)
        {
            x = 480;
            if (!place_meeting(x + 32, y, obj_board_boatsolid))
            {
                facing = 1;
                canfreemove = 0;
                with (obj_board_camera)
                    shift = "right";
            }
        }
        if (x < 128)
        {
            x = 128;
            if (!place_meeting(x - 32, y, obj_board_boatsolid))
            {
                facing = 3;
                canfreemove = 0;
                with (obj_board_camera)
                    shift = "left";
            }
        }
        if (y > 288)
        {
            y = 288;
            if (!place_meeting(x, y + 32, obj_board_boatsolid))
            {
                canfreemove = 0;
                with (obj_board_camera)
                    shift = "down";
            }
        }
        if (y < 64)
        {
            y = 64;
            if (!place_meeting(x, y - 32, obj_board_boatsolid))
            {
                facing = 2;
                canfreemove = 0;
                with (obj_board_camera)
                    shift = "up";
            }
        }
        if (place_meeting(x, y, obj_board_warpentrance))
        {
            var warp = instance_place(x, y, obj_board_warpentrance);
            with (obj_board_camera)
            {
                if (shift != "none")
                {
                    warpx = warp.warpx;
                    warpy = warp.warpy;
                    playerX = warp.playerX;
                    playerY = warp.playerY;
                    shift = "warp";
                }
            }
        }
    }
    if (buffer < 0 && obj_board_camera.con == 0 && obj_board_camera.shift == "none")
    {
        if (button1_p())
        {
            buffer = 3;
            dock = 0;
            var cx = 0;
            var cy = 0;
            if (facing == 0)
                cy = 32;
            if (facing == 1)
                cx = 32;
            if (facing == 2)
                cy = -32;
            if (facing == 3)
                cx = -32;
            dock = collision_rectangle(x + cx + 12, y + cy + 12, x + cx + 20, y + cy + 20, obj_board_dock, false, true);
            if (instance_exists(dock))
            {
                myx = dock.x;
                myy = dock.y;
                if (facing == 0)
                    myy -= 32;
                if (facing == 2)
                    myy += 32;
                if (facing == 1)
                    myx -= 32;
                if (facing == 3)
                    myx += 32;
                global.interact = 1;
                disembark = 1;
                canfreemove = 0;
            }
        }
    }
}
if (disembark == 1)
{
    with (obj_mainchara_board)
        boat = false;
    disembark = 2;
    disembarktimer = 0;
}
if (disembark == 2)
{
    disembarktimer++;
    if (abs(x - myx) > 1)
    {
        if (x < myx)
            x += 2;
        if (x > myx)
            x -= 2;
    }
    else
    {
        x = myx;
    }
    if (abs(y - myy) > 1)
    {
        if (y < myy)
            y += 2;
        if (y > myy)
            y -= 2;
    }
    else
    {
        y = myy;
    }
    if ((x == myx && y == myy) || disembarktimer > 16)
    {
        setxy(myx, myy);
        disembark = 3;
        kris = 0;
        with (obj_mainchara_board)
        {
            visible = false;
            if (controlled == 1)
            {
                other.kris = id;
                visible = true;
            }
        }
        disembarktimer = 0;
        engaged = 0;
    }
}
if (disembark == 3)
{
    disembarktimer++;
    var jumptime = 10;
    if (disembarktimer == 1)
    {
        if (!scr_swordroom())
            mus_fade(oceansong, jumptime);
        engaged = 0;
        with (obj_mainchara_board)
        {
            facing = other.facing;
            visible = true;
            if (name == "kris")
            {
                scr_jump_to_point_board(other.dock.x, other.dock.y, 10, jumptime);
                snd_play_delay(snd_board_lift, jumptime, 1, 1.4);
            }
        }
    }
    if (disembarktimer == (1 + jumptime))
    {
        if (!scr_swordroom())
        {
            var resumemusic = true;
            if (room == room_board_2)
            {
                if (obj_b2_ice_c2.active == true)
                    resumemusic = false;
            }
            if (resumemusic)
            {
                snd_stop(icemusic);
                mus_volume(global.currentsong[1], 1, 30);
            }
            else
            {
                snd_stop(icemusic);
                var icemusic_snd = snd_init("board_ocean.ogg");
                icemusic = mus_loop(icemusic_snd);
            }
        }
    }
    if (disembarktimer == 6)
    {
        with (obj_mainchara_board)
        {
            if (name == "susie")
            {
                scr_jump_to_point_board(other.dock.x, other.dock.y - 1, 10, jumptime);
                snd_play_delay(snd_board_lift, jumptime, 1, 1.2);
            }
        }
    }
    if (disembarktimer == 11)
    {
        with (obj_mainchara_board)
        {
            if (name == "ralsei")
            {
                scr_jump_to_point_board(other.dock.x, other.dock.y, 10, jumptime);
                snd_play_delay(snd_board_lift, jumptime, 1, 1);
            }
        }
    }
    if (disembarktimer == (11 + jumptime))
    {
        global.interact = 0;
        with (obj_mainchara_board)
        {
            if (name == "ralsei")
                facing = other.kris.facing;
            canfreemove = true;
        }
        scr_board_caterpillar_interpolate_ralsei();
        resetpos = true;
        scr_delay_var("resetpos", false, 1);
        disembark = 0;
        disembarktimer = 0;
        snd_stop(oceansong);
    }
}
