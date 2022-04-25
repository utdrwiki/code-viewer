if (ambushed == false)
{
    scr_ambush_ch1()
    ambushed = true
}
if (global.monster[myself] == true)
{
    global.flag[(51 + myself)] = 4
    if (global.mnfight == 1 && talked == false)
    {
        if (attackcon == 0)
        {
            scr_moveheart_ch1()
            abletotarget = true
            if (global.charcantarget[0] == false && global.charcantarget[1] == false && global.charcantarget[2] == false)
                abletotarget = false
            mytarget = choose(0, 1, 2)
            if (abletotarget == true)
            {
                while (global.charcantarget[mytarget] == false)
                    mytarget = choose(0, 1, 2)
            }
            else
                target = 3
            global.targeted[mytarget] = true
            instance_create_ch1((__view_get((0 << 0), 0) + 320), (__view_get((1 << 0), 0) + 170), obj_growtangle_ch1)
            instance_create_ch1(0, 0, obj_darkener_ch1)
        }
        global.typer = 45
        global.fc = 2
        global.fe = 1
        global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_36_0")
        if (plot == 0)
        {
            global.fe = 0
            global.flag[30] = 0
            global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_42_0")
            global.msg[1] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_43_0")
            global.msg[2] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_44_0")
            global.msg[3] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_45_0")
            global.msg[4] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_46_0")
            global.msg[5] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_47_0")
            global.msg[6] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_48_0")
        }
        if (plot >= 1)
        {
            dial = 0
            if (global.charaction[0] == 1)
            {
                if (dummyhp > global.monsterhp[0])
                    dial = 1
                if (myhp > global.monsterhp[1])
                    dial = 4
                if (dummyhp == global.monsterhp[0] && myhp == global.monsterhp[1] && plot == 1)
                    dial = 2
                if (dummyhp == global.monsterhp[0] && myhp == global.monsterhp[1] && misstime == 9 && plot == 2)
                {
                    dial = 3
                    global.flag[205] = 6
                }
                if (dial == 4 && hittime >= 2)
                {
                    hittime = 3
                    dial = 3
                    global.flag[205] = 3
                }
                if (dial == 1 && hitdum >= 3)
                {
                    hitdum = 4
                    dial = 3
                    global.flag[205] = 4
                }
            }
            if (global.charaction[0] == 10)
            {
                global.fe = 0
                global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_65_0")
                global.msg[1] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_66_0")
                if (defendtime == 1)
                {
                    global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_70_0")
                    global.msg[1] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_71_0")
                }
                if (defendtime == 2)
                {
                    global.fe = 1
                    global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_77_0")
                    global.msg[1] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_78_0")
                    global.msg[2] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_79_0")
                }
                if (defendtime == 3)
                {
                    global.fe = 9
                    global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_86_0")
                }
                if (defendtime >= 4)
                {
                    dial = 3
                    global.flag[205] = 5
                }
                defendtime += 1
            }
            if (global.charaction[0] == 4)
            {
                global.fe = 8
                global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_96_0")
            }
            if (dial == 1)
            {
                if (plot == 2 && hitdum == 0)
                    hitdum = 1
                plot = 2
                global.fe = 3
                if (dummyhp > (global.monsterhp[0] + 50))
                {
                    global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_107_0")
                    global.msg[1] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_108_0")
                }
                else
                {
                    global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_112_0")
                    global.msg[1] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_113_0")
                }
                if (misstime >= 6)
                {
                    global.fe = 8
                    global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_118_0")
                    global.msg[1] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_119_0")
                }
                global.msg[2] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_121_0")
                global.msg[3] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_122_0")
                global.msg[4] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_123_0")
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_124_0")
                if (hitdum == 1)
                {
                    global.fe = 1
                    global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_130_0")
                    global.msg[1] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_131_0")
                }
                if (hitdum == 2)
                {
                    global.fe = 1
                    global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_137_0")
                    global.msg[1] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_138_0")
                }
                if (hitdum == 3)
                {
                    global.fe = 9
                    global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_144_0")
                    global.msg[1] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_145_0")
                }
                hitdum += 1
            }
            if (dial == 2)
            {
                global.fe = 3
                global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_154_0")
                global.msg[1] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_155_0")
                if (misstime >= 1)
                {
                    global.fe = 8
                    global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_159_0")
                    if (misstime == 2)
                        global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_160_0")
                    if (misstime == 3)
                        global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_161_0")
                    if (misstime == 4)
                        global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_162_0")
                    if (misstime == 5)
                        global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_163_0")
                    if (misstime == 6)
                        global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_164_0")
                    if (misstime == 7)
                    {
                        global.fe = 9
                        global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_168_0")
                    }
                    if (misstime == 8)
                    {
                        global.fe = 1
                        global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_173_0")
                        global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_174_0")
                        plot = 2
                    }
                }
                misstime += 1
            }
            if (dial == 3)
            {
                global.fe = 9
                global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_187_0")
                global.msg[1] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_188_0")
                global.msg[2] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_189_0")
                global.msg[3] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_190_0")
                if (hittime >= 3)
                {
                    global.fe = 2
                    global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_195_0")
                    global.msg[1] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_196_0")
                    global.msg[2] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_197_0")
                    global.msg[3] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_198_0")
                }
                won = 1
            }
            if (dial == 4)
            {
                global.fe = 3
                if (hittime == 0)
                {
                    global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_212_0")
                    global.msg[1] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_213_0")
                    if (plot == 2)
                        global.msg[2] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_218_0")
                    if (plot == 1)
                    {
                        global.msg[2] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_222_0")
                        global.msg[3] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_223_0")
                        global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_224_0")
                        plot = 2
                    }
                }
                if (hittime == 1)
                {
                    global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_231_0")
                    global.msg[1] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_232_0")
                    global.msg[2] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_233_0")
                }
                hittime += 1
            }
        }
        scr_battletext_ch1()
        talked = true
        talktimer = 0
    }
    if (talked == true && global.mnfight == 1)
    {
        if (instance_exists(obj_writer_ch1) == 0)
        {
            with (obj_face_ch1)
                instance_destroy()
            if (attackcon == 0)
                global.mnfight = 2
            else
            {
                if (won == 1)
                {
                    global.mercymod[0] = 99999
                    global.mercymod[1] = 99999
                }
                scr_mnendturn_ch1()
                dummyhp = global.monsterhp[0]
                myhp = global.monsterhp[1]
            }
        }
    }
    if (global.mnfight == 2 && attacked == false)
    {
        if (attacks == false)
            attackcon = 1
        turns += 1
        global.turntimer = 999
        attacked = true
        rr = floor(random(0))
        global.typer = 6
        global.fc = 0
        if (rr == 0)
            global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_288_0")
    }
}
if (attackcon < 92 && attackcon > 0)
{
    global.turntimer = 999
    if (attackcon == 1)
    {
        krishp = global.hp[1]
        b1 = instance_create_ch1((obj_heart_ch1.x + 150), obj_heart_ch1.y, obj_ralseibullet_ch1)
        attackcon = 2
        alarm[5] = 35
    }
    if (attackcon == 3)
    {
        b2 = instance_create_ch1((obj_heart_ch1.x - 150), obj_heart_ch1.y, obj_ralseibullet_ch1)
        attackcon = 4
        alarm[5] = 35
    }
    if (attackcon == 5)
    {
        b3 = instance_create_ch1((obj_heart_ch1.x + 8), (obj_heart_ch1.y - 150), obj_ralseibullet_ch1)
        attackcon = 6
        alarm[5] = 60
    }
    if (attackcon == 7)
    {
        attackcon = 8
        global.turntimer = 999
        if (krishp == global.hp[1])
        {
            global.fc = 2
            global.fe = 0
            global.typer = 45
            global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_334_0")
            scr_battletext_ch1()
            attackcon = 90
        }
        else
        {
            global.fc = 2
            global.fe = 3
            global.typer = 45
            global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_343_0")
            global.msg[1] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_344_0")
            scr_battletext_ch1()
        }
    }
    if (attackcon == 8 && instance_exists(obj_writer_ch1) == 0)
    {
        with (obj_face_ch1)
            instance_destroy()
        krishp = global.hp[1]
        b1 = instance_create_ch1((obj_heart_ch1.x + 8), (obj_heart_ch1.y - 150), obj_ralseibullet_ch1)
        attackcon = 9
        alarm[5] = 60
    }
    if (attackcon == 10)
    {
        attackcon = 11
        global.turntimer = 999
        if (krishp == global.hp[1])
        {
            global.fc = 2
            global.fe = 0
            global.typer = 45
            global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_369_0")
            scr_battletext_ch1()
            attackcon = 90
        }
        else
        {
            global.fc = 2
            global.fe = 9
            global.typer = 45
            global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_378_0")
            scr_battletext_ch1()
        }
    }
    if (attackcon == 11 && instance_exists(obj_writer_ch1) == 0)
    {
        b1 = instance_create_ch1((xx + 440), (obj_heart_ch1.y + 8), obj_ralseibullet_ch1)
        with (b1)
        {
            special = true
            alarm[0] = 40
        }
        attackcon = 12
        alarm[5] = 80
    }
    if (attackcon == 13)
    {
        global.fc = 2
        global.fe = 8
        global.typer = 45
        global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_399_0")
        scr_battletext_ch1()
        attackcon = 90
    }
    if (attackcon == 90 && instance_exists(obj_writer_ch1) == 0)
    {
        global.fc = 2
        global.fe = 0
        global.typer = 45
        global.charturn = 0
        global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_410_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_411_0")
        global.msg[2] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_412_0")
        global.msg[3] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_413_0")
        global.msg[4] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_414_0")
        scr_battletext_ch1()
        attackcon = 91
    }
    if (attackcon == 91)
    {
        global.turntimer = 999
        if (instance_exists(obj_writer_ch1) == 0)
        {
            dummyhp = global.monsterhp[0]
            myhp = global.monsterhp[1]
            global.turntimer = 0
            global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_427_0")
            plot = 1
            attackcon = 92
        }
    }
}
if (global.myfight == 3)
{
    xx = __view_get((0 << 0), 0)
    yy = __view_get((1 << 0), 0)
    if (acting == true && actcon == 0)
    {
        actcon = 1
        global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_447_0")
        scr_battletext_default_ch1()
    }
    if (acting == 2 && actcon == 0)
    {
        with (obj_herokris_ch1)
        {
            global.faceaction[myself] = 0
            state = 0
            acttimer = 0
        }
        actcon = 10
        global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_464_0")
        scr_battletext_default_ch1()
    }
    if (actcon == 1 && (!instance_exists(obj_writer_ch1)))
    {
        actcon = 0
        scr_attackphase_ch1()
    }
    if (actcon == 10)
    {
        with (global.charinstance[0])
            visible = false
        k = scr_dark_marker_ch1(global.charinstance[0].x, global.charinstance[0].y, spr_kris_hug_ch1)
        with (k)
            scr_move_to_point_over_time_ch1((global.monsterx[1] - 42), (global.monstery[1] - 16), 15)
        actcon = 11
        alarm[4] = 25
    }
    if (actcon == 12)
    {
        sprite_index = spr_ralseib_idle_enemy_blush_ch1
        with (k)
            image_speed = 0.25
        actcon = 13
        alarm[4] = 12
    }
    if (actcon == 14)
    {
        with (k)
            image_speed = 0
        actcon = 15
    }
    if (actcon == 15 && (!instance_exists(obj_writer_ch1)))
    {
        global.typer = 45
        global.fc = 2
        global.fe = 2
        global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_504_0")
        if (hugtime == 0)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_508_0")
            global.msg[1] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_509_0")
            global.msg[2] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_510_0")
            global.msg[3] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_511_0")
        }
        if (hugtime == 1)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_516_0")
            global.msg[1] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_517_0")
            global.msg[2] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_518_0")
            global.flag[205] = 2
            won = 1
        }
        hugtime += 1
        scr_battletext_ch1()
        actcon = 16
    }
    if (actcon == 16 && (!instance_exists(obj_writer_ch1)))
    {
        with (myface)
            instance_destroy()
        with (k)
            image_speed = -0.25
        actcon = 17
        alarm[4] = 12
    }
    if (actcon == 18)
    {
        with (k)
            image_speed = 0
        with (k)
            scr_move_to_point_over_time_ch1(global.charinstance[0].x, global.charinstance[0].y, 15)
        actcon = 19
        alarm[4] = 25
    }
    if (actcon == 20)
    {
        sprite_index = spr_ralseib_idle_enemy_ch1
        with (k)
            instance_destroy()
        global.charinstance[0].visible = true
        actcon = 1
        if (won == 1)
        {
            global.mercymod[0] = 999999
            global.mercymod[1] = 999999
        }
    }
}
if (con == 1)
{
    alarm[4] = 5
    con = 2
}
if (con == 3)
{
    global.typer = 7
    global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_575_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_576_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_577_0")
    global.msg[3] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_578_0")
    global.msg[4] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_579_0")
    global.msg[5] = scr_84_get_lang_string_ch1("obj_ralseienemy_slash_Step_0_gml_580_0")
    con = 4
    mywriter = instance_create_ch1((x - 160), (y - 30), obj_writer_ch1)
}
if (con == 4 && (!instance_exists(obj_writer_ch1)))
{
    hspeed = 20
    con = 5
    alarm[4] = 15
    with (obj_battlecontroller_ch1)
    {
        noreturn = false
        alarm[2] = 17
    }
}
if (con == 6)
{
    global.monsterexp[myself] -= 0
    global.monstergold[myself] += 10
    scr_monsterdefeat_ch1()
    instance_destroy()
    con = 7
}
