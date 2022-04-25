if (type == 0)
{
    if (con == 1)
    {
        x = (__view_get((0 << 0), 0) + 800)
        image_speed = 0.2
        sprite_index = spr_smallchecker_front_ch1
        global.interact = 1
        s = scr_dark_marker_ch1(-100, global.cinstance[1].y, spr_susier_dark_ch1)
        r = scr_dark_marker_ch1(-50, global.cinstance[0].y, spr_ralseir_ch1)
        k = scr_dark_marker_ch1(0, obj_mainchara_ch1.y, spr_krisr_dark_ch1)
        with (obj_caterpillarchara_ch1)
            visible = false
        with (obj_mainchara_ch1)
            visible = false
        with (obj_marker_ch1)
        {
            hspeed = 5
            image_speed = 0.2
        }
        l = scr_dark_marker_ch1(500, obj_mainchara_ch1.y, spr_lancer_rt_ch1)
        con = -50
        alarm[4] = 28
    }
    if (con == -49)
    {
        snd_free_all_ch1()
        with (obj_marker_ch1)
            scr_halt_ch1()
        con = -48
        alarm[4] = 15
    }
    if (con == -47)
    {
        global.typer = 32
        global.fc = 5
        global.fe = 0
        name = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_42_0")
        if (global.flag[214] == 1)
            name = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_43_0")
        if (global.flag[214] == 2)
            name = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_44_0")
        if (global.flag[214] == 3)
            name = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_45_0")
        global.msg[0] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_47_0")
        global.msg[1] = ((scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_48_0") + name) + "/")
        global.msg[2] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_49_0")
        scr_ralface_ch1(3, 3)
        global.msg[4] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_51_0")
        scr_lanface_ch1(5, 1)
        global.msg[6] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_53_0")
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
        con = -46
        warnpitch = 0
    }
    if (con == -46 && (!d_ex_ch1()))
    {
        hitnoise = snd_play_ch1(snd_orchhit_ch1)
        snd_pitch_ch1(hitnoise, (1 + (warnpitch / 16)))
        with (l)
        {
            sprite_index = spr_lancer_lt_ch1
            hspeed = -10
        }
        con = -45
        alarm[4] = 3
    }
    if (con == -44)
    {
        with (l)
            scr_halt_ch1()
        con = -43
        alarm[4] = 15
    }
    if (con == -42)
    {
        global.fe = 2
        global.msg[0] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_82_0")
        if (warnpitch == 1)
        {
            global.fe = 1
            global.msg[0] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_87_0")
        }
        if (warnpitch == 2)
        {
            global.fe = 3
            global.msg[0] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_92_0")
            scr_susface_ch1(1, 9)
            global.msg[2] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_94_0")
        }
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
        if (warnpitch < 2)
        {
            con = -46
            warnpitch += 1
        }
        else
            con = -40
    }
    if (con == -40 && (!d_ex_ch1()))
    {
        ltimer = 0
        with (obj_marker_ch1)
        {
            if (sprite_index != spr_lancer_lt_ch1)
            {
                hspeed = 5
                image_speed = 0.25
            }
            else
            {
                sprite_index = spr_lancer_dt_ch1
                vspeed = -2
                depth = 100000
            }
        }
        con = -10
        alarm[4] = 96
    }
    if (con == -10)
    {
        ltimer += 1
        if (ltimer >= 20)
        {
            with (l)
                scr_halt_ch1()
        }
        if (k.x >= 140)
            obj_mainchara_ch1.x = k.x
        global.interact = 1
    }
    if (con == -9)
    {
        snd_free_all_ch1()
        global.facing = 1
        con = -8
        with (obj_marker_ch1)
            scr_halt_ch1()
        obj_mainchara_ch1.x = k.x
        obj_mainchara_ch1.visible = true
        obj_mainchara_ch1.cutscene = true
        with (l)
            sprite_index = spr_lancer_rt_ch1
        with (k)
            instance_destroy()
        alarm[4] = 16
        scr_pan_ch1(5, 0, 16)
    }
    if (con == -7)
    {
        global.fc = 2
        global.fe = 8
        global.typer = 31
        global.msg[0] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_178_0")
        scr_susface_ch1(1, 6)
        global.msg[2] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_180_0")
        scr_lanface_ch1(3, 3)
        global.msg[4] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_182_0")
        scr_susface_ch1(5, 2)
        global.msg[6] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_184_0")
        scr_lanface_ch1(7, 6)
        global.msg[8] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_186_0")
        con = -5.2
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
    }
    if (con == -5.2 && d_ex_ch1() == 0)
    {
        sprite_index = spr_smallchecker_idle_ch1
        image_index = 0
        x += 40
        image_xscale = -2
        hspeed = 2
        con = 2
    }
    if (con == 2)
    {
        if (x > (__view_get((0 << 0), 0) + 520))
        {
            image_index = 0
            image_xscale = 2
            sprite_index = spr_smallchecker_front_ch1
            hspeed = 0
            x = (__view_get((0 << 0), 0) + 480)
            con = 1.1
            alarm[4] = 30
        }
    }
    if (con == 2.1)
    {
        snd_play_ch1(snd_boost_ch1)
        for (j = 0; j < 3; j += 1)
        {
            tile[j] = scr_marker_ch1(((480 - (j * 40)) + 400), (240 + (j * 40)), spr_checkertile_bullet_ch1)
            tile[j].image_alpha = 0
            tile[j].depth = 700000
        }
        ttimer = 0
        con = 2.2
    }
    if (con == 2.2)
    {
        for (j = 0; j < 3; j += 1)
            tile[j].image_alpha += 0.1
        ttimer += 1
        if (ttimer >= 10)
            con = 2.3
    }
    if (con == 2.3)
    {
        for (j = 0; j < 3; j += 1)
            tile[j].image_alpha -= 0.1
        ttimer += 1
        if (ttimer >= 30)
            con = 3.1
    }
    if (con == 3.1)
        con = 4
    if (con == 4)
    {
        sprite_index = spr_smallchecker_front_ch1
        image_speed = 0
        image_index = 0
        crown = instance_create_ch1((x + 8), (__view_get((1 << 0), 0) - 40), obj_marker_ch1)
        crown.image_xscale = 2
        crown.image_yscale = 2
        crown.sprite_index = spr_smallchecker_crown_ch1
        crown.vspeed = 4
        crown.depth = (depth - 1)
        con = 5
    }
    if (con == 5)
    {
        if (crown.y >= (y - 10))
        {
            sprite_index = spr_smallchecker_transform_ch1
            y += 2
            snd_play_ch1(snd_shineselect_ch1)
            with (crown)
                instance_destroy()
            con = 6
            alarm[4] = 50
        }
    }
    if (con == 7)
    {
        snd_play_ch1(snd_crowngrowth_ch1)
        image_speed = 0.25
        con = 8
    }
    if (con == 8)
    {
        image_speed += 0.01
        if (image_speed >= 0.4)
        {
            image_index = 1
            image_speed = 0
            con = 9
            alarm[4] = 60
        }
    }
    if (con == 10)
    {
        image_index = 0
        sprite_index = spr_smallchecker_transform2_ch1
        image_speed = 0.334
        con = 11
    }
    if (con == 11)
    {
        if (image_index >= 4)
        {
            image_index = 4
            image_speed = 0
            con = 12
            alarm[4] = 40
        }
    }
    if (con == 13)
    {
        x -= 18
        y -= 90
        snd_play_ch1(snd_impact_ch1)
        with (s)
            sprite_index = spr_susie_shock_r_ch1
        with (r)
            sprite_index = spr_ralsei_shock_overworld_ch1
        instance_create_ch1(0, 0, obj_shake_ch1)
        sprite_index = spr_checkers_idle_ch1
        image_speed = 0
        image_index = 0
        con = 16
        alarm[4] = 30
    }
    if (con == 17)
    {
        with (r)
            sprite_index = spr_ralseir_ch1
        with (s)
            sprite_index = spr_susier_dark_ch1
        global.fe = 6
        global.msg[0] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_356_0")
        con = 18
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
    }
    if (con == 18 && (!d_ex_ch1()))
    {
        scr_unmarkify_caterpillar_ch1()
        global.facing = 1
        scr_caterpillar_facing_ch1(global.facing)
        global.encounterno = 12
        scr_encountersetup_ch1(global.encounterno)
        global.flag[9] = 1
        global.batmusic[0] = snd_init_ch1("checkers.ogg")
        global.specialbattle = 3
        instance_create_ch1(0, 0, obj_encounterbasic_ch1)
        instance_create_ch1(0, 0, obj_battleback_ch1)
        depth = 4000
        scr_move_to_point_over_time_ch1(global.monstermakex[0], global.monstermakey[0], 20)
        con = 19
        alarm[4] = 20
    }
    if (con == 20)
    {
        speed = 0
        con = 21
        alarm[4] = 10
    }
    if (con == 22)
    {
        visible = false
        type = 2
        con = 0
        victimer = 0
    }
}
if (type == 1)
{
    if (con == 1)
    {
        image_speed = 0
        image_index = 0
        crown = instance_create_ch1((x + 24), (y + 10), obj_marker_ch1)
        crown.image_xscale = 2
        crown.image_yscale = 2
        crown.sprite_index = spr_smallchecker_crown_ch1
        crown.depth = (depth - 1)
        sprite_index = spr_smallchecker_transform3_ch1
        con = 0.4
        windsound = false
        alarm[4] = 30
    }
    if (con == 1.4)
    {
        if (windsound == false)
        {
            snd_play_ch1(snd_whistlebreath_ch1)
            windsound = true
        }
        if (secondtime == false)
            crown.hspeed += 0.2
        else
            crown.hspeed += 0.4
        if (crown.hspeed >= 3)
            con = 1.5
    }
    if (con == 1.5)
    {
        with (crown)
        {
            maxy = (obj_checker_animtest_ch1.y + obj_checker_animtest_ch1.sprite_height)
            image_angle = -45
            y -= 10
            gravity = 0.5
            hspeed = 5
            friction = 0.2
        }
        con = 1.6
    }
    if (con == 1.6)
    {
        if (crown.y >= ((crown.maxy - crown.sprite_height) - 10))
        {
            crown.y += 10
            crown.image_angle = 0
            crown.gravity = 0
            crown.vspeed = 0
            crown.friction = 0
            crown.hspeed = 1
            con = 0.9
            alarm[4] = 30
            if (secondtime == true)
            {
                alarm[4] = 10
                interactcrown = instance_create_ch1(crown.x, crown.y, obj_readable_room1_ch1)
                interactcrown.hspeed = 1
                interactcrown.image_xscale = 1.6
                interactcrown.image_yscale = 1
            }
        }
    }
    if (con == 1.9)
    {
        image_speed = 0.25
        snd_play_ch1(snd_crownshrink_ch1)
        con = 2.1
    }
    if (con == 2.1)
    {
        image_speed += 0.01
        if (secondtime == true)
            image_speed += 0.01
        if (image_speed >= 0.4)
        {
            image_index = 1
            image_speed = 0
            con = 3
            maxy = ((y + sprite_height) - 30)
            alarm[4] = 30
            if (secondtime == true)
                alarm[4] = 10
        }
    }
    if (con == 4)
    {
        x += 40
        y += 46
        sprite_index = spr_smallchecker_legtuck_ch1
        image_index = 0
        image_speed = 0.25
        vspeed = -3
        gravity = 1
        if (secondtime == true)
        {
            vspeed = -6
            gravity = 2
            image_speed = 0.5
        }
        con = 5
    }
    if (con == 5)
    {
        if (image_index >= 2)
            image_speed = 0
        if (y >= (maxy - 4))
        {
            y = maxy
            gravity = 0
            vspeed = 0
            con = 6
            alarm[4] = 30
            if (secondtime == true)
                alarm[4] = 10
        }
    }
    if (con == 7)
    {
        image_angle -= 5
        hspeed = 3
        if (secondtime == true)
        {
            hspeed = 6
            image_angle -= 5
        }
        if (x >= (__view_get((0 << 0), 0) + 720))
        {
            con = 8
            global.monster[0] = false
            global.monster[1] = false
            global.monster[2] = false
            scr_attackphase_ch1()
            with (obj_monsterparent_ch1)
                instance_destroy()
            instance_destroy()
        }
    }
}
if (type == 2)
{
    if (con == 0)
    {
        victimer += 1
        if (victimer >= 60)
            con = 1
    }
    if (con == 1)
    {
        if (global.fighting == false)
        {
            victimer = 0
            con = 2
        }
    }
    if (con == 2)
    {
        victimer += 1
        if (victimer >= 15)
        {
            global.typer = 30
            global.fe = 6
            global.fc = 1
            global.msg[0] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_589_0")
            instance_create_ch1(0, 0, obj_dialoguer_ch1)
            con = 3
        }
    }
    if (con == 3 && (!d_ex_ch1()))
    {
        with (l)
            hspeed = 18
        con = 4
        alarm[4] = 20
    }
    if (con == 5)
    {
        with (l)
        {
            scr_halt_ch1()
            sprite_index = spr_lancer_lt_ch1
        }
        con = 6
        alarm[4] = 15
    }
    if (con == 7)
    {
        global.typer = 32
        global.fc = 5
        global.fe = 3
        global.msg[0] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_624_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_625_0")
        scr_susface_ch1(2, 2)
        global.msg[3] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_627_0")
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
        con = 7.2
    }
    if (con == 7.1 && (!d_ex_ch1()))
    {
        snd_play_ch1(snd_suslaugh_ch1)
        with (s)
            image_speed = 0.2
        con = 6.2
        alarm[4] = 60
    }
    if (con == 7.2 && (!d_ex_ch1()))
    {
        with (global.cinstance[0])
            visible = false
        with (global.cinstance[1])
            visible = false
        with (obj_mainchara_ch1)
            visible = false
        r = scr_dark_marker_ch1(global.cinstance[0].x, global.cinstance[0].y, spr_ralseil_ch1)
        s = scr_dark_marker_ch1(global.cinstance[1].x, global.cinstance[1].y, spr_susier_dark_ch1)
        k = scr_dark_marker_ch1(obj_mainchara_ch1.x, obj_mainchara_ch1.y, spr_krisl_dark_ch1)
        global.typer = 31
        global.fc = 2
        global.fe = 1
        global.msg[0] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_657_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_658_0")
        global.msg[2] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_659_0")
        global.msg[3] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_660_0")
        global.msg[4] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_661_0")
        global.msg[5] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_662_0")
        scr_susface_ch1(6, 6)
        global.msg[7] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_664_0")
        global.msg[8] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_665_0")
        global.msg[9] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_666_0")
        con = 50
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
    }
    if (con == 50 && (!d_ex_ch1()))
    {
        with (r)
            sprite_index = spr_ralseid_ch1
        con = 51
        alarm[4] = 30
    }
    if (con == 52)
    {
        with (r)
            sprite_index = spr_ralseil_ch1
        global.fc = 2
        global.fe = 6
        global.typer = 31
        global.msg[0] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_685_0")
        scr_susface_ch1(1, 0)
        global.msg[2] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_687_0")
        scr_lanface_ch1(3, 3)
        global.msg[4] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_689_0")
        scr_ralface_ch1(5, 1)
        global.msg[6] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_691_0")
        con = 53
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
    }
    if (con == 53 && (!d_ex_ch1()))
    {
        with (s)
            sprite_index = spr_susied_dark_ch1
        con = 54
        alarm[4] = 30
    }
    if (con == 55)
    {
        with (s)
            sprite_index = spr_susier_dark_ch1
        global.fc = 1
        global.fe = 2
        global.typer = 30
        global.msg[0] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_709_0")
        scr_ralface_ch1(1, "C")
        global.msg[2] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_711_0")
        global.msg[3] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_712_0")
        global.msg[4] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_713_0")
        global.msg[5] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_714_0")
        global.msg[6] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_715_0")
        con = 56
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
    }
    if (con == 56 && (!d_ex_ch1()))
    {
        with (s)
            sprite_index = spr_susiel_dark_unhappy_ch1
        con = 57
        alarm[4] = 60
    }
    if (con == 58)
    {
        global.fc = 1
        global.fe = 0
        global.typer = 30
        global.msg[0] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_732_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_733_0")
        global.msg[2] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_734_0")
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
        con = 59
    }
    if (con == 59 && (!d_ex_ch1()))
    {
        with (s)
        {
            vspeed = 2
            image_speed = 0.2
            sprite_index = spr_susied_dark_unhappy_ch1
        }
        con = 60
        alarm[4] = 10
    }
    if (con == 61)
    {
        with (k)
            scr_depth_ch1()
        with (r)
            scr_depth_ch1()
        with (s)
        {
            scr_halt_ch1()
            scr_depth_ch1()
        }
        con = 62
        alarm[4] = 30
    }
    if (con == 63)
    {
        global.msg[0] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_762_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_763_0")
        con = 64
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
    }
    if (con == 64 && (!d_ex_ch1()))
    {
        with (s)
        {
            hspeed = 12
            sprite_index = spr_susier_dark_ch1
            image_speed = 0.5
        }
        con = 65
    }
    if (con == 65)
    {
        if (s.x >= (__view_get((0 << 0), 0) + 460))
        {
            with (s)
                scr_halt_ch1()
            with (s)
                sprite_index = spr_susiel_dark_ch1
            with (k)
                sprite_index = spr_krisr_dark_ch1
            with (r)
                sprite_index = spr_ralseir_ch1
            con = 66
        }
    }
    if (con == 66)
    {
        con = 67
        global.fc = 1
        global.fe = 3
        global.typer = 30
        global.msg[0] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_799_0")
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
    }
    if (con == 67 && (!d_ex_ch1()))
    {
        with (r)
            sprite_index = spr_ralsei_shock_overworld_ch1
        con = 68
        alarm[4] = 20
    }
    if (con == 69)
    {
        global.currentsong[0] = snd_init_ch1("lancer.ogg")
        global.currentsong[1] = mus_loop_ext_ch1(global.currentsong[0], 0.6, 1)
        with (r)
            sprite_index = spr_ralseir_ch1
        global.fc = 5
        global.typer = 32
        global.fe = 2
        global.msg[0] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_820_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_821_0")
        scr_susface_ch1(2, 2)
        global.msg[3] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_823_0")
        scr_ralface_ch1(4, 3)
        global.msg[5] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_825_0")
        scr_lanface_ch1(6, 1)
        global.msg[7] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_827_0")
        scr_susface_ch1(8, 2)
        global.msg[9] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_829_0")
        scr_lanface_ch1(10, 3)
        global.msg[11] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_831_0")
        scr_susface_ch1(12, 2)
        global.msg[13] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_833_0")
        scr_lanface_ch1(14, 1)
        global.msg[15] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_835_0")
        scr_susface_ch1(16, 6)
        global.msg[17] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_837_0")
        global.msg[18] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_838_0")
        scr_lanface_ch1(19, 3)
        global.msg[20] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_840_0")
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
        con = 70
    }
    if (con == 70 && (!d_ex_ch1()))
    {
        snd_volume_ch1(global.currentsong[1], 0, 50)
        snd_play_ch1(snd_lancerlaugh_ch1)
        with (l)
        {
            sprite_index = spr_lancer_lt_laugh_ch1
            image_speed = 0.2
            hspeed = 12
        }
        with (s)
        {
            sprite_index = spr_susier_dark_ch1
            image_speed = 0.5
            hspeed = 12
        }
        con = 71
        alarm[4] = 70
    }
    if (con == 72)
        con = 22
    if (con == 22 && (!d_ex_ch1()))
    {
        with (r)
        {
            hspeed = 6
            image_speed = 0.25
        }
        con = 23
        alarm[4] = 20
    }
    if (con == 24)
    {
        snd_free_all_ch1()
        global.facing = 2
        with (r)
            scr_halt_ch1()
        global.fc = 2
        global.typer = 31
        global.fe = 1
        global.msg[0] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_893_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_894_0")
        global.msg[2] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_895_0")
        global.msg[3] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_896_0")
        global.msg[4] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_897_0")
        global.msg[5] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_898_0")
        global.msg[6] = scr_84_get_lang_string_ch1("obj_checker_animtest_slash_Step_0_gml_899_0")
        con = 28
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
    }
    if (con == 28 && (!d_ex_ch1()))
    {
        with (k)
        {
            hspeed = 8
            image_speed = 0.25
        }
        with (r)
        {
            hspeed = 8
            image_speed = 0.25
            sprite_index = spr_ralseir_ch1
        }
        con = 29
        alarm[4] = 10
    }
    if (con == 30)
    {
        instance_create_ch1(0, 0, obj_fadeout_ch1)
        con = 31
        alarm[4] = 30
    }
    if (con == 32)
    {
        if (global.plot < 60)
        {
            global.plot = 60
            if (global.flag[215] == 1)
                global.flag[251] = 1
        }
        scr_losechar_ch1()
        scr_getchar_ch1(3)
        instance_create_ch1(0, 0, obj_persistentfadein_ch1)
        global.interact = 3
        global.entrance = 1
        room_goto_next()
    }
}
