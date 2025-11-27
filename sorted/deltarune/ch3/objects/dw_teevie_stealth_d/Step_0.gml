scr_gameshow_populatevars();
if (make != "zapper")
    make = "false";
with (obj_trigger)
{
    if (place_meeting(x, y, obj_mainchara))
    {
        other.make = extflag;
        instance_destroy();
    }
}
if (make != "false" && global.flag[1230] != 2)
{
    var newfollow = false;
    if (i_ex(obj_caterpillar_generic))
        newfollow = true;
    modx = 0;
    if (make == "zapper")
        modx = -20;
    var newchar = instance_create(obj_mainchara.x + modx, obj_mainchara.y, obj_caterpillar_generic);
    with (newchar)
    {
        scr_darksize();
        name = other.make;
        flip = true;
        daddy = other.ra_real;
        targetdist = 12;
        interpolate = true;
        visible = false;
    }
    if (newfollow)
        newchar.daddy = instance_find(obj_caterpillar_generic, instance_number(obj_caterpillar_generic) - 2);
    var newcharnum = instance_number(obj_caterpillar_generic) - 1;
    if (newcharnum == 0)
    {
        with (newchar)
        {
            sprite_index = spr_pippins_sneak;
            halign = -14;
            valign = 4;
        }
    }
    if (newcharnum == 1)
    {
        with (newchar)
        {
            sprite_index = spr_shadowman_sneak;
            valign = 24;
            halign = -14;
        }
    }
    if (newcharnum == 2)
    {
        with (newchar)
        {
            sprite_index = spr_shadowman_sneak_shh;
            valign = 12;
            halign = 6;
        }
    }
    if (newcharnum == 3)
    {
        with (newchar)
        {
            sprite_index = spr_pippins_sneak;
            halign = 8;
            valign = -36;
        }
    }
    if (make == "zapper")
    {
        with (newchar)
        {
            sprite_index = spr_npc_zapper_sneak;
            halign = -14;
            valign = 58;
        }
        make = "done";
    }
}
if (caught == 0)
{
    if (nobacksies == 0 && camerax() >= 4682)
    {
        nobacksies = 1;
        if (scr_ch3_violencecheck() < 5)
        {
            with (obj_dw__backstagelight)
            {
                if (extflag == "replacementlight")
                    instance_destroy();
            }
            var splight = instance_create(4520, 160, obj_dw__backstagelight);
            with (splight)
            {
                type = 1;
                drawlamp = false;
                image_blend = #FFCB3E;
                movetype = 1;
                mt1off -= 32;
                movespeed = 120;
                rate = 20 - (((y - 320) / 240) * 2);
                wally = 320;
                special = 1;
                rate = 2;
                movespeed = 0;
            }
        }
    }
    var cont = 0;
    with (obj_b3bs_stealth)
    {
        if (alert)
            cont = 1;
    }
    if (cont == 1)
    {
        caughttimer = 0;
        caught = 1;
    }
}
if (caught == 1)
{
    caughttimer++;
    if (caughttimer == 1)
    {
        snd_play(snd_jump);
        zapper = scr_marker_ext(obj_mainchara.x + 80, -120, spr_zapper_jump_noshadow, 2, 2, 0, 4);
        zapper.gravity = 1;
        zapper.depth = obj_mainchara.depth;
        scr_limitval_upper(zapper, "y", obj_mainchara.bbox_bottom - 137);
    }
    if (caughttimer > 1)
    {
        if (zapper.y >= (obj_mainchara.bbox_bottom - 137))
        {
            with (obj_b3bs_stealth)
                dir = 0;
            with (zapper)
            {
                snd_play(snd_wing);
                image_index = 6;
                scr_delay_var("image_index", 7, 3);
                scr_delay_var("image_index", 8, 6);
            }
            caught = 2;
            zapper.gravity = 0;
            zapper.vspeed = 0;
            with (obj_limit_val)
                instance_destroy();
            caughttimer = 0;
        }
    }
}
if (caught == 2)
{
    caughttimer++;
    if (caughttimer == 20)
    {
        zapper.sprite_index = spr_npc_zapper_talk;
        zapper.image_index = 0;
        zapper.x += 6;
        zapper.y -= 14;
        with (zapper)
            scr_animate(0, 13, 0.25);
        caughttimer = 0;
        special = obj_b3bs_stealth.special;
        if (!special)
        {
            global.flag[1229]++;
            scr_speaker("no_name");
            msgsetloc(0, "* Hey^1! None of youse is supposed to be back here!!/%", "obj_dw_teevie_stealth_d_slash_Step_0_gml_181_0");
            caught = 3;
        }
        if (special)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* HEY^1! None of youse is supposed to be here!/%", "obj_dw_teevie_stealth_d_slash_Step_0_gml_187_0");
            caught = 11;
            timer = 0;
        }
        d_make();
    }
}
if (caught == 3 && !d_ex())
{
    caughttimer++;
    if (caughttimer == 5)
    {
        change = instance_create(x, y, obj_tvturnoff_manager);
        change.kind = 1;
        global.entrance = 10;
        change.roomtarg = room;
    }
}
if (caught == 11 && !d_ex())
{
    timer++;
    if (timer == 1)
    {
        with (obj_animator)
            instance_destroy();
    }
    if (timer == 60)
    {
        msgsetloc(0, "* I don't wanna be here either!/", "obj_dw_teevie_stealth_d_slash_Step_0_gml_216_0");
        msgnextloc("* ...is it okay if I come with youse?/%", "obj_dw_teevie_stealth_d_slash_Step_0_gml_217_0");
        d_make();
        caught = 12;
        timer = 0;
        zapper.image_index = 0;
        zapper.sprite_index = spr_zapper_spare;
        zapper.x += 10;
        zapper.y += 20;
    }
}
if (caught == 12)
{
    if (scr_getmsgno_d() == 1)
    {
        caught = 14;
        zapper.image_index = 1;
    }
}
if (caught == 14 && !d_ex())
{
    var _time = 20;
    caughttimer++;
    if (caughttimer == 1)
    {
        with (zapper)
        {
            image_speed = 0;
            image_index = 0;
            x -= 16;
            y -= 6;
            sprite_index = spr_zapper_jump_noshadow;
            scr_delay_var("image_index", 2, 1);
            scr_delay_var("image_index", 5, _time - 6);
            scr_delay_var("image_index", 6, _time);
            scr_delay_var("image_index", 7, _time + 2);
            scr_delay_var("image_index", 8, _time + 4);
            scr_delay_var("sprite_index", 4121, round(_time / 2));
            scr_delay_var("depth", 96820, round(_time / 2));
            scr_jump_to_point(obj_mainchara.x - 88, y - 22, 40, _time, true);
            snd_play(snd_jump);
            snd_play_delay(snd_wing, _time);
        }
    }
    if (caughttimer == (2 + _time))
    {
        zapper.visible = false;
        global.interact = 0;
        make = "zapper";
        with (obj_dw__backstagelight)
        {
            scr_lerpvar("image_alpha", image_alpha, 0, 15);
            scr_doom(id, 16);
        }
        global.flag[1230] = 1;
        success = 0.5;
        caught = 100;
    }
}
if (noleft == 0)
{
    if (i_ex(obj_caterpillar_generic))
    {
        noleft = 1;
        with (obj_dw__backstagelight)
        {
            if (x == 480)
            {
                scr_lerpvar("timerrate", timerrate, 0, 15, 2, "out");
                scr_lerpvar("timer", timer, 0, 15, 2, "out");
            }
        }
    }
}
if (noleft == 1)
{
}
if (success == 0.5)
{
    if (obj_mainchara.x >= 5800 || obj_mainchara.x <= 460)
    {
        with (obj_caterpillar_generic)
            instance_destroy();
        success = 1;
        succtimer = 0;
        with (obj_b3bs_stealth)
        {
            for (var i = 0; i < 20; i++)
            {
                if (i_ex(catmarker[i]))
                {
                    with (catmarker[i])
                    {
                        var markerleave = scr_marker_ext(x, y, sprite_index, 2, 2, 0.25, image_index, undefined, depth, undefined, 240);
                        var ratemod = 1;
                        if (x < (room_width / 2))
                            ratemod = -1;
                        markerleave.image_xscale = 2 * ratemod;
                        markerleave.hspeed = 16 * ratemod;
                        markerleave.friction = -0.001;
                        instance_destroy();
                    }
                }
            }
        }
    }
}
if (i_ex(sontrig))
{
    if (sontrig.myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* I'm Goulden Son. I wish there was a Goulden Son 2./", "obj_dw_teevie_stealth_d_slash_Step_0_gml_344_0");
        msgnextloc("* I can't help you across right now^1, all the lights are in the way!/%", "obj_dw_teevie_stealth_d_slash_Step_0_gml_345_0");
        if (caught == 100)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Wow^1! You've got a lot of friends!/%", "obj_dw_teevie_stealth_d_slash_Step_0_gml_350_0");
        }
        d_make();
        sontrig.myinteract = 4;
    }
    if (sontrig.myinteract == 4 && !d_ex())
    {
        global.interact = 0;
        sontrig.myinteract = 0;
    }
}
