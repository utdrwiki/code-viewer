var ___CX = camerax();
var ___CY = cameray();
if (!init)
{
    with (obj_genmarker)
    {
        if (string_pos("prop", extflag) != 0)
        {
            with (instance_create(x, y, obj_dw_church_prophecy))
            {
                extflag = "heroes2";
                active = 1;
                bonus = other.extflag;
                fade_edges = true;
                destroykind = 3;
            }
        }
    }
    scr_populatechars();
    init = true;
    if (con == 40)
    {
        with (obj_dw_church_magicalglass_breakable)
            instance_destroy();
        econ = 1;
        if (global.flag[encounterflag] == 1)
        {
            econ = 2;
            safe_delete(mynpc);
        }
    }
}
if (econ == 1)
{
    if (point_distance(obj_mainchara.x, obj_mainchara.y, mynpc.x, mynpc.y) < 180)
    {
        econ = 2;
        mynpc.visible = false;
        enemy = instance_create(mynpc.x, mynpc.y, obj_dw_church_organikchaser);
        enemy.encounterflag = encounterflag;
        enemy.encounterno = encounterno;
    }
}
if (scr_debug())
{
    if (keyboard_check(ord("W")) || global.tempflag[90] == 4 || global.tempflag[90] == 3)
    {
        if (keyboard_check_pressed(ord("1")) || global.tempflag[90] == 3)
        {
            global.tempflag[90] = 0;
            scr_setparty(0);
            var pos = scr_heromarker("kris", "debugwarp");
            instance_create(pos[0] + 20, pos[1] + 20, obj_climb_kris);
            pos = scr_heromarker("susie", "debugwarp");
            with (instance_create(pos[0] - 8, pos[1] - 32, obj_climb_susie))
                scr_size(2, 2);
            con = 30;
            cutscene = 7;
            monologuecon = -1;
            snd_free_all();
            global.currentsong[0] = snd_init("ch4_battle.ogg");
            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
            audio_sound_set_track_position(global.currentsong[1], 32);
            if (!instance_exists(obj_dw_chaseenemy_cloud))
                enemycloud = instance_create(2800, 4500, obj_dw_chaseenemy_cloud);
            with (enemycloud)
            {
                miny = 2360;
                active = 1;
                minspeed = -2;
                maxspeed = -15.5;
                minx = 0;
                miny = 2360;
                setxy(6640, 4500);
            }
        }
        if (keyboard_check_pressed(ord("2")) || global.tempflag[90] == 4)
        {
            global.tempflag[90] = 0;
            scr_setparty(0);
            var pos = scr_heromarker("kris", "top");
            setxy(pos[0], pos[1], 1049);
            pos = scr_heromarker("susie", "top");
            sujumpoff = scr_marker_ext(pos[0], pos[1], spr_susie_walk_left_dw, 2, 2, undefined, undefined, undefined, undefined, 1);
            con = 32;
            suendcon = 1.5;
            scr_delay_var("suendcon", 2, 4);
            cutscene = 7;
            monologuecon = -1;
            with (obj_dw_church_prophecy)
                instance_destroy();
            snd_free_all();
            global.currentsong[0] = snd_init("ch4_battle.ogg");
            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
            audio_sound_set_track_position(global.currentsong[1], 41);
            if (!instance_exists(obj_dw_chaseenemy_cloud))
                enemycloud = instance_create(2800, 4500, obj_dw_chaseenemy_cloud);
            with (enemycloud)
            {
                con = 0;
                element = 0;
                active = 1;
                minx = 0;
                miny = 2360;
                last_jumped_x = 999999;
                minspeed = -2;
                target = 0;
                tolerance = 32;
                destroyoffscreen = 0;
                damage = 30;
                hcount = 22;
                vcount = 7;
                maxspeed = -15.5;
                image_alpha = 1;
                image_angle = 0;
                image_blend = c_white;
                image_index = 2753;
                image_speed = 1;
                image_xscale = 1;
                image_yscale = 1;
                visible = 1;
                solid = 0;
                persistent = 0;
                depth = 30095;
                direction = 90;
                friction = 0;
                gravity = 0;
                gravity_direction = 270;
                hspeed = 0;
                vspeed = -5.73;
                speed = 5.73;
                x = 5400;
                y = 2394.42;
            }
        }
    }
}
if (cutscene == 1)
{
    scr_delay_var("cutscene", 2, 1);
    cutscene = -1;
}
if (cutscene == 2)
{
    cutscene = 3;
    global.interact = 1;
    var krpos1 = scr_heromarker("kris", "landed");
    var supos1 = scr_heromarker("susie", "landed");
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    var cam1 = scr_heromarker(undefined, "camstart");
    var cam2 = scr_heromarker(undefined, "camstart2");
    var camdist = scr_returnwait_instance(cam1[2], cam2[2], 2);
    c_wait(1);
    c_sel(kr);
    c_autowalk(0);
    c_setxy(krpos1[0] - 8, krpos1[1] - 4);
    c_sprite(spr_kris_dw_landed);
    c_sel(su);
    c_autowalk(0);
    c_setxy(supos1[0] - 10, supos1[1]);
    c_sprite(spr_susie_dw_landed);
    c_pannable(1);
    c_pan(cam1[0], cam1[1], 1);
    c_wait(15);
    c_wait(1);
    c_pan(cam2[0], cam2[1], camdist);
    c_wait(15);
    c_sel(su);
    c_imageindex(1);
    c_wait(2);
    c_sel(kr);
    c_imageindex(1);
    c_wait(4);
    c_sel(su);
    c_setxy(supos1[0], supos1[1]);
    c_sprite(spr_susie_walk_down_dw_unhappy);
    c_imageindex(0);
    c_wait(4);
    c_sel(kr);
    c_setxy(krpos1[0], krpos1[1]);
    c_sprite(spr_krisd_dark);
    c_imageindex(0);
    c_wait(25);
    c_sel(su);
    c_sprite(spr_susie_walk_right_dw_unhappy);
    c_wait(12);
    c_sel(su);
    c_sprite(spr_susie_walk_left_dw_unhappy);
    c_wait(13);
    c_sel(kr);
    c_facing("l");
    c_wait(12);
    c_sel(su);
    c_sprite(spr_susie_walk_up_dw);
    c_speaker("susie");
    c_msgsetloc(0, "\\ED* ...It's a long way back up.../%", "obj_dw_churchb_darkclimb_slash_Step_0_gml_245_0");
    c_talk_wait();
    c_customfunc(function()
    {
        with (obj_savepoint)
            scr_lerpvar("image_alpha", 0, 1, 12);
    });
    c_panobj(kr_actor, 12);
    c_wait(13);
    c_sel(su);
    c_facing("r");
    c_sel(kr);
    c_facing("d");
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_customfunc(function()
    {
        global.interact = 0;
        cutscene = 0;
        scr_caterpillar_interpolate("susie");
        scr_tempsave();
    });
    c_terminatekillactors();
}
if (cutscene == 0)
{
    if (scr_trigcheck("cutbegin"))
    {
        cutscene = 4;
        global.interact = 1;
    }
}
if (cutscene == 4)
{
    cutscene = -1;
    scr_cutscene_make();
    scr_maincharacters_actors();
    c_customfunc(function()
    {
        with (obj_savepoint)
        {
            scr_lerpvar("image_alpha", 1, 0, 12, 2, "out");
            scr_doom(id, 12);
        }
    });
    var krpos1 = scr_heromarker("kr", "cut2walkto");
    var supos1 = scr_heromarker("su", "cut2walkto");
    var krpos2 = scr_heromarker("kr", "cut2backup");
    var supos2 = scr_heromarker("su", "cut2backup");
    var krdist1 = scr_returnwait_instance(kr_actor, krpos1[2], 4);
    var sudist1 = scr_returnwait_instance(su_actor, supos1[2], 4);
    var krdist2 = scr_returnwait_instance(krpos1[2], krpos2[2], 6);
    var sudist2 = scr_returnwait_instance(supos1[2], supos2[2], 6);
    var campos1 = scr_genmarker("cut2cam1");
    var camdist = scr_returnwait(___CX, ___CY, campos1.x, campos1.y, 4);
    var wait1 = max(krdist1, sudist1, camdist);
    c_pannable(1);
    c_pan(campos1.x, campos1.y, wait1);
    c_sel(kr);
    c_walkdirect(krpos1[0], krpos1[1], wait1);
    c_sel(su);
    c_walkdirect(supos1[0], supos1[1], wait1);
    c_wait(wait1);
    c_wait(15);
    c_customfunc(function()
    {
        scr_shakescreen();
        shakecon = 1;
        var snd = snd_play(snd_rumble);
        scr_script_delayed(snd_volume, 6, snd, 0, 8);
    });
    c_sel(su);
    c_sprite(spr_susie_walk_down_dw_unhappy);
    c_sel(kr);
    c_facing("d");
    c_wait(6);
    c_customfunc(function()
    {
        shakecon = 0;
        siner = 0;
        scr_lerpvar("shaketilex", shaketilex, 0, 3);
        scr_lerpvar("shaketiley", shaketiley, 0, 3);
    });
    c_wait(3);
    c_speaker("susie");
    c_msgsetloc(0, "\\EE* .../%", "obj_dw_churchb_darkclimb_slash_Step_0_gml_350_0");
    c_talk_wait();
    c_wait(15);
    c_customfunc(function()
    {
        scr_shakescreen();
        shakecon = 1;
        rumblesnd = snd_loop(snd_rumble);
    });
    c_wait(3);
    c_sel(su);
    c_lerpvar_instance(su_actor, "x", supos1[0], supos2[0], 4, 2, "out");
    c_lerpvar_instance(su_actor, "y", supos1[1], supos2[1], 4, 2, "out");
    c_sprite(spr_susie_dw_landed);
    c_imageindex(1);
    c_delaycmd(3, "imageindex", 0);
    c_sel(kr);
    c_lerpvar_instance(kr_actor, "x", krpos1[0], krpos2[0], 4, 2, "out");
    c_lerpvar_instance(kr_actor, "y", krpos1[1], krpos2[1], 4, 2, "out");
    c_sprite(spr_kris_dw_landed);
    c_imageindex(0);
    c_delaycmd(3, "imageindex", 1);
    c_wait(12);
    c_customfunc(function()
    {
        scr_shakescreen(0);
        shakecon = 2;
        snd_volume(rumblesnd, 0, 12);
        snd_play(snd_locker);
        scr_script_delayed(snd_stop, 30, 380);
    });
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EZ* The floor.../", "obj_dw_churchb_darkclimb_slash_Step_0_gml_404_0");
    c_msgnextloc("\\EZ* ..^1. is..^1. is something down there...?/%", "obj_dw_churchb_darkclimb_slash_Step_0_gml_405_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_imageindex(0);
    c_addxy(4, 0);
    c_sprite(spr_susie_walk_down_dw_unhappy);
    c_wait_talk();
    c_wait(8);
    c_customfunc(function()
    {
        var pos = scr_heromarker(undefined, "enemycloud");
        var pos2 = scr_genmarker("cut2cam1");
        var snd = snd_play(snd_rumble);
        scr_script_delayed(snd_volume, 30, snd, 0, 8);
        enemycloud = instance_create(pos[0], pos2.y + 480, obj_dw_chaseenemy_cloud);
        with (enemycloud)
            scr_lerpvar("y", y, pos2.y + 400, 30, 2, "out");
        scr_shakescreen(8, 12);
    });
    c_wait(12);
    c_sel(su);
    c_sprite(spr_susie_shock);
    c_shakeobj();
    c_sndplay(snd_wing);
    c_wait(8);
    c_speaker("susie");
    c_msgsetloc(0, "\\EZ* Guess that answers that!/%", "obj_dw_churchb_darkclimb_slash_Step_0_gml_443_0");
    c_talk_wait();
    var krpos = scr_heromarker("kr", "bot");
    var supos = scr_heromarker("su", "bot");
    c_sel(kr);
    c_autofacing(1);
    c_autowalk(1);
    c_walkdirect(krpos[0], krpos[1], 6);
    c_sel(su);
    c_autofacing(1);
    c_autowalk(1);
    c_walkdirect(supos[0], supos[1], 6);
    c_sel(su);
    c_wait(6);
    c_customfunc(function()
    {
        with (obj_dw_chaseenemy_cloud)
        {
            miny = 3040;
            minspeed = -0.3;
            maxspeed = -1.4;
        }
        cutscene = 5;
        scr_setparty(0);
    });
    c_actortokris();
    c_terminatekillactors();
}
if (cutscene == 5)
{
    with (obj_climbstartertrig)
    {
        if (exitmarkerflag == "bot")
        {
            global.interact = 1;
            myinteract = 3;
        }
    }
    var jumptime = 8;
    cutscene = -1;
    scr_delay_var("cutscene", 6, jumptime);
    var supos = scr_heromarker("su", "bot");
    fakesu = scr_marker_ext(supos[0], supos[1], spr_susie_walk_up_dw, 2, 2, 0, 0, undefined, undefined, 1);
    with (fakesu)
    {
        x -= 2;
        y += 20;
        sprite_index = spr_susie_dw_jump_ball;
        image_speed = 0.25;
        var pos2 = scr_genmarker("suclimbstart");
        snd_play(snd_jump);
        scr_jump_to_point(pos2.x, pos2.y, 8, jumptime, 1);
    }
}
if (cutscene == 6)
{
    global.currentsong[0] = snd_init("ch4_battle.ogg");
    global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
    var pos2 = scr_genmarker("suclimbstart");
    var climbsusie = instance_create(pos2.x - 8, pos2.y - 32, obj_climb_susie);
    scr_size(2, 2, climbsusie);
    safe_delete(fakesu);
    cutscene = 7;
}
if (con == 20)
{
    timer += 1;
    if ((timer % 40) == 0)
    {
        with (obj_climb_susie)
            scr_shakeobj();
    }
    var allKilled = true;
    with (obj_trigger)
    {
        if (extflag == "dontharasssusie")
        {
            if (i_ex(instance_place(x, y, obj_climb_setpathenemy)))
                allKilled = false;
        }
    }
    if (allKilled)
    {
        with (obj_climb_susie)
            waiteventid = 0;
        monologuecon = 2;
        con = 21;
        event_user(10);
    }
}
if (con == 21)
{
    if (obj_climb_kris.y <= 2840)
    {
        con = 22;
        obj_climb_kris.fall_speed_cap = 99;
        snd_play(snd_heavyswing);
        scr_shakescreen(6, 0);
        with (instance_create(4820, 2680, obj_animation))
        {
            depth = 1000;
            sprite_index = spr_ch2_gimmick_explosion;
        }
        with (instance_create(4800, 2680, obj_climb_watergenerator))
        {
            image_xscale = 2;
            image_yscale = 2;
            timer = 10;
        }
        with (instance_create(4760, 3860, obj_climb_susie))
        {
            image_xscale = 2;
            image_yscale = 2;
        }
        with (obj_dw_chaseenemy_cloud)
        {
            miny = 4500;
            minspeed = 0;
            maxspeed = 0;
        }
    }
}
if (con == 22)
{
    if (obj_climb_kris.y <= 2520)
    {
        con = 23;
        timer = 0;
    }
}
if (con == 23)
{
    timer += 1;
    if (timer == 26)
    {
        snd_play(snd_heavyswing);
        scr_shakescreen(6, 0);
        with (instance_create(4820, 2320, obj_animation))
        {
            depth = 1000;
            sprite_index = spr_ch2_gimmick_explosion;
        }
        with (instance_create(4800, 2320, obj_climb_watergenerator))
        {
            image_xscale = 2;
            image_yscale = 2;
            timer = 40;
        }
        con = 24;
    }
}
with (obj_climb_setpathenemy)
    damage = 38;
if (con > 21 && con <= 30)
{
    if (obj_climb_kris.x <= 4240 && obj_climb_kris.y <= 3500)
    {
        with (obj_dw_chaseenemy_cloud)
        {
            y = ___CY + 480 + 120;
            miny = 2360;
            minspeed = -2;
            maxspeed = -15.5;
        }
        con = 31;
    }
}
if (suendcon == 0)
{
    var suend = -4;
    with (obj_trigger)
    {
        if (extflag == "suclimbend")
            suend = id;
    }
    with (obj_climb_susie)
    {
        if ((other.con == 31 || other.con == 32) && i_ex(obj_climb_kris))
        {
            if (y < (obj_climb_kris.y + 50))
                climbspeedmultiplier = 1;
            else if (y > (obj_climb_kris.y + 100))
                climbspeedmultiplier = lerp(climbspeedmultiplier, 1.6, 0.125);
        }
        if (place_meeting(x, y, suend))
        {
            other.sujumpoff = scr_marker_ext(scr_even(x) + 6, scr_even(y), spr_susie_dw_fall_ball, 2, 2, 0.25, 0, undefined, undefined, 1);
            other.suendcon = 1;
            instance_destroy();
        }
    }
}
if (suendcon == 1)
{
    var jumptime = 12;
    with (sujumpoff)
    {
        snd_play(snd_jump);
        snd_play_delay(snd_noise, jumptime);
        var pos = scr_heromarker("susie", "top");
        scr_jump_to_point(pos[0], pos[1], 12, jumptime, true);
        scr_delay_var("sprite_index", 422, jumptime + 1);
        scr_delay_var("image_index", 0, jumptime + 1);
        scr_delay_var("image_speed", 0, jumptime + 1);
    }
    suendcon = -1;
    scr_delay_var("suendcon", 2, jumptime + 4);
}
if (con == 31)
{
    with (obj_trigger)
    {
        if (extflag == "krclimb_pointofnoreturn")
        {
            if (place_meeting(x, y, obj_climb_kris))
            {
                with (obj_climb_kris)
                    forceclimb = true;
                other.con = 32;
            }
        }
    }
}
if (con == 32)
{
    if (!i_ex(obj_climb_kris))
    {
        global.interact = 1;
        obj_mainchara.freeze = true;
    }
}
if (con == 32 && suendcon == 2 && !i_ex(obj_climb_kris))
    con = 33;
if (con == 33)
{
    con = 33.1;
    with (obj_darkcontroller)
        charcon = 0;
    scr_cutscene_make();
    scr_maincharacters_actors();
    actor_count++;
    su = 1;
    su_actor = instance_create(sujumpoff.x, sujumpoff.y, obj_actor);
    scr_actor_setup(su, su_actor, "susie");
    su_actor.sprite_index = sujumpoff.sprite_index;
    scr_depth(su_actor);
    sujumpoff.visible = 0;
    var runspeed = 10;
    var krpos1 = scr_heromarker("kris", "top");
    var krpos2 = scr_heromarker("kris", "krrunto");
    var krdist = scr_returnwait_instance(krpos1[2], krpos2[2], runspeed);
    var supos1 = scr_heromarker("susie", "top");
    var supos2 = scr_heromarker("susie", "surunto");
    var camloc = ___CX;
    var camloc2 = scr_genmarker("runawaycam").x;
    c_pannable(1);
    c_pan(camloc2, ___CY, krdist);
    c_sel(kr);
    c_autowalk(0);
    c_imagespeed(0.25);
    c_sprite(spr_kris_sword_run);
    c_flip("x");
    c_sel(su);
    c_autowalk(0);
    c_imagespeed(0.25);
    c_sprite(spr_susie_run_serious_left);
    c_customfunc(function()
    {
        var runspeed = 10;
        var krpos1 = scr_heromarker("kris", "top");
        var krpos2 = scr_heromarker("kris", "krrunto");
        var krdist = scr_returnwait_instance(krpos1[2], krpos2[2], runspeed);
        var supos1 = scr_heromarker("susie", "top");
        var supos2 = scr_heromarker("susie", "surunto");
        kr_actor.hspeed = -runspeed;
        with (kr_actor)
            scr_delay_var("friction", 0.35, krdist - 15);
        su_actor.hspeed = -runspeed;
        with (su_actor)
        {
            scr_delay_var("friction", 0.5, krdist - 10);
            scr_delay_var("sprite_index", 71, krdist - 5);
            scr_delay_var("image_speed", 0, krdist - 5);
            scr_delay_var("image_index", 0, krdist - 5);
            scr_delay_var("image_index", 1, krdist - 3);
            snd_play_delay(snd_wing, krdist - 5, 0.7, 1);
        }
    });
    c_customfunc(function()
    {
        breakglass = true;
        with (enemycloud)
        {
            con = 1;
            minx = 274;
            scr_delay_var("gravity", 0.2, 70);
            scr_delay_var("con", 0, 100);
        }
    });
    c_wait(krdist - 30);
    c_customfunc(function()
    {
        snd_volume(global.currentsong[1], 0, 30);
    });
    c_wait(20);
    c_sel(su);
    c_wait(10);
    c_sel(kr);
    c_flip("x");
    c_autowalk(1);
    c_facing("l");
    c_wait(15);
    c_customfunc(function()
    {
        kr_actor.hspeed = 0;
        kr_actor.friction = 0;
        su_actor.hspeed = 0;
        su_actor.friction = 0;
    });
    c_wait(12);
    c_sel(kr);
    c_facing("r");
    c_speaker("susie");
    c_msgsetloc(0, "\\El* Damn^1, that was close.../%", "obj_dw_churchb_darkclimb_slash_Step_0_gml_832_0");
    c_talk_wait();
    c_sel(su);
    c_flip("x");
    c_sprite(spr_susie_kneel_reach);
    c_imageindex(1);
    c_wait(3);
    c_sel(su);
    c_flip("x");
    c_imageindex(0);
    c_facing("l");
    c_wait(15);
    c_sel(su);
    c_facing("l");
    c_speaker("susie");
    c_msgsetloc(0, "\\E6* Hey.../", "obj_dw_churchb_darkclimb_slash_Step_0_gml_850_0");
    c_msgnextloc("\\E7* Hey^1, Kris^1, I think I see it...!/%", "obj_dw_churchb_darkclimb_slash_Step_0_gml_851_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_autowalk(1);
    c_walk("l", 6, 6);
    c_wait(6);
    c_wait_talk();
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_run_excited_left);
    c_imagespeed(1/3);
    c_var_instance(su_actor, "image_speed", 1/3);
    c_walk("l", 10, 80);
    c_sel(kr);
    c_delayfacing(15, "l");
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* C'mon!/%", "obj_dw_churchb_darkclimb_slash_Step_0_gml_869_0");
    c_talk();
    c_wait(20);
    c_wait_talk();
    c_panobj(kr_actor, 30);
    c_wait(40);
    c_sel(kr);
    c_facing("d");
    c_customfunc(function()
    {
        global.facing = 0;
    });
    c_wait(1);
    c_pannable(0);
    c_actortokris();
    c_terminatekillactors();
}
if (con == 33.1)
{
    if (!instance_exists(obj_cutscene_master))
    {
        con = 34;
        global.interact = 0;
        obj_mainchara.freeze = false;
        global.plot = 239;
    }
}
if (i_ex(monologue_writer))
{
    monologue_writer.writingx = ___CX + 80;
    if (write_top)
        monologue_writer.writingy = ___CY + 20;
    else
        monologue_writer.writingy = ___CY + 340;
}
if (i_ex(obj_climb_kris))
{
    var trig = "";
    with (obj_trigger)
    {
        if (string_pos("destroyprop", extflag) != 0)
        {
            if (place_meeting(x, y, obj_climb_kris))
            {
                trig = string_copy(extflag, 8, 99);
                instance_destroy();
            }
        }
    }
    if (trig != "")
    {
        with (obj_dw_church_prophecy)
        {
            if (bonus == trig)
                destroy = 1;
        }
    }
}
if (shakecon)
{
    if (shakecon == 2)
        siner2++;
    siner++;
    if (shakecon != 2)
        shaketilex = sin(siner / 1) * 4;
    else
        shaketilex = lerp(shaketilex, 0, 0.5);
    shaketiley = (cos(siner / 0.5) * 2) + ((siner2 * (siner2 + 1)) / 2);
}
layer_x("TILES_SHAKE", scr_even(shaketilex));
layer_y("TILES_SHAKE", scr_even(shaketiley));
if (monocon == 0)
{
    if (i_ex(monologue_writer))
    {
        monocon = 1;
        monotime = 0;
    }
}
if (monocon == 1)
{
    if (i_ex(monologue_writer))
    {
        if (monologue_writer.halt > 0)
        {
            monotime++;
            var max_timer = (global.lang == "ja") ? 100 : 70;
            if (monotime >= max_timer)
            {
                with (obj_writer)
                    forcebutton1 = 1;
                monotime = 0;
                monocon = 0;
            }
        }
    }
}
if (global.interact == 0)
{
    with (obj_trigger)
    {
        if (extflag == "nomenu")
        {
            if (place_meeting(x, y, obj_climb_kris))
            {
                with (obj_darkcontroller)
                    charcon = 0;
            }
        }
    }
}
if (breakglass)
{
    var cx = ___CX;
    var startpos = array_get(scr_heromarker("susie", "top"), 0);
    var act = -4;
    with (obj_actor)
    {
        if (act == -4 || x > act.x)
            act = id;
    }
    with (obj_dw_church_magicalglass_breakable)
    {
        if (!variable_instance_exists(id, "DEATHCHECK"))
            DEATHCHECK = false;
        if (!DEATHCHECK)
        {
            if (x > (cx + 640 + 20))
                instance_destroy();
            else
                DEATHCHECK = true;
        }
        if (x > (act.x + 40))
        {
            destroy = 1;
            delay = 2;
            if (x > startpos)
                nosound = true;
        }
    }
}
