if (con < 40)
{
    if (con == 2)
    {
        xx = __view_get((0 << 0), 0)
        yy = __view_get((1 << 0), 0)
        with (k)
            scr_halt_ch1()
        with (s)
            scr_halt_ch1()
        con = 3
        alarm[4] = 30
    }
    if (con == 4)
    {
        with (obj_mainchara_ch1)
            cutscene = true
        global.fe = 0
        global.fc = 1
        global.typer = 30
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_20_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_21_0")
        con = 5
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
    }
    if (con == 5 && d_ex_ch1() == 0)
    {
        con = 6
        global.fc = 0
        global.typer = 42
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_32_0")
        wr = instance_create_ch1((xx + 200), (yy + 100), obj_writer_ch1)
        if (scr_debug_ch1() == 0)
        {
            with (wr)
                skippable = false
        }
    }
    if (con == 6)
    {
        if (instance_exists(wr) == 0)
        {
            global.fe = 9
            global.fc = 1
            global.typer = 30
            global.msg[0] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_46_0")
            con = 7
            instance_create_ch1(0, 0, obj_dialoguer_ch1)
        }
    }
    if (con == 7 && d_ex_ch1() == 0)
    {
        global.fc = 0
        con = 8
        global.typer = 42
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_58_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_59_0")
        wr = instance_create_ch1((xx + 200), (yy + 100), obj_writer_ch1)
        if (scr_debug_ch1() == 0)
        {
            with (wr)
                skippable = false
        }
    }
    if (con == 8)
    {
        if (instance_exists(wr) == 0)
        {
            r = scr_dark_marker_ch1(495, 310, spr_ralsei_hood_ch1)
            with (r)
                depth = 100
            with (s)
            {
                vspeed = -4
                image_speed = 0.1
            }
            with (k)
            {
                vspeed = -4
                image_speed = 0.1
            }
            scr_pan_ch1(0, -4, 70)
            con = 9
            alarm[4] = 85
        }
    }
    if (con == 10)
    {
        with (k)
            scr_halt_ch1()
        with (s)
            scr_halt_ch1()
        con = 11
        alarm[4] = 30
    }
    if (con == 12)
    {
        global.typer = 6
        global.fc = 2
        global.fe = 0
        global.flag[30] = 1
        global.msc = 120
        scr_text_ch1(global.msc)
        con = 20
        d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
        d.side = 1
    }
    if (con == 20 && d_ex_ch1() == 0)
    {
        fade = instance_create_ch1(0, 0, obj_fadeout_ch1)
        with (fade)
            fadespeed = 0.01
        con = 21
        alarm[4] = 100
    }
    if (con == 22)
    {
        room_persistent = true
        con = 24
        alarm[4] = 2
    }
    if (con == 25)
    {
        instance_create_ch1(0, 0, obj_persistentfadein_ch1)
        room_goto(room_legend_ch1)
        global.plot = 20
        con = 26
        alarm[4] = 3
    }
    if (con == 27)
    {
        global.plot = 21
        room_persistent = false
        con = 28
        alarm[4] = 60
    }
    if (con == 29)
    {
        global.fc = 2
        global.fe = 0
        global.typer = 6
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_142_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_143_0")
        global.msg[2] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_144_0")
        global.msg[3] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_145_0")
        global.msg[4] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_146_0")
        d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
        d.side = 1
        con = 35
    }
    if (con == 30 && d_ex_ch1() == 1)
    {
        if (scr_getmsgno_ch1() == 17)
        {
            with (s)
                sprite_index = spr_susier_dark_ch1
        }
        if (scr_getmsgno_ch1() == 18)
        {
            with (s)
                sprite_index = spr_susied_dark_ch1
        }
    }
    if (con == 30 && d_ex_ch1() == 0)
        con = 40
    if (con == 35 && d_ex_ch1() == 0)
    {
        with (s)
            sprite_index = spr_susier_dark_ch1
        con = 36
        alarm[4] = 50
    }
    if (con == 37)
    {
        with (s)
            sprite_index = spr_susieu_dark_ch1
        global.typer = 30
        global.fe = 0
        global.fc = 1
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_181_0")
        scr_ralface_ch1(1, 1)
        global.msg[2] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_183_0")
        scr_susface_ch1(3, 0)
        global.msg[4] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_185_0")
        global.msg[5] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_186_0")
        scr_ralface_ch1(6, 1)
        global.msg[7] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_188_0")
        scr_susface_ch1(8, 0)
        global.msg[9] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_190_0")
        global.msg[10] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_191_0")
        global.msg[11] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_192_0")
        scr_ralface_ch1(12, 0)
        global.msg[13] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_194_0")
        scr_susface_ch1(14, 0)
        global.msg[15] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_196_0")
        global.msg[16] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_197_0")
        global.msg[17] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_198_0")
        global.msg[18] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_199_0")
        scr_ralface_ch1(19, 1)
        global.msg[20] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_201_0")
        d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
        d.side = 1
        con = 38
    }
    if (con == 38 && d_ex_ch1() == 1)
    {
        if (scr_getmsgno_ch1() == 0)
        {
            with (s)
                sprite_index = spr_susieu_dark_ch1
        }
        if (scr_getmsgno_ch1() == 9)
        {
            with (s)
                sprite_index = spr_susier_dark_ch1
        }
        if (scr_getmsgno_ch1() == 13)
        {
            with (s)
                sprite_index = spr_susieu_dark_ch1
        }
        if (scr_getmsgno_ch1() == 15)
        {
            with (s)
                sprite_index = spr_susiel_dark_ch1
        }
        if (scr_getmsgno_ch1() == 18)
        {
            with (s)
                sprite_index = spr_susied_dark_ch1
        }
    }
    if (con == 38 && d_ex_ch1() == 0)
        con = 40
}
else
{
    if (con == 40 && d_ex_ch1() == 0)
    {
        with (s)
            sprite_index = spr_susieu_dark_ch1
        snd_play_ch1(snd_lancerlaugh_ch1)
        con = 44
        alarm[4] = 50
    }
    if (con == 45)
    {
        snd_play_ch1(snd_drive_ch1)
        xx = __view_get((0 << 0), 0)
        yy = __view_get((1 << 0), 0)
        l = scr_dark_marker_ch1((xx + 720), ((r.y + r.sprite_height) - 10), spr_lancerbike_ch1)
        with (l)
            hspeed = -32
        con = 46
    }
    if (con == 46)
    {
        if (l.x <= (xx + 360))
        {
            ex = instance_create_ch1((r.x + 30), (r.y + 30), obj_animation_ch1)
            ex.sprite_index = spr_realisticexplosion_ch1
            ex.image_xscale = 2
            ex.image_yscale = 2
            ex.image_speed = 0.5
            ex.depth = 10
            global.currentsong[0] = snd_init_ch1("lancer.ogg")
            with (l)
                hspeed = 0
            with (r)
            {
                hspeed = -32
                vspeed = -8
                gravity = 0.2
            }
            rflip = 1
            snd_play_ch1(snd_badexplosion_ch1)
            instance_create_ch1(0, 0, obj_shake_ch1)
            con = 47
            alarm[4] = 60
        }
    }
    if (con == 48)
    {
        global.currentsong[1] = mus_loop_ext_ch1(global.currentsong[0], 0.7, 1)
        con = 49
        global.fc = 5
        global.fe = 1
        global.typer = 32
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_276_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_277_0")
        global.msg[2] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_278_0")
        global.msg[3] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_279_0")
        scr_susface_ch1(4, 9)
        global.msg[5] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_281_0")
        scr_lanface_ch1(6, 0)
        global.msg[7] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_283_0")
        if (global.flag[203] == 1)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_287_0")
            global.msg[1] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_288_0")
            scr_susface_ch1(2, 9)
            global.msg[3] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_290_0")
            scr_lanface_ch1(4, 0)
            global.msg[5] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_292_0")
        }
        d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
        d.side = 1
    }
    if (con == 49 && d_ex_ch1() == 0)
    {
        con = 50
        snd_play_ch1(snd_lancerwhistle_ch1)
        with (l)
            sprite_index = spr_lancerbike_l_ch1
        siner = 0
        maxamt = 20
    }
    if (con == 50)
    {
        siner += 1
        l.image_xscale = (2 * cos((((siner * 2) * pi) / maxamt)))
        if (siner >= maxamt)
        {
            con = 51
            if (global.flag[203] == 1)
                con = 54
            l.image_xscale = 2
            alarm[4] = 15
        }
    }
    if (con == 52)
    {
        with (l)
            sprite_index = spr_lancerbike_ch1
        global.fe = 1
        global.fc = 5
        global.typer = 32
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_327_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_328_0")
        global.msg[2] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_329_0")
        global.msg[3] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_330_0")
        scr_susface_ch1(4, 0)
        global.msg[5] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_332_0")
        scr_lanface_ch1(6, 1)
        global.msg[7] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_334_0")
        global.msg[8] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_335_0")
        global.msg[9] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_336_0")
        global.msg[10] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_337_0")
        global.msg[11] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_338_0")
        global.msg[12] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_339_0")
        global.msg[13] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_340_0")
        scr_susface_ch1(14, 1)
        global.msg[15] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_342_0")
        scr_lanface_ch1(16, 6)
        global.msg[17] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_344_0")
        scr_susface_ch1(18, 2)
        global.msg[19] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_346_0")
        global.msg[20] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_347_0")
        d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
        d.side = 1
        con = 70
    }
    if (con == 55)
    {
        with (l)
            sprite_index = spr_lancerbike_ch1
        global.fc = 5
        global.fe = 1
        global.typer = 32
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_360_0")
        scr_susface_ch1(1, 0)
        global.msg[2] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_362_0")
        scr_lanface_ch1(3, 0)
        global.msg[4] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_364_0")
        scr_susface_ch1(5, 1)
        global.msg[6] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_366_0")
        scr_lanface_ch1(7, 4)
        global.msg[8] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_368_0")
        d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
        with (d)
            side = 1
        con = 56
    }
    if (con == 56 && d_ex_ch1() == 0)
    {
        r2 = scr_dark_marker_ch1((xx - 60), (yy + 80), spr_ralsei_hood_ch1)
        with (r2)
            hspeed = 16
        con = 57
        alarm[4] = 15
    }
    if (con == 58)
    {
        global.typer = 6
        with (r2)
            hspeed = 0
        global.fc = 2
        global.fe = 1
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_388_0")
        scr_lanface_ch1(1, 0)
        global.msg[2] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_390_0")
        scr_ralface_ch1(3, 0)
        global.msg[4] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_392_0")
        scr_susface_ch1(5, 0)
        global.msg[6] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_394_0")
        d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
        with (d)
            side = 1
        con = 59
    }
    if (con == 59 && d_ex_ch1() == 0)
    {
        with (r2)
            hspeed = -8
        con = 60
        alarm[4] = 30
    }
    if (con == 61)
    {
        global.fc = 5
        global.fe = 6
        global.typer = 32
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_412_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_413_0")
        global.msg[2] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_414_0")
        global.msg[3] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_415_0")
        global.msg[4] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_416_0")
        scr_susface_ch1(5, 2)
        global.msg[6] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_418_0")
        scr_lanface_ch1(7, 7)
        global.msg[8] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_420_0")
        d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
        with (d)
            side = 1
        con = 62
    }
    if (con == 62 && d_ex_ch1() == 0)
    {
        r3 = scr_dark_marker_ch1((xx - 60), (yy + 80), spr_ralsei_hood_ch1)
        with (r3)
            hspeed = 16
        con = 63
        alarm[4] = 15
    }
    if (con == 64)
    {
        with (r3)
            hspeed = 0
        global.typer = 6
        global.fc = 2
        global.fe = 1
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_440_0")
        scr_susface_ch1(1, 0)
        global.msg[2] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_442_0")
        d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
        with (d)
            side = 1
        con = 65
    }
    if (con == 65 && d_ex_ch1() == 0)
    {
        with (r3)
            hspeed = -8
        con = 66
        alarm[4] = 40
    }
    if (con == 67)
    {
        global.typer = 30
        global.fc = 1
        global.fe = 1
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_460_0")
        scr_lanface_ch1(1, 1)
        global.msg[2] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_462_0")
        scr_susface_ch1(3, 2)
        global.msg[4] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_464_0")
        global.msg[5] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_465_0")
        d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
        with (d)
            side = 1
        con = 70
    }
    if (con == 72)
    {
        global.flag[9] = 1
        global.batmusic[0] = snd_init_ch1("battle.ogg")
        global.encounterno = 2
        global.specialbattle = 3
        scr_getchar_ch1(2)
        obj_mainchara_ch1.x = k.x
        obj_mainchara_ch1.y = k.y
        global.cinstance[0] = instance_create_ch1(s.x, s.y, obj_caterpillarchara_ch1)
        with (k)
            instance_destroy()
        with (s)
            instance_destroy()
        instance_create_ch1(0, 0, obj_encounterbasic_ch1)
        con = 73
        with (l)
        {
            direction = point_direction(x, y, global.monstermakex[0], global.monstermakey[0])
            speed = (point_distance(x, y, global.monstermakex[0], global.monstermakey[0]) / 10)
        }
        alarm[4] = 10
    }
    if (con == 70 && d_ex_ch1() == 0)
    {
        snd_free_all_ch1()
        con = 71
        alarm[4] = 2
    }
    if (con == 74)
    {
        with (l)
            speed = 0
        if instance_exists(obj_battlecontroller_ch1)
        {
            with (l)
                instance_destroy()
            con = 75
        }
    }
    if (con == 75)
    {
        if (global.plot == 22)
        {
            if (instance_exists(obj_battlecontroller_ch1) == 0)
            {
                if (instance_exists(obj_endbattle_ch1) == 0)
                    con = 76
            }
            alarm[4] = 5
        }
    }
    if (con == 77)
    {
        rflip = 0
        global.interact = 1
        k = scr_dark_marker_ch1(obj_mainchara_ch1.x, obj_mainchara_ch1.y, spr_krisu_dark_ch1)
        s = scr_dark_marker_ch1(global.cinstance[0].x, global.cinstance[0].y, spr_susieu_dark_ch1)
        with (obj_mainchara_ch1)
            visible = false
        with (global.cinstance[0])
            instance_destroy()
        con = 78
        alarm[4] = 15
    }
    if (con == 79)
    {
        r = scr_dark_marker_ch1(95, 310, spr_ralsei_hood_ch1)
        r.hspeed = 16
        con = 80
        alarm[4] = 25
    }
    if (con == 81)
    {
        with (r)
            speed = 0
        global.fc = 2
        global.fe = 1
        global.typer = 6
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_552_0")
        d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
        d.side = 1
        con = 82
    }
    if (con == 82 && d_ex_ch1() == 0)
    {
        with (r)
            vspeed = 6
        with (r)
            depth = 1000
        con = 83
        alarm[4] = 10
    }
    if (con == 84)
    {
        with (r)
            vspeed = 0
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_569_0")
        scr_susface_ch1(1, 0)
        global.msg[2] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_571_0")
        global.msg[3] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_572_0")
        scr_ralface_ch1(4, 0)
        global.msg[5] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_574_0")
        d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
        d.side = 1
        con = 85
    }
    if (con == 85 && d_ex_ch1() == 0)
    {
        snd_play_ch1(snd_noise_ch1)
        with (r)
        {
            sprite_index = spr_ralsei_removehood_ch1
            image_index = 0
            image_speed = 0.1
        }
        con = 86
        alarm[4] = 60
    }
    if (con == 87)
    {
        with (r)
        {
            sprite_index = spr_ralseid_ch1
            image_index = 0
            image_speed = 0
        }
        global.flag[30] = 0
        con = 88
        alarm[4] = 30
    }
    if (con == 89)
    {
        global.typer = 31
        global.fc = 2
        global.fe = 0
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_611_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_612_0")
        global.msg[2] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_613_0")
        scr_susface_ch1(3, 0)
        global.msg[4] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_615_0")
        scr_ralface_ch1(5, 0)
        global.msg[6] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_617_0")
        scr_susface_ch1(7, 0)
        global.msg[8] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_619_0")
        d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
        d.side = 1
        con = 90
    }
    if (con == 90 && d_ex_ch1() == 0)
    {
        with (s)
            sprite_index = spr_susier_dark_ch1
        con = 91
        alarm[4] = 40
    }
    if (con == 92)
    {
        with (k)
            sprite_index = spr_krisr_dark_ch1
        global.fc = 1
        global.fe = 2
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_637_0")
        d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
        d.side = 1
        con = 93
    }
    if (con == 93 && d_ex_ch1() == 0)
    {
        with (k)
            sprite_index = spr_krisd_dark_ch1
        with (s)
        {
            vspeed = 4
            image_speed = 0.2
            sprite_index = spr_susied_dark_ch1
        }
        con = 94
        alarm[4] = 70
    }
    if (con == 95)
    {
        with (k)
            sprite_index = spr_krisu_dark_ch1
        global.typer = 31
        global.fc = 2
        global.fe = 1
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_663_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_664_0")
        d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
        d.side = 1
        con = 96
    }
    if (con == 96 && d_ex_ch1() == 0)
    {
        with (k)
            sprite_index = spr_krisr_dark_ch1
        with (r)
        {
            hspeed = 1
            vspeed = 2
            image_speed = 0.2
        }
        con = 97
    }
    if (con == 97)
    {
        if (r.y >= (k.y - 12))
        {
            r.y = (k.y - 12)
            r.image_speed = 0
            r.image_index = 0
            r.sprite_index = spr_ralseil_ch1
            r.speed = 0
            r.vspeed = 0
            r.hspeed = 0
            con = 98
            alarm[4] = 30
        }
    }
    if (con == 99)
    {
        global.fe = 5
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_702_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_703_0")
        global.msg[2] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_704_0")
        global.msg[3] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_705_0")
        global.msg[4] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_706_0")
        global.msg[5] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_707_0")
        d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
        d.side = 1
        con = 100
    }
    if (con == 100 && d_ex_ch1() == 0)
    {
        with (r)
            sprite_index = spr_ralseid_ch1
        con = 101
        alarm[4] = 40
    }
    if (con == 102)
    {
        global.fe = 0
        global.msg[0] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_723_0")
        d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
        d.side = 1
        con = 103
    }
    if (con == 103 && d_ex_ch1() == 0)
    {
        with (r)
        {
            hspeed = -4
            image_speed = 0.2
            sprite_index = spr_ralseil_ch1
        }
        con = 104
    }
    if (con == 104)
    {
        if (r.x <= (k.x - 70))
        {
            with (r)
                scr_halt_ch1()
            with (r)
                sprite_index = spr_ralseir_ch1
            con = 105
            global.fe = 8
            global.msg[0] = scr_84_get_lang_string_ch1("obj_darkcastle_event_slash_Step_0_gml_749_0")
            d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
            d.side = 1
        }
    }
    if (con == 105 && d_ex_ch1() == 0)
    {
        con = 107
        global.currentsong[0] = snd_init_ch1("castletown_empty.ogg")
        alarm[4] = 30
        scr_pan_to_obj_ch1(obj_mainchara_ch1, 25)
    }
    if (con == 109)
    {
        with (r)
            instance_destroy()
        con = 110
        instance_destroy()
    }
    if (con == 108)
    {
        scr_losechar_ch1()
        scr_getchar_ch1(3)
        global.facing = 1
        obj_mainchara_ch1.visible = true
        obj_mainchara_ch1.cutscene = false
        with (k)
            instance_destroy()
        global.cinstance[0] = instance_create_ch1((r.x + 4), (r.y + 12), obj_caterpillarchara_ch1)
        with (global.cinstance[0])
        {
            scr_caterpillar_interpolate_ch1()
            usprite = spr_ralseiu_ch1
            dsprite = spr_ralseid_ch1
            rsprite = spr_ralseir_ch1
            lsprite = spr_ralseil_ch1
            for (i = 0; i < 50; i += 1)
                facing[i] = 1
            x -= 4
            y -= 12
        }
        con = 109
        global.currentsong[1] = mus_loop_ch1(global.currentsong[0])
        global.plot = 30
        global.interact = 0
        scr_tempsave_ch1()
    }
}
if (rflip == 1)
{
    if instance_exists(r)
    {
        with (r)
            image_angle += 2
    }
}
