var xmove = 280;
if (!camcontrol)
{
    camx = camerax();
    camy = cameray();
}
if (con == 0)
{
    if (i_ex(lawnmower))
    {
        if (lawnmower.myinteract == 3)
        {
            global.flag[1147] = 1;
            global.interact = 1;
            camcontrol = true;
            con = 1;
        }
    }
    if (obj_b3bs_console.swordinteract == 1)
    {
        global.interact = 1;
        con = 1001;
    }
}
if (con == 1)
{
    if (i_ex(lawnmower))
    {
        for (var i = 0; i < (array_length(sadshad) - 1); i++)
        {
            if (i_ex(sadshad[i]))
            {
                if ((sadshad[i].x + 38) > lawnmower.x && sadshad[i].sprite_index == spr_shadowman_playgamesad)
                {
                    sadshad[i].sprite_index = spr_shadowman_playgameSurprised;
                    scr_shakeobj(sadshad[i]);
                    boardshad[i].image_speed = 0;
                    boardshad[i].sprite_index = spr_dw_b3bs_sadshadowguys_surprised;
                }
            }
        }
        if (lawnmower.x <= (810 + xmove) && pyjump == 0)
            pyjump = 1;
        camx = min(camx, lawnmower.x - 320, 914 + xmove);
        with (lawnmower)
        {
            if (place_meeting(x, y, obj_board_trigger))
            {
                with (instance_create(x, y, obj_board_smokepuff))
                    image_blend = c_yellow;
                snd_play(snd_impact);
                snd_play_x(snd_impact, 1, 0.8);
                other.con = 2;
                with (obj_dw_ch3_b3bs_office_paperstack)
                {
                    if (x < 1558)
                        instance_destroy();
                }
                instance_destroy();
            }
        }
    }
}
if (con == 2)
{
    timer++;
    if (timer == 1)
    {
        crblock = 1;
        safe_delete(pynpc);
        var xoff = 0;
        var yoff = 0;
        if (dooffset)
        {
            xoff = -88;
            yoff = 14;
        }
        for (var i = 0; i < (array_length(sadshad) - 1); i++)
        {
            if (i_ex(sadshad[i]))
            {
                var newshad = scr_marker_ext(sadshad[i].x + xoff, sadshad[i].y + yoff, spr_shadowman_dancewalk, 2, 2, 0.25, undefined, undefined, 96539);
                array_push(happyshad, newshad);
                with (sadshad[i])
                    instance_destroy();
            }
        }
        with (obj_b3bs_console)
            endplay = true;
        pyupdate = 1;
    }
    if (timer == 2)
    {
        global.facing = 3;
        global.interact = 1;
        with (obj_caterpillarchara)
        {
            follow = false;
            scr_caterpillar_facing(3);
            if (name == "susie")
                setxy(1244 + xmove, 276);
            if (name == "ralsei")
                setxy(1290 + xmove, 280);
        }
    }
    if (timer == 10)
    {
        with (obj_mainchara)
        {
            y = 270;
            fun = 1;
            sprite_index = lsprite;
        }
    }
    if (timer == 15)
        scr_lerpvar("camx", camx, 914 + xmove, 60, 2, "out");
    if (timer == 76)
    {
        timer = 0;
        con = 3;
    }
}
if (con == 3)
{
    timer++;
    if (timer == 1)
    {
        killhappyshads = true;
        with (happyshad[10])
        {
            var walktime = round(abs(x - (1148 + xmove)) / 4);
            scr_lerpvar("x", x, 1148 + xmove, walktime);
            snd_play_delay(snd_noise, walktime + 1);
            scr_delay_var("sprite_index", 4167, walktime + 1);
            snd_play_delay(choose(snd_shadowman_sax_1, snd_shadowman_sax_2, snd_shadowman_sax_3), walktime + 1 + 15);
            scr_delay_var("sprite_index", 92, walktime + 1 + 15);
            scr_delay_var("sprite_index", 4372, walktime + 1 + 15 + 15);
            scr_delay_var("hspeed", 8, walktime + 1 + 15 + 15);
            scr_delay_var("vspeed", 8, walktime + 1 + 15 + 15);
            scr_delay_var("depth", 96320, walktime + 1 + 15 + 15);
            friction = -0.5;
            scr_limitval_upper(id, "y", 284);
            scr_doom(id, 400);
        }
        with (obj_board_marker)
        {
            if (x == (1136 + xmove))
            {
                instance_create(x, y, obj_board_smokepuff);
                if (!other.dooffset)
                    snd_play(snd_board_splash);
                instance_destroy();
            }
        }
    }
    if (timer == 45)
    {
        with (happyshad[9])
        {
            var walktime = round(abs(x - (1148 + xmove)) / 8);
            scr_lerpvar("x", x, 1148 + xmove, walktime);
            snd_play_delay(snd_noise, walktime + 1);
            scr_delay_var("sprite_index", 4167, walktime + 1);
            snd_play_delay(choose(snd_shadowman_sax_1, snd_shadowman_sax_2, snd_shadowman_sax_3), walktime + 1 + 15);
            scr_delay_var("sprite_index", 92, walktime + 1 + 15);
            scr_delay_var("sprite_index", 4372, walktime + 1 + 15 + 15);
            scr_delay_var("hspeed", 8, walktime + 1 + 15 + 15);
            scr_delay_var("vspeed", 8, walktime + 1 + 15 + 15);
            scr_delay_var("depth", 96320, walktime + 1 + 15 + 15);
            friction = -0.5;
            scr_limitval_upper(id, "y", 284);
            scr_doom(id, 400);
        }
        with (obj_board_marker)
        {
            if (x == ((1136 + xmove) - 78))
            {
                instance_create(x, y, obj_board_smokepuff);
                if (!other.dooffset)
                    snd_play_x(snd_board_splash, 0.75, 1);
                instance_destroy();
            }
        }
    }
    if (timer == 80)
    {
        with (happyshad[8])
        {
            var walktime = round(abs(x - (1148 + xmove)) / 12);
            scr_lerpvar("x", x, 1148 + xmove, walktime);
            snd_play_delay(snd_noise, walktime + 1);
            scr_delay_var("sprite_index", 4167, walktime + 1);
            snd_play_delay(choose(snd_shadowman_sax_1, snd_shadowman_sax_2, snd_shadowman_sax_3), walktime + 1 + 15);
            scr_delay_var("sprite_index", 92, walktime + 1 + 15);
            scr_delay_var("sprite_index", 4372, walktime + 1 + 15 + 15);
            scr_delay_var("hspeed", 8, walktime + 1 + 15 + 15);
            scr_delay_var("vspeed", 8, walktime + 1 + 15 + 15);
            scr_delay_var("depth", 96320, walktime + 1 + 15 + 15);
            friction = -0.5;
            scr_limitval_upper(id, "y", 284);
            scr_doom(id, 400);
        }
        with (obj_board_marker)
        {
            if (x == ((1136 + xmove) - 156))
            {
                instance_create(x, y, obj_board_smokepuff);
                if (!other.dooffset)
                    snd_play_x(snd_board_splash, 0.5, 1);
                instance_destroy();
            }
        }
    }
    if (timer == 107)
    {
        with (happyshad[7])
        {
            var walktime = round(abs(x - (1148 + xmove)) / 12);
            scr_lerpvar("x", x, 1148 + xmove, walktime);
            snd_play_delay(snd_noise, walktime + 1);
            scr_delay_var("sprite_index", 4167, walktime + 1);
            snd_play_delay(choose(snd_shadowman_sax_1, snd_shadowman_sax_2, snd_shadowman_sax_3), walktime + 1 + 15);
            scr_delay_var("sprite_index", 92, walktime + 1 + 15);
            scr_delay_var("sprite_index", 4372, walktime + 1 + 15 + 15);
            scr_delay_var("hspeed", 8, walktime + 1 + 15 + 15);
            scr_delay_var("vspeed", 8, walktime + 1 + 15 + 15);
            scr_delay_var("depth", 96320, walktime + 1 + 15 + 15);
            friction = -0.5;
            scr_limitval_upper(id, "y", 284);
            scr_doom(id, 400);
        }
        with (obj_board_marker)
        {
            if (x == ((1136 + xmove) - 234))
            {
                instance_create(x, y, obj_board_smokepuff);
                if (!other.dooffset)
                    snd_play_x(snd_board_splash, 0.25, 1);
                instance_destroy();
            }
        }
        for (var i = 0; i < 7; i++)
            safe_delete(happyshad[i]);
    }
    for (var i = 0; i < 5; i++)
    {
        if (timer == (((160 + (30 * i)) - 8) + 33))
        {
            with (scr_marker_ext(camerax() - 80, 242, spr_shadowman_dancewalk, 2, 2, 0.35, undefined, undefined, 96539))
            {
                var walktime = round(abs(x - (1148 + xmove)) / 20);
                scr_lerpvar("x", x, 1148 + xmove, walktime);
                snd_play_delay(snd_noise, walktime + 1);
                scr_delay_var("sprite_index", 4167, walktime + 1);
                snd_play_delay(choose(snd_shadowman_sax_1, snd_shadowman_sax_2, snd_shadowman_sax_3), walktime + 1 + 8);
                scr_delay_var("sprite_index", 92, walktime + 1 + 8);
                scr_delay_var("sprite_index", 4372, walktime + 1 + 8 + 8);
                scr_delay_var("hspeed", 16, walktime + 1 + 16);
                scr_delay_var("vspeed", 10, walktime + 1 + 16);
                scr_delay_var("depth", 96320, walktime + 1 + 16);
                friction = -0.5;
                scr_limitval_upper(id, "y", 284);
                scr_doom(id, 400);
            }
        }
    }
    if (timer == 338)
    {
        scr_delay_var("killhappyshads", false, 30);
        timer = 0;
        con++;
    }
}
if (killhappyshads == true)
{
    with (obj_marker)
    {
        if (x > (camerax() + 640))
        {
            other.killcount++;
            var ymod = 0;
            if ((other.killcount % 2) == 0)
                ymod = 42;
            if (sprite_index == spr_shadowman_dancewalk)
            {
                global.flag[654] += 0.04;
                if (global.flag[654] > 1)
                    global.flag[654] = 1;
                snd_play(snd_sparkle_gem);
                with (instance_create((camerax() + 640) - 50, y + ymod, obj_recruitanim))
                    showcount = true;
                instance_destroy();
            }
        }
    }
}
if (con == 4)
{
    timer++;
    if (timer == 1)
    {
        py_lockpos = true;
        scr_lerpvar("px", px, 1078 + xmove, 20);
    }
    if (timer == 22)
    {
        snd_play(snd_noise);
        pyramid[6].sprite_index = spr_shadowman_shakehand;
        pydepth = obj_mainchara.depth - 1;
    }
    if (timer == 36)
    {
        for (var i = 0; i < array_length(pyramid); i++)
        {
            pyramid[i].sprite_index = spr_shadowman_doffhat;
            pyramid[i].image_speed = 0.25;
            pyramid[i].image_index = 0;
        }
        snd_play(snd_shadowman_sax_long);
    }
    if (timer == 51)
    {
        for (var i = 0; i < array_length(pyramid); i++)
        {
            pyramid[i].sprite_index = spr_shadowman_dancewalk;
            pyramid[i].image_speed = 0.25;
            pyramid[i].image_index = i + y;
        }
        pydepth = 94320;
        scr_lerpvar("py", py, 142, 4, 2, "out");
        scr_lerpvar("px", px, 1700 + xmove, 40);
    }
    if (timer == 91)
    {
        global.flag[654] += 0.4;
        if (global.flag[654] > 1)
            global.flag[654] = 1;
        snd_play(snd_sparkle_gem);
        with (instance_create((camerax() + 640) - 50, 306, obj_recruitanim))
        {
            showcount = true;
            firstnumber = 10;
        }
    }
    if (timer == 92)
    {
        timer = 0;
        con = 5;
    }
}
if (con == 5)
{
    with (obj_npc_room)
    {
        if (extflag == "sadshad")
        {
            other.loner = scr_marker_ext(x, y, sprite_index, image_xscale, image_yscale, image_speed, image_index, image_blend, depth);
            instance_destroy();
        }
    }
    with (obj_mainchara)
        fun = 0;
    global.facing = 1;
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
            scr_caterpillar_facing(2);
        else
            scr_caterpillar_facing(1);
    }
    timer = -15;
    con = 6;
}
if (con == 6)
{
    timer++;
    if (timer == 15)
    {
        loner.sprite_index = spr_shadowman_sadlookaround;
        loner.image_speed = 0.0625;
    }
    if (timer >= 60)
    {
        loner.image_index = 0;
        loner.image_speed = 0;
        timer = 0;
        con++;
    }
}
if (con == 7)
{
    timer++;
    if (timer == 1)
    {
        loner.image_xscale = -2;
        loner.x += 90;
        loner.sprite_index = spr_shadowman_doffhat;
        loner.image_index = 0;
    }
    if (timer == 15)
    {
        loner.image_index = 1;
        snd_play(snd_wing);
    }
    if (timer == 30)
    {
        with (loner)
        {
            other.loner = instance_create(x, y, obj_defeatanim);
            other.loner.sprite_index = sprite_index;
            other.loner.image_xscale = image_xscale;
            other.loner.image_yscale = image_yscale;
            other.loner.dosweat = false;
            other.loner.depth = depth;
            instance_destroy();
        }
    }
    if (timer == 45)
    {
        global.flag[654] += 0.04;
        if (global.flag[654] > 1)
            global.flag[654] = 1;
        snd_play(snd_shineselect);
        snd_play(snd_sparkle_glock);
        with (instance_create((camerax() + 640) - 50, 306, obj_recruitanim))
        {
            showcount = true;
            firstnumber = 1;
        }
        with (obj_board_marker)
        {
            if (x == (1292 + xmove))
            {
                instance_create(x, y, obj_board_smokepuff);
                if (!other.dooffset)
                    snd_play(snd_board_splash);
                instance_destroy();
            }
        }
        with (obj_caterpillarchara)
            scr_caterpillar_facing(1);
    }
    if (timer == 75)
    {
        con++;
        with (obj_caterpillarchara)
        {
            scr_caterpillar_interpolate();
            follow = true;
        }
        with (obj_board_marker)
            instance_destroy();
        px = room_width * 2;
        obj_mainchara.cutscene = false;
        global.facing = 0;
        global.interact = 0;
        camcontrol = false;
        with (obj_b3bs_console)
            camcon = 0;
        global.flag[1147] = 1;
    }
}
if (py_lockpos)
{
    var xx = px;
    var yy = py;
    var xspace = 32;
    var yspace = 72;
    var xoffset = 0;
    with (pyramid[9])
        setxy((xx + (xspace * 0)) - xoffset, yy + (yspace * -1));
    xoffset = 4;
    with (pyramid[0])
        setxy((xx + (xspace * 0)) - xoffset, yy + (yspace * 0));
    with (pyramid[8])
        setxy((xx + (xspace * 1)) - xoffset, yy + (yspace * 0));
    xoffset = 16;
    with (pyramid[1])
        setxy((xx + (xspace * 0)) - xoffset, yy + (yspace * 1));
    with (pyramid[2])
        setxy((xx + (xspace * 1)) - xoffset, yy + (yspace * 1));
    with (pyramid[7])
        setxy((xx + (xspace * 2)) - xoffset, yy + (yspace * 1));
    xoffset = 26;
    with (pyramid[3])
        setxy((xx + (xspace * 0)) - xoffset, yy + (yspace * 2));
    with (pyramid[4])
        setxy((xx + (xspace * 1)) - xoffset, yy + (yspace * 2));
    with (pyramid[5])
        setxy((xx + (xspace * 2)) - xoffset, yy + (yspace * 2));
    with (pyramid[6])
        setxy((xx + (xspace * 3)) - xoffset, yy + (yspace * 2));
}
if (pyjump == 1)
{
    pytimer++;
    if (pytimer == 1)
    {
        var i = array_length(pyramid) - 1;
        while (i > -1)
        {
            with (pyramid[i])
            {
                scr_limitval_upper(id, "y", y, 60);
                gravity = 2;
                sprite_index = spr_shadowman_playgameSurprised;
            }
            i--;
        }
        var delamt = 2;
        var jumpamt = -8;
        with (pyramid[3])
            scr_delay_var("vspeed", jumpamt, 1 * delamt);
        with (pyramid[4])
            scr_delay_var("vspeed", jumpamt, (1 * delamt) + 1);
        with (pyramid[5])
            scr_delay_var("vspeed", jumpamt, (1 * delamt) + 2);
        with (pyramid[6])
            scr_delay_var("vspeed", jumpamt, (1 * delamt) + 3);
        with (pyramid[1])
            scr_delay_var("vspeed", jumpamt, (2 * delamt) + 4);
        with (pyramid[2])
            scr_delay_var("vspeed", jumpamt, (2 * delamt) + 5);
        with (pyramid[7])
            scr_delay_var("vspeed", jumpamt, (2 * delamt) + 6);
        with (pyramid[0])
            scr_delay_var("vspeed", jumpamt, (3 * delamt) + 7);
        with (pyramid[8])
            scr_delay_var("vspeed", jumpamt, (3 * delamt) + 8);
        with (pyramid[9])
            scr_delay_var("vspeed", jumpamt, (4 * delamt) + 9);
    }
    if (pytimer == 44)
    {
        for (var i = 0; i < array_length(pyramid); i++)
        {
            with (pyramid[i])
            {
                gravity = 0;
                vspeed = 0;
                y = ystart;
            }
        }
    }
}
if (pyupdate)
{
    pyupdate = false;
    for (var i = 0; i < array_length(pyramid); i++)
    {
        pyramid[i].sprite_index = spr_shadowman_dancewalk;
        pyramid[i].image_speed = 0.25;
        pyramid[i].image_index = i + y;
    }
    pyjump = -1;
}
if (pydepth != -1)
{
    pyramid[9].depth = pydepth + 3;
    pyramid[0].depth = pydepth + 2;
    pyramid[8].depth = pydepth + 2;
    pyramid[1].depth = pydepth + 1;
    pyramid[2].depth = pydepth + 1;
    pyramid[7].depth = pydepth + 1;
    pyramid[3].depth = pydepth + 0;
    pyramid[4].depth = pydepth + 0;
    pyramid[5].depth = pydepth + 0;
    pyramid[6].depth = pydepth + 0;
    pydepth = -1;
}
if (crblock == 1)
{
    crblock = 2;
    with (instance_create(896 + xmove, 208, obj_board_solid))
        image_xscale = room_width;
    instance_create(880 + xmove, 224, obj_board_solid);
}
if (endshine == 0)
{
    var trig = 0;
    with (obj_b3bs_console)
    {
        if (con != 0)
            trig = 1;
    }
    if (trig == 1)
    {
        endshine = true;
        with (shine)
            instance_destroy();
    }
}
if (con == 1001)
{
    with (obj_b3bs_console)
    {
        with (obj_puzzlecloset_manager)
            camcontrol = false;
        con = 99;
        global.interact = 1;
        kris.cutscene = true;
        cutscene_master = scr_cutscene_make();
        scr_maincharacters_actors();
        if (camx != -1)
            camcon = 1;
        controlxpos = 1496;
        controlypos = 270;
        c_sel(kr);
        c_walkdirect(controlxpos, controlypos, 15);
        if (i_ex(ralsei))
        {
            c_sel(ra);
            c_walkdirect(1570, 280, 30);
        }
        if (i_ex(susie))
        {
            c_sel(su);
            c_walkdirect(1524, 276, 30);
        }
        c_wait(31);
        c_actortokris();
        c_actortocaterpillar();
        c_terminatekillactors();
    }
    global.facing = 2;
    con = 1002;
}
if (con == 1002 && !i_ex(obj_cutscene_master))
{
    global.facing = 2;
    with (obj_caterpillarchara)
        scr_caterpillar_facing(2);
    con++;
    timer = 0;
}
if (con == 1003)
{
    timer++;
    if (timer == 5)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (You attempted to use the console..^1. but realized it wouldn't do anything.)/%", "obj_dw_teevie_shadow_guys_slash_Step_0_gml_686_0");
        d_make();
        timer = 0;
        con++;
    }
}
if (con == 1004 && !d_ex())
{
    timer++;
    if (timer == 15)
    {
        global.facing = 0;
        scr_speaker("no_name");
        msgsetloc(0, "* (You started to leave.)/", "obj_dw_teevie_shadow_guys_slash_Step_0_gml_700_0");
        msgnextloc("* (Suddenly^1, everyone else started to notice it might be okay to leave^1, too...)/%", "obj_dw_teevie_shadow_guys_slash_Step_0_gml_701_0");
        timer = 0;
        con++;
        d_make();
    }
}
if (con == 1005)
{
    if (!d_ex())
        timer++;
    if (scr_getmsgno_d() == 1 || timer == 10)
    {
        timer = 0;
        con++;
        global.facing = 3;
        with (obj_npc_room)
        {
            if (sprite_index == spr_shadowman_playgamesad && x < 1550)
            {
                y -= 14;
                x += 86;
                image_xscale = -2;
                sprite_index = spr_shadowman_idle_a;
            }
        }
    }
}
if (con == 1006 && !d_ex())
    con = 2;
if (i_ex(pynpc))
{
    with (pynpc)
    {
        var delay = 4;
        if (myinteract == 3)
        {
            with (obj_script_delayed)
                instance_destroy();
            snd_stop(snd_shadowman_sax_1);
            snd_stop(snd_shadowman_sax_2);
            snd_stop(snd_shadowman_sax_3);
            for (var i = 0; i < 7; i++)
                snd_play_delay(choose(snd_shadowman_sax_1, snd_shadowman_sax_2, snd_shadowman_sax_3), 1 + (delay * i), 1 - (i / 30), 1 + (i / 15));
            myinteract = 0;
        }
    }
}
