scr_populatechars();
var mywidth = 80;
var myheight = 80;
with (mysolid)
{
    if (global.interact != 0 || d_ex())
        myinteract = 0;
    if (myinteract)
    {
        if (other.con == 0)
        {
            other.con = 1;
            other.timer = 0;
        }
        myinteract = 0;
    }
}
scr_depth(id, -22);
if (con >= 1 && con < 2)
{
    if (con == 1)
    {
        con = 1.1;
        var pos = [x + 20, y - 4];
        var walktime = max(round(point_distance(pos[0], pos[1], obj_mainchara.x, obj_mainchara.y) / 4), 4);
        if (walktime <= 11 && (y - 10) < kris.y)
        {
            con = 1.2;
            kris.freeze = true;
            kris.fun = true;
            global.flag[7] = 1;
            cutscene_master = scr_cutscene_make();
            scr_maincharacters_actors();
            pos = [x + 20, y - 4];
            c_sel(kr);
            c_walkdirect(pos[0], pos[1], walktime);
            if (i_ex(susie))
            {
                c_sel(su);
                pos = [x + 36, y - 10];
                c_walkdirect(pos[0], pos[1], walktime);
            }
            if (i_ex(ralsei))
            {
                c_sel(ra);
                pos = [x + 4, y - 6];
                c_walkdirect(pos[0], pos[1], walktime);
            }
            c_pannable(1);
            if (global.flag[1538] == 0 && !final)
            {
                if (walktime < 15)
                    walktime = 15;
                pos = scr_heromarker(undefined, "camloc");
                c_pan(pos[0], pos[1], 15);
            }
            else
            {
                pos[0] = x - 281;
                pos[1] = y - 206;
                pos[0] = clamp(pos[0], 0, room_width - 640);
                pos[1] = clamp(pos[1], 0, room_height - 480);
                c_pan(pos[0], pos[1], walktime);
            }
            c_wait(walktime);
            c_actortokris();
            c_actortocaterpillar();
            c_terminatekillactors();
        }
        else
        {
            obj_mainchara.cutscene = 1;
            kris.freeze = true;
            kris.fun = true;
            global.flag[7] = 1;
            if (global.flag[1538] == 0 && !final)
            {
                if (walktime < 15)
                    walktime = 15;
                var pos3 = scr_heromarker(undefined, "camloc");
                scr_pan_lerp(pos3[0], pos3[1], 15);
            }
            else
            {
                var cx = clamp(x - 281, 0, room_width - 640);
                var cy = clamp(y - 206, 0, room_height - 480);
                scr_pan_lerp(cx, cy, walktime);
            }
            snd_play(snd_wing);
            var jumpstrength = 12;
            with (obj_caterpillarchara)
            {
                visible = 0;
                image_alpha = 0;
                if (name == "susie")
                {
                    var pos2 = [other.x + 36, other.y - 10];
                    var jumpmarker = scr_marker_ext(x, y, spr_susie_dw_jump_ball, 2, 2, 0.25, 0, c_white, 30050);
                    with (jumpmarker)
                    {
                        scr_jump_to_point(pos2[0], pos2[1], jumpstrength, 16);
                        scr_doom(self, 16);
                    }
                }
                else
                {
                    var pos2 = [other.x + 4, other.y - 6];
                    var jumpmarker = scr_marker_ext(x, y, spr_ralsei_jump_ball, 2, 2, 0.25, 0, c_white, 30050);
                    with (jumpmarker)
                    {
                        depth = 30050;
                        scr_jump_to_point(pos2[0], pos2[1], jumpstrength, 16);
                        scr_doom(self, 16);
                    }
                }
            }
            with (kris)
            {
                visible = 0;
                image_alpha = 0;
                var jumpmarker = scr_marker_ext(x, y, spr_kris_jump_ball_fixed, 2, 2, 0.25, 0, c_white, 30050);
                with (jumpmarker)
                {
                    scr_jump_to_point(pos[0], pos[1], jumpstrength, 16);
                    scr_doom(self, 16);
                }
            }
        }
    }
    if (con >= 1.1 && con < 1.2)
    {
        con += 0.001;
        if (con >= 1.116)
        {
            con = 1.2;
            snd_play(snd_noise);
            with (obj_mainchara)
            {
                setxy(other.x + 20, other.y - 4);
                visible = true;
                image_alpha = 1;
                cutscene = false;
                global.interact = 0;
                freeze = false;
            }
            with (obj_caterpillarchara)
            {
                if (name == "susie")
                    setxy(other.x + 36, other.y - 10);
                else
                    setxy(other.x + 4, other.y - 6);
                visible = 1;
                image_alpha = 1;
            }
        }
    }
    if (con >= 1.2 && !i_ex(obj_cutscene_master))
    {
        con = 2;
        engaged = true;
        if (global.flag[1538] == 0 && !final)
        {
            camcon = 1;
            camcontrol = true;
            var pos = scr_heromarker(undefined, "camloc");
            camx = pos[0];
            camy = pos[1];
        }
        else
        {
            with (obj_mainchara)
                scr_delay_var("cutscene", false, 1);
        }
    }
}
if (engaged)
{
    ubuff--;
    rbuff--;
    lbuff--;
    dbuff--;
    xbuff--;
    zbuff--;
    var this_frame_directions = [];
    if (up_h())
        array_push(this_frame_directions, 2);
    if (down_h())
        array_push(this_frame_directions, 0);
    if (right_h())
        array_push(this_frame_directions, 1);
    if (left_h())
        array_push(this_frame_directions, 3);
    var num_inputs = array_length(this_frame_directions);
    movedir = -1;
    if (num_inputs == 0)
    {
        currentdir = -1;
    }
    else if (num_inputs == 1 || currentdir == -1)
    {
        currentdir = this_frame_directions[0];
        movedir = currentdir;
    }
    else
    {
        for (var i = 0; i < num_inputs; i++)
        {
            if (this_frame_directions[i] == currentdir)
            {
                array_delete(this_frame_directions, i, 1);
                break;
            }
        }
        movedir = this_frame_directions[0];
    }
    if (movedir == 3)
    {
        if (lbuff < 3)
            lbuff = 3;
    }
    if (movedir == 1)
    {
        if (rbuff < 3)
            rbuff = 3;
    }
    if (movedir == 2)
    {
        if (ubuff < 3)
            ubuff = 3;
    }
    if (movedir == 0)
    {
        if (dbuff < 3)
            dbuff = 3;
    }
    if (button2_h())
        xbuff = 3;
    if (button1_p())
        zbuff = 3;
    var killblock = collision_rectangle(x, y, x + 80, y + 80, obj_trigger, 0, 0);
    if (i_ex(killblock))
    {
        if (killblock.extflag == "killpiano")
        {
            if (con < 400)
            {
                con = 400;
                timer = 0;
            }
        }
    }
}
var version = 1;
if (con == 2 && version == 1)
{
    var dir = -1;
    if (scr_debug())
    {
        if (keyboard_check_pressed(vk_numpad2))
            dir = 0;
        if (keyboard_check_pressed(vk_numpad6))
            dir = 1;
        if (keyboard_check_pressed(vk_numpad8))
            dir = 2;
        if (keyboard_check_pressed(vk_numpad4))
            dir = 3;
    }
    if (xbuff && !final)
    {
        dbuff = 0;
        rbuff = 0;
        ubuff = 0;
        lbuff = 0;
        zbuff = 0;
        endtimer++;
    }
    else
    {
        endtimer = 0;
    }
    if (endtimer >= endtime)
    {
        timer = 0;
        con = 98;
        endtimer = 0;
    }
    dir = movedir;
    if (button1_p())
    {
        soundtoplay = -1;
        if (!left_h() && !down_h() && !right_h() && !up_h())
            soundtoplay = 0;
        if (left_h())
            soundtoplay = 1;
        if (down_h())
            soundtoplay = 3;
        if (right_h())
            soundtoplay = 5;
        if (up_h())
            soundtoplay = 7;
        instrument = 524;
        var mypitch = scr_piano_determinepitch(soundtoplay);
        makenote = 1;
        snd_play(instrument, 0.7, mypitch);
    }
    if (dir != -1 && zbuff > 0)
    {
        zbuff = 0;
        var px = 0;
        var py = 0;
        var stoppingpoint = -1;
        var mysol = mysolid;
        var checkstep = 20;
        var checkcount = 0;
        switch (dir)
        {
            case 0:
                py = 1;
                break;
            case 1:
                px = 1;
                break;
            case 2:
                py = -1;
                break;
            case 3:
                px = -1;
                break;
        }
        var _list = ds_list_create();
        var _num = -4;
        if (stoppingpoint == -1)
            _num = collision_rectangle_list(x + (px * 40), y + (py * 40), (x + mywidth + (px * 40)) - 1, (y + myheight + (py * 40)) - 1, obj_solidblock, false, true, _list, false);
        if (_num > 0)
        {
            for (var j = 0; j < _num; j++)
            {
                if (stoppingpoint == -1)
                {
                    if (i_ex(ds_list_find_value(_list, j)))
                    {
                        var carryon = false;
                        if (ds_list_find_value(_list, j) == mysolid.mysolid)
                            carryon = true;
                        with (ds_list_find_value(_list, j))
                        {
                            if (variable_instance_exists(id, "extflag") && extflag == "breakable")
                                carryon = true;
                        }
                        if (!carryon)
                            stoppingpoint = true;
                    }
                }
            }
        }
        ds_list_destroy(_list);
        if (!stoppingpoint)
        {
            if (camcon == 1)
            {
                camcon = 2;
                global.flag[1538] = 1;
            }
            con = 3;
            if (ralsei_knocked_down > 0)
                ralshakex = 8;
            ralsei_knocked_down = 0;
            snd_play(snd_wing);
            myhspeed = 0;
            myvspeed = 0;
            switch (dir)
            {
                case 0:
                    myvspeed = 2;
                    break;
                case 1:
                    myhspeed = 2;
                    break;
                case 2:
                    myvspeed = -2;
                    break;
                case 3:
                    myhspeed = -2;
                    break;
            }
        }
    }
}
if (con == 3)
{
    var maxspeed = 28;
    if (myhspeed != 0)
        myhspeed = lerp(abs(myhspeed), maxspeed, 0.25) * sign(myhspeed);
    if (myvspeed != 0)
        myvspeed = lerp(abs(myvspeed), maxspeed, 0.25) * sign(myvspeed);
    var jumppoint = instance_place(x, y, obj_genmarker);
    if (jumppoint != -4)
    {
        if (jumppoint.extflag == "jump")
        {
            con = 4;
            snd_play(snd_motor_upper_2);
            yspeed = -16;
            yoffset = yspeed;
            exit;
        }
        else if (jumppoint.extflag == "camlock")
        {
            camcontrol = 1;
            camx = camerax();
            camy = cameray();
        }
        else if (jumppoint.extflag == "camfree")
        {
            camcontrol = 0;
            obj_mainchara.cutscene = 0;
        }
        else if (jumppoint.extflag == "explode")
        {
            con = 400;
        }
    }
    var _list = ds_list_create();
    var _num = -4;
    _num = collision_rectangle_list(x + myhspeed, y + myvspeed, (x + myhspeed + mywidth) - 1, (y + myvspeed + myheight) - 1, obj_solidblock, false, true, _list, false);
    var stoppingpoint = false;
    if ((floor(current_time) % 2) == 0)
    {
        var xOffset = 0.5;
        var yOffset = random(0.6) + 0.2;
        if (myvspeed != 0)
        {
            xOffset = yOffset;
            yOffset = 0.5;
        }
        var dust = instance_create(x + (xOffset * sprite_width), y + (yOffset * sprite_height), obj_animation);
        dust.sprite_index = spr_climb_dust_small;
        dust.image_xscale = 2;
        dust.image_yscale = 2;
        dust.image_speed = 0.5;
        dust.hspeed = random_range(-1, 1);
        dust.depth = depth + 10;
    }
    var foundblock = 0;
    if (_num > 0)
    {
        for (var j = 0; j < _num; j++)
        {
            if (i_ex(ds_list_find_value(_list, j)))
            {
                var carryon = false;
                if (ds_list_find_value(_list, j) == mysolid.mysolid)
                    carryon = true;
                with (ds_list_find_value(_list, j))
                {
                    if (variable_instance_exists(id, "extflag") && extflag == "breakable")
                        carryon = true;
                }
                if (!carryon)
                {
                    foundblock = ds_list_find_value(_list, j);
                    stoppingpoint = true;
                }
            }
        }
    }
    ds_list_destroy(_list);
    if (stoppingpoint)
    {
        if (i_ex(foundblock))
        {
            myhspeed = round(myhspeed);
            myvspeed = round(myvspeed);
            x = round(x);
            y = round(y);
            var endloop = false;
            for (var i = 0; i < (max(abs(myhspeed), abs(myvspeed)) + 1); i++)
            {
                if (!endloop)
                {
                    if (i_ex(collision_rectangle(x + myhspeed, y + myvspeed, (x + myhspeed + mywidth) - 1, (y + myvspeed + myheight) - 1, foundblock, false, true)))
                    {
                        if (myhspeed != 0)
                            myhspeed = (abs(myhspeed) - 1) * sign(myhspeed);
                        if (myvspeed != 0)
                            myvspeed = (abs(myvspeed) - 1) * sign(myvspeed);
                    }
                    else
                    {
                        endloop = true;
                        x += myhspeed;
                        y += myvspeed;
                    }
                }
            }
        }
        x = round(x / 40) * 40;
        y = round(y / 40) * 40;
        snd_play(snd_bomb);
        if (myhspeed != 0)
            shakex = 8;
        else
            shakey = 8;
        con = 2;
    }
    else if (!hitstop)
    {
        x += round(myhspeed);
        y += round(myvspeed);
    }
    else
    {
        hitstop--;
    }
}
if (con == 4)
{
    var jumppoint = instance_place(x, y, obj_genmarker);
    if (jumppoint != -4)
    {
        if (jumppoint.extflag == "explode")
        {
            con = 400;
            timer = 0;
        }
    }
    var maxspeed = 16;
    if (myhspeed != 0)
        myhspeed = lerp(abs(myhspeed), maxspeed, 0.25) * sign(myhspeed);
    if (myvspeed != 0)
        myvspeed = lerp(abs(myvspeed), maxspeed, 0.25) * sign(myvspeed);
    x += round(myhspeed);
    y += round(myvspeed);
    yspeed += 0.65;
    yoffset += yspeed;
    if (yoffset >= 0)
    {
        yoffset = 0;
        con = 3;
        snd_play(snd_impact);
        shakex = 12;
        yspeed = 0;
    }
}
if (con == 2 && version == 0)
{
    if (xbuff)
    {
        dbuff = 0;
        rbuff = 0;
        ubuff = 0;
        lbuff = 0;
        zbuff = 0;
        endtimer++;
    }
    else
    {
        endtimer = 0;
    }
    if (endtimer >= endtime)
    {
        timer = 0;
        con = 98;
        endtimer = 0;
    }
    var dir;
    if (dbuff > 0 && dbuff > ubuff && dbuff > rbuff && dbuff > lbuff)
        dir = 0;
    if (rbuff > 0 && rbuff > ubuff && rbuff > dbuff && rbuff > lbuff)
        dir = 1;
    if (ubuff > 0 && ubuff > dbuff && ubuff > rbuff && ubuff > lbuff)
        dir = 2;
    if (lbuff > 0 && lbuff > dbuff && lbuff > rbuff && lbuff > ubuff)
        dir = 3;
    if (dir != -1 && button1_p())
    {
        var px = 0;
        var py = 0;
        var stoppingpoint = -1;
        var mysol = mysolid;
        var checkstep = 20;
        var checkcount = 0;
        switch (dir)
        {
            case 0:
                py = 1;
                break;
            case 1:
                px = 1;
                break;
            case 2:
                py = -1;
                break;
            case 3:
                px = -1;
                break;
        }
        for (var i = 0; i < 1920; i += checkstep)
        {
            var _list = ds_list_create();
            var _num = -4;
            if (stoppingpoint == -1)
            {
                _num = collision_rectangle_list(x + (px * i), y + (py * i), (x + mywidth + (px * i)) - 1, (y + myheight + (py * i)) - 1, obj_solidblock, false, true, _list, false);
                checkcount++;
            }
            if (_num > 0)
            {
                for (var j = 0; j < _num; j++)
                {
                    if (stoppingpoint == -1)
                    {
                        if (i_ex(ds_list_find_value(_list, j)))
                        {
                            var carryon = false;
                            if (ds_list_find_value(_list, j) == mysolid)
                                carryon = true;
                            if (ds_list_find_value(_list, j) == mysolid.mysolid)
                                carryon = true;
                            with (ds_list_find_value(_list, j))
                            {
                                if (variable_instance_exists(id, "extflag") && extflag == "breakable")
                                    carryon = true;
                            }
                            if (!carryon)
                                stoppingpoint = i - checkstep;
                        }
                    }
                }
            }
            ds_list_destroy(_list);
        }
        if (stoppingpoint != 0)
        {
            var delay = round(stoppingpoint / 24);
            if (px != 0)
                scr_lerpvar("x", x, x + (px * stoppingpoint), delay);
            if (py != 0)
                scr_lerpvar("y", y, y + (py * stoppingpoint), delay);
            con = 3;
            scr_delay_var("con", 2, delay + 1);
            ubuff = 0;
            dbuff = 0;
            lbuff = 0;
            rbuff = 0;
            xbuff = 0;
            zbuff = 0;
        }
    }
}
if (con == 98)
{
    global.interact = 1;
    obj_mainchara.fun = false;
    obj_mainchara.freeze = false;
    global.flag[1585] = floor((x / 40) * 1000) + floor(y / 40);
    su_actor = -4;
    ra_actor = -4;
    camcontrol = 0;
    camcon = 0;
    engaged = false;
    con = 99;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_pannable(1);
    var krpos = [x + 20, obj_mainchara.y + 6];
    var walktime = max(round(point_distance(krpos[0], krpos[1], obj_mainchara.x, obj_mainchara.y) / 4), 1);
    c_sel(kr);
    c_walkdirect(krpos[0], krpos[1], walktime);
    var pos = scr_cameraideal(krpos[0], krpos[1]);
    var pantime = clamp(round(pos[2] / 8), walktime, 15);
    c_pan(pos[0], pos[1], pantime);
    if (i_ex(su_actor))
    {
        c_sel(su);
        c_walkdirect(krpos[0] + 8, krpos[1] - 26, pantime);
    }
    if (i_ex(ra_actor))
    {
        c_sel(ra);
        c_walkdirect(krpos[0] - 18, krpos[1] - 26, pantime);
    }
    c_wait(pantime);
    c_wait(1);
    c_sel(kr);
    c_facing("d");
    if (i_ex(su_actor))
        c_sel(su);
    c_facing("d");
    if (i_ex(ra_actor))
        c_sel(ra);
    c_facing("d");
    c_wait(1);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 99 && !i_ex(obj_cutscene_master))
{
    ubuff = 0;
    dbuff = 0;
    lbuff = 0;
    rbuff = 0;
    xbuff = 0;
    zbuff = 0;
    global.facing = 0;
    scr_caterpillar_interpolate("all");
    timer = 0;
    con = 0;
    global.interact = 0;
    global.flag[7] = 0;
}
if (con == 400)
{
    timer++;
    var jumptime = 16;
    var jumpheight = 20;
    var explodedelay = 26;
    var maxspeed = 16;
    if (myhspeed != 0)
        myhspeed = lerp(abs(myhspeed), maxspeed, 0.25) * sign(myhspeed);
    if (myvspeed != 0)
        myvspeed = lerp(abs(myvspeed), maxspeed, 0.25) * sign(myvspeed);
    x += round(myhspeed);
    y += round(myvspeed);
    yspeed += 0.65;
    yoffset += yspeed;
    if (yoffset >= 0)
        image_alpha -= 0.1;
    if (timer == 1)
    {
        kris.freeze = true;
        kris.fun = true;
        obj_mainchara.cutscene = 1;
        var pos = scr_heromarker("kr", "killpiano");
        var cx = clamp(pos[0] - 281, 0, room_width - 640);
        var cy = clamp(pos[1] - 206, 0, room_height - 480);
        scr_pan_lerp(cx, cy, jumptime);
        var jumpstrength = 12;
        engaged = false;
        snd_play(snd_wing);
        with (kris)
        {
            visible = 0;
            image_alpha = 0;
            var jumpmarker = scr_marker_ext(x, y, spr_kris_jump_ball_fixed, 2, 2, 0.25, 0, c_white, obj_mainchara.depth);
            with (jumpmarker)
            {
                depth = 1000;
                scr_jump_to_point(pos[0], pos[1], jumpheight, jumptime);
                scr_doom(self, jumptime);
            }
            scr_var_delay("visible", 1, jumptime);
            scr_var_delay("image_alpha", 1, jumptime);
            scr_var_delay("x", pos[0], jumptime);
            scr_var_delay("y", pos[1], jumptime);
        }
        if (i_ex(susie))
        {
            with (susie)
            {
                image_xscale = 2;
                visible = 0;
                image_alpha = 0;
                fun = 1;
                pos = scr_heromarker("su", "killpiano");
                var jumpmarker = scr_marker_ext(x, y, spr_susie_dw_jump_ball, 2, 2, 0.25, 0, c_white, obj_mainchara.depth);
                with (jumpmarker)
                {
                    depth = 1000;
                    scr_jump_to_point(pos[0], pos[1], jumpstrength, jumptime);
                    scr_doom(self, jumptime);
                }
                scr_var_delay("visible", 1, jumptime);
                scr_var_delay("image_alpha", 1, jumptime);
                scr_var_delay("x", pos[0], jumptime);
                scr_var_delay("y", pos[1], jumptime);
            }
        }
        if (i_ex(ralsei))
        {
            with (ralsei)
            {
                visible = 0;
                image_alpha = 0;
                fun = 1;
                pos = scr_heromarker("ra", "killpiano");
                var jumpmarker = scr_marker_ext(x, y, spr_ralsei_jump_ball, 2, 2, 0.25, 0, c_white, obj_mainchara.depth);
                with (jumpmarker)
                {
                    depth = 1000;
                    scr_jump_to_point(pos[0], pos[1], jumpstrength, jumptime);
                    scr_doom(self, jumptime);
                }
                scr_var_delay("visible", 1, jumptime);
                scr_var_delay("image_alpha", 1, jumptime);
                scr_var_delay("x", pos[0], jumptime);
                scr_var_delay("y", pos[1], jumptime);
            }
        }
    }
    if (image_alpha <= 0)
    {
        visible = false;
        scr_shakescreen(0, 8);
        snd_play(snd_impact);
        safe_delete(mysolid);
        instance_destroy();
    }
    if (timer == (1 + jumptime))
    {
        snd_play(snd_noise);
        global.facing = 0;
        with (ralsei)
        {
            fun = 0;
            scr_caterpillar_interpolate_old();
            scr_caterpillar_facing(global.facing);
            follow = true;
        }
        with (susie)
        {
            fun = 0;
            scr_caterpillar_interpolate_old();
            scr_caterpillar_facing(global.facing);
            follow = true;
        }
        with (kris)
        {
            fun = false;
            freeze = false;
        }
        global.flag[7] = 0;
    }
}
if (shakex > 0)
    shakex -= 1;
if (shakey > 0)
    shakey -= 1;
