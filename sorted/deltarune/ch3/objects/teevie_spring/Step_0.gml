if (kris == 0)
{
    with (obj_mainchara)
        other.kris = id;
}
if (susie == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            other.susie = id;
    }
}
if (ralsei == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
            other.ralsei = id;
    }
}
if (bossinit == 0)
{
    bossinit = 1;
    if (global.flag[1252] == 1)
    {
        if (name == "left")
            boss = 1;
        else
            boss = -1;
    }
    if (global.flag[1252] == 2)
    {
        if (name == "left")
            boss = -1;
        else
            boss = 1;
    }
}
if (con == 1)
{
    global.interact = 1;
    global.msc = -99;
    global.choice = -1;
    scr_speaker("gouldenson");
    if (boss == 0)
    {
        boss = 1;
        with (object_index)
        {
            if (boss == 0)
                boss = -1;
        }
        if (name == "left" && boss)
            global.flag[1252] = 1;
        else
            global.flag[1252] = 2;
    }
    global.choicemsg[0] = stringsetloc("#Yes", "obj_teevie_spring_slash_Step_0_gml_40_0");
    global.choicemsg[1] = stringsetloc("#No", "obj_teevie_spring_slash_Step_0_gml_41_0");
    global.choicemsg[3] = "";
    global.choicemsg[4] = "";
    if (boss)
    {
        global.choicemsg[2] = stringsetloc("Tell of #Goulden Son 2", "obj_teevie_spring_slash_Step_0_gml_47_0");
        if (global.flag[flag] == 2)
            global.choicemsg[2] = stringsetloc("Tell of #Goulden Son 3", "obj_teevie_spring_slash_Step_0_gml_48_0");
        if (global.flag[flag] < 2)
        {
            msgsetloc(0, "* I'm Goulden Son. I wish there was a Goulden Son 2./", "obj_teevie_spring_slash_Step_0_gml_52_0");
            msgnextloc("* If I send you to the other side^1, will you check for one?/", "obj_teevie_spring_slash_Step_0_gml_53_0");
        }
        if (global.flag[flag] >= 1.5)
            msgsetloc(0, "* I'm Goulden Son. Shall I send you to the other side?/", "obj_teevie_spring_slash_Step_0_gml_57_0");
        if (global.flag[flag] >= 3)
            msgsetloc(0, "* I'm Goulden Son 3. Shall I send you to the other side?/", "obj_teevie_spring_slash_Step_0_gml_62_0");
        if (global.flag[flag] == 0 || global.flag[flag] == 1.5 || global.flag[flag] == 3 || global.flag[flag] == 4)
            msgnextloc("\\C2 ", "obj_teevie_spring_slash_Step_0_gml_68_0");
        else
            msgnextloc("\\C3 ", "obj_teevie_spring_slash_Step_0_gml_69_0");
    }
    if (!boss)
    {
        if (global.flag[flag] == 0)
            global.flag[flag] = 1;
        global.choicemsg[2] = stringsetloc("Tell of #Goulden Son", "obj_teevie_spring_slash_Step_0_gml_76_0");
        if (global.flag[flag] == 3)
            global.choicemsg[2] = stringsetloc("Tell of #Goulden Son 3", "obj_teevie_spring_slash_Step_0_gml_77_0");
        if (global.flag[flag] <= 3)
        {
            msgsetloc(0, "* I'm Goulden Son 2. I wish there was a Goulden Son 3./", "obj_teevie_spring_slash_Step_0_gml_81_0");
            msgnextloc("* If I send you to the other side^1, will you check for one?/", "obj_teevie_spring_slash_Step_0_gml_82_0");
            if (global.flag[flag] == 2)
                msgnextloc("\\C2 ", "obj_teevie_spring_slash_Step_0_gml_84_0");
            else
                msgnextloc("\\C3 ", "obj_teevie_spring_slash_Step_0_gml_85_0");
        }
        else
        {
            msgsetloc(0, "* I'm Goulden Son 2. Shall I send you to the other side?/", "obj_teevie_spring_slash_Step_0_gml_89_0");
            msgnextloc("\\C2 ", "obj_teevie_spring_slash_Step_0_gml_90_0");
        }
    }
    d_make();
    con = 2;
}
if (con == 2 && global.choice != -1)
{
    k_d(1);
    if (global.choice == 0)
    {
        con = 3;
        timer = 0;
    }
    if (global.choice == 1)
    {
        global.facing = 0;
        global.interact = 0;
        con = 0;
    }
    if (global.choice == 2)
        con = 10;
}
if (con == 3)
{
    timer++;
    var jumptime = 20;
    var bouncedelay = 10;
    var targx = x + 24;
    var targy = y - 22;
    if (timer == 1)
    {
        snd_play(snd_jump);
        snd_play_delay(snd_noise, jumptime);
        scr_delay_var("image_index", 1, jumptime);
        with (obj_mainchara)
        {
            fun = 1;
            cutscene = true;
            sprite_index = spr_kris_jump_ball_fixed;
            image_speed = 0.25;
            scr_jump_to_point(targx + 14, targy - 2, jumptime, 20, true);
            scr_delay_var("sprite_index", 49, jumptime);
            scr_delay_var("image_speed", 0, jumptime);
            scr_delay_var("image_index", 0, jumptime);
            scr_delay_var("image_index", 1, jumptime + 2);
            ignoredepth = true;
            depth = other.depth - 3;
        }
        with (obj_caterpillarchara)
        {
            follow = false;
            fun = 1;
            ignoredepth = true;
            if (name == "susie")
            {
                var xoff = -14;
                var yoff = -22;
                sprite_index = spr_susie_dw_jump_ball_fixed;
                scr_jump_to_point(targx + xoff, targy + yoff, jumptime, 20, true);
                scr_delay_var("sprite_index", 66, jumptime);
                scr_delay_var("image_speed", 0, jumptime);
                scr_delay_var("image_index", 0, jumptime);
                scr_delay_var("image_index", 1, jumptime + 2);
                depth = other.depth - 2;
            }
            if (name == "ralsei")
            {
                var xoff = 36;
                var yoff = -12;
                sprite_index = spr_ralsei_jump_ball_fixed;
                scr_jump_to_point(targx + xoff, targy + yoff, jumptime, 20, true);
                scr_delay_var("sprite_index", 2629, jumptime);
                scr_delay_var("image_speed", 0, jumptime);
                scr_delay_var("image_index", 0, jumptime);
                scr_delay_var("image_index", 1, jumptime + 2);
                depth = other.depth - 2;
            }
        }
    }
    if (timer == (jumptime + bouncedelay))
    {
        scr_shakeobj();
        snd_play(snd_wing);
        snd_play(snd_metalhit);
        snd_play_x(snd_jump, 0.9, 1.2);
        image_index = 2;
        scr_delay_var("image_index", 1, 5);
        scr_delay_var("image_index", 0, 6);
        with (obj_mainchara)
        {
            y -= 22;
            scr_lerpvar("y", y, cameray() - 120, 10, 2, "out");
            scr_delay_var("sprite_index", 4705, 2);
            scr_delay_var("image_speed", 0.25, 2);
        }
        with (obj_caterpillarchara)
        {
            y -= 22;
            scr_lerpvar("y", y, cameray() - 120, 10, 2, "out");
            if (name == "ralsei")
                scr_delay_var("sprite_index", 3949, 2);
            if (name == "susie")
                scr_delay_var("sprite_index", 449, 2);
            scr_delay_var("image_speed", 0.25, 2);
        }
    }
    if (timer == (jumptime + bouncedelay + 15))
    {
        if (x < (room_width / 2))
        {
            camdesx = room_width - 640;
            krx = 6116;
            kry = 284;
        }
        else
        {
            camdesx = 0;
            krx = 142;
            kry = 226;
        }
        sux = (krx - 80) + 28;
        suy = kry - 10 - 14;
        rax = (krx + 80) - 10 - 20;
        ray = (suy - 28) + 32;
        timer = 0;
        con++;
    }
}
if (con == 4)
{
    camerax_set(camdesx);
    timer = 0;
    con = 5;
}
if (con == 5)
{
    var halttime = 60;
    timer++;
    if (timer == 1)
    {
        global.facing = 0;
        with (kris)
        {
            depth = 100000 - ((other.kry * 10) + (sprite_height * 10));
            x = other.krx;
            gravity = 2;
            vspeed = 8;
            scr_limitval_upper(id, "y", other.kry, halttime);
            scr_delay_var("gravity", 0, 58);
            scr_delay_var("vspeed", 0, 58);
        }
        with (ralsei)
        {
            vspeed = 8;
            depth = 100000 - ((other.ray * 10) + (sprite_height * 10));
            x = other.rax;
            gravity = 2;
            scr_limitval_upper(id, "y", other.ray, halttime);
            scr_delay_var("gravity", 0, 58);
            scr_delay_var("vspeed", 0, 58);
        }
        with (susie)
        {
            vspeed = 8;
            depth = 100000 - ((other.suy * 10) + (sprite_height * 10));
            x = other.sux;
            gravity = 2;
            scr_limitval_upper(id, "y", other.suy, halttime);
            scr_delay_var("gravity", 0, 58);
            scr_delay_var("vspeed", 0, 58);
        }
    }
    if (timer > 1)
    {
        if (krarrived == 0)
        {
            var arrived = false;
            if (!i_ex(kris))
                arrived = true;
            if (kris.y >= (kry - 1))
            {
                arrived = true;
                snd_stop(snd_noise);
                snd_play(snd_noise);
                kris.sprite_index = spr_kris_dw_landed;
                kris.image_speed = 0;
                kris.image_index = 0;
                with (kris)
                    scr_delay_var("image_index", 1, 2);
                with (kris)
                    scr_delay_var("fun", 0, 4);
                kris.gravity = 0;
                kris.speed = 0;
                kris.y = kry;
                kris.ignoredepth = false;
            }
            if (arrived == true)
                krarrived = 1;
        }
        if (suarrived == 0)
        {
            var arrived = false;
            if (!i_ex(susie))
            {
                arrived = true;
            }
            else if (susie.y >= (suy - 1))
            {
                arrived = true;
                susie.sprite_index = spr_susie_dw_landed;
                susie.image_speed = 0;
                susie.image_index = 0;
                with (susie)
                    scr_delay_var("image_index", 1, 2);
                with (susie)
                    scr_delay_var("fun", 0, 4);
                susie.ignoredepth = false;
            }
            if (arrived == true)
                suarrived = 1;
        }
        if (raarrived == 0)
        {
            var arrived = false;
            if (!i_ex(ralsei))
            {
                rarrived = 1;
            }
            else if (ralsei.y >= (ray - 1))
            {
                arrived = true;
                ralsei.sprite_index = spr_teacup_ralsei_land;
                ralsei.image_speed = 0;
                ralsei.image_index = 0;
                with (ralsei)
                    scr_delay_var("image_index", 1, 2);
                with (ralsei)
                    scr_delay_var("fun", 0, 4);
                ralsei.ignoredepth = false;
            }
            if (arrived == true)
                raarrived = 1;
        }
        if (krarrived && suarrived && raarrived && kris.fun == 0)
        {
            timer = 0;
            con++;
        }
    }
}
if (con == 6)
{
    with (obj_mainchara)
    {
        gravity = 0;
        vspeed = 0;
    }
    with (obj_caterpillarchara)
    {
        gravity = 0;
        vspeed = 0;
    }
    with (obj_limit_val)
    {
        if (target.object_index == obj_mainchara || target.object_index == obj_caterpillarchara)
            instance_destroy();
    }
    kris.cutscene = false;
    susie = 0;
    with (obj_caterpillarchara)
    {
        scr_caterpillar_interpolate();
        follow = true;
    }
    with (object_index)
    {
        global.interact = 0;
        timer = 0;
        con = 0;
        image_index = 0;
        krarrived = 0;
        suarrived = 0;
        raarrived = 0;
    }
}
if (con == 10)
{
    if (boss)
    {
        if (global.flag[flag] == 1)
        {
            global.flag[flag] = 1.5;
            msgsetloc(0, "* I'm overjoyed. I always wanted another Son to be my brother or sister./%", "obj_teevie_spring_slash_Step_0_gml_391_0");
        }
        if (global.flag[flag] == 2)
        {
            global.flag[flag] = 3;
            msgsetloc(0, "* I see. They want another brother or sister./", "obj_teevie_spring_slash_Step_0_gml_396_0");
            msgnextloc("* Then^1, I will change my name to Goulden Son 3./%", "obj_teevie_spring_slash_Step_0_gml_397_0");
        }
        d_make();
        con = 11;
    }
    if (!boss)
    {
        if (global.flag[flag] < 3)
        {
            if (global.flag[flag] == 1 || global.flag[flag] == 1.5)
                global.flag[flag] = 2;
            msgsetloc(0, "* No^1, no. I already knew that there was Goulden Son 1./", "obj_teevie_spring_slash_Step_0_gml_410_0");
            msgnextloc("* That's why I'm Goulden Son 2. Of course there must be a first one./", "obj_teevie_spring_slash_Step_0_gml_411_0");
            msgnextloc("* However^1, I always wanted another Son as a second brother or sister./", "obj_teevie_spring_slash_Step_0_gml_412_0");
            msgnextloc("* You know. It's hard being the only sibling with a number in their name./%", "obj_teevie_spring_slash_Step_0_gml_413_0");
        }
        if (global.flag[flag] == 3)
        {
            msgsetloc(0, "* What? The first Goulden Son became Goulden Son 3? What the.../", "obj_teevie_spring_slash_Step_0_gml_417_0");
            msgnextloc("* That's just perfect. I'm overjoyed./%", "obj_teevie_spring_slash_Step_0_gml_418_0");
            global.flag[flag] = 4;
        }
        d_make();
        con = 11;
    }
}
if (con == 11 && !d_ex())
{
    con = 0;
    global.interact = 0;
}
