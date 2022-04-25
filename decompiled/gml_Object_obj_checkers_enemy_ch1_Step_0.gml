if (global.monstertype[myself] == 21)
    secondtime = true
if (global.monster[myself] == true)
{
    global.flag[(51 + myself)] = 4
    if (secondtime == true)
        milk_counter = 99
    if (secondtime == true)
        ralsei_lecture = 99
    if (global.mnfight == 1 && talked == false)
    {
        scr_randomtarget_ch1()
        if (!instance_exists(obj_darkener_ch1))
            instance_create_ch1(0, 0, obj_darkener_ch1)
        milkmax = 1000
        if (milk_counter > 0)
            milkmax = 600
        if (global.monsterhp[myself] > milkmax)
        {
            if ((!instance_exists(obj_moveheart_ch1)) && (!instance_exists(obj_heart_ch1)))
                scr_moveheart_ch1()
            if (!instance_exists(obj_growtangle_ch1))
                instance_create_ch1((__view_get((0 << 0), 0) + 320), (__view_get((1 << 0), 0) + 170), obj_growtangle_ch1)
        }
        global.mnfight = 2
        rtimer = 0
        global.typer = 50
        talked = 2
        attacked = false
        talktimer = 0
    }
    if (talked == 2)
        global.mnfight = 2
    if (global.mnfight == 2 && attacked == false)
    {
        rtimer += 1
        if (rtimer == 12)
        {
            talked = false
            milkmax = 1000
            if (milk_counter > 0)
                milkmax = 600
            if (global.monsterhp[myself] <= milkmax)
            {
                if (scon == 0)
                    scon = 1
            }
            else
            {
                if (!instance_exists(obj_checkers_leap_ch1))
                {
                    if (attacktype == 0)
                        rr = false
                    if (attacktype == 1)
                        rr = 3
                    if (attacktype == 2)
                        rr = true
                    if (attacktype == 3)
                        rr = 2
                    dc = instance_create_ch1(x, y, obj_checkers_leap_ch1)
                    dc.leapmode = rr
                    dc.target = mytarget
                    dc.damage = (global.monsterat[myself] * 5)
                    attacktype += 1
                    if (attacktype > 3)
                        attacktype = 0
                }
                siner = 0
                visible = false
                turns += 1
            }
            global.turntimer = 999
            attacked = true
            global.typer = 6
            global.fc = 0
            rr = choose(0)
            global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_77_0")
            if (global.monsterstatus[myself] == true)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_79_0")
            if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 3))
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_80_0")
            if (crown > 0)
                global.battlemsg[0] = scr_84_get_subst_string_ch1(scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_82_0"), string(crown))
        }
        else
            global.turntimer = 120
    }
    if (global.mnfight == 2)
    {
        if (global.turntimer <= 1)
        {
            if (battlecancel == 1)
                global.mercymod[myself] = 999
            if (battlecancel == 2)
            {
                with (obj_battlecontroller_ch1)
                    noreturn = true
                con = 1
                battlecancel = 3
            }
        }
    }
}
if (scon == 1)
{
    if (milk_counter > 0)
        scon = 1.5
    else
    {
        with (obj_writer_ch1)
            instance_destroy()
        global.msg[0] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_119_0")
        scr_battletext_default_ch1()
        scon = 1.5
    }
}
if (scon == 1.5 && (!instance_exists(obj_writer_ch1)))
{
    snd_play_ch1(snd_magicsprinkle_ch1)
    with (obj_writer_ch1)
        instance_destroy()
    global.msg[0] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_129_0")
    global.turntimer = 999
    scr_battletext_default_ch1()
    milk = scr_dark_marker_ch1((x - 100), (y + 60), spr_checkers_milk_ch1)
    with (milk)
    {
        image_speed = 0
        image_xscale = 4
        image_yscale = 4
        image_alpha = 0
    }
    milk.depth = (depth - 1)
    scon = 2
    milktimer = 0
}
if (scon == 2)
{
    with (milk)
    {
        image_xscale -= 0.2
        image_yscale -= 0.2
        image_alpha += 0.1
    }
    milktimer += 1
    if (milktimer >= 10)
    {
        scon = 3
        milktimer = 0
        with (milk)
            image_alpha = 1.4
    }
}
if (scon == 3)
{
    milktimer += 1
    if (milktimer >= 25)
    {
        scon = 4
        milktimer = 0
    }
}
if (scon == 4)
{
    with (milk)
    {
        hspeed += 2
        image_alpha -= 0.1
    }
    milktimer += 1
    if (milktimer == 10)
    {
        if (global.monsterat[myself] < 10)
            global.monsterat[myself] += 0.5
        snd_play_ch1(snd_power_ch1)
        milkheal = 700
        if (milk_counter == 0)
            milkheal = 300
        global.monsterhp[myself] += milkheal
        healamt = instance_create_ch1(global.monsterx[myself], global.monstery[myself], obj_dmgwriter_ch1)
        with (healamt)
        {
            delay = 8
            type = 3
            damage = 700
        }
        healamt.damage = milkheal
        hanim = instance_create_ch1(x, y, obj_healanim_ch1)
        hanim.target = id
    }
    if (milktimer >= 15)
    {
        with (milk)
            instance_destroy()
        scon = 5
        milktimer = 0
    }
}
if (scon == 5)
{
    milktimer += 1
    if (milktimer >= 30)
    {
        if (milk_counter > 0)
        {
            with (obj_writer_ch1)
                instance_destroy()
            scon = 0
            milktimer = 0
            global.turntimer = 0
        }
        else
        {
            with (obj_writer_ch1)
                instance_destroy()
            scon = 6
            global.msg[0] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_226_0")
            scr_ralface_ch1(1, 3)
            global.msg[2] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_228_0")
            scr_susface_ch1(3, 3)
            global.msg[4] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_230_0")
            scr_battletext_default_ch1()
        }
        milk_counter += 1
    }
}
if (scon == 6)
{
    if (!instance_exists(obj_writer_ch1))
    {
        global.fc = 0
        scon = 0
        milktimer = 0
        global.turntimer = 0
    }
    else
        global.turntimer = 999
}
if (global.myfight == 3)
{
    xx = __view_get((0 << 0), 0)
    yy = __view_get((1 << 0), 0)
    if (acting == true && actcon == 0)
    {
        actcon = 1
        if (secondtime == false)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_263_0")
            global.actname[myself][0] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_264_0")
            global.flag[246] = 1
            if (checked == true)
                global.msg[0] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_268_0")
            checked = true
        }
        else
        {
            if (global.flag[246] == 1)
            {
                global.msg[0] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_277_0")
                global.msg[1] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_278_0")
            }
            else
            {
                global.msg[0] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_282_0")
                global.msg[1] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_283_0")
            }
            checked = true
        }
        scr_battletext_default_ch1()
    }
    if (acting == 2 && actcon == 0)
    {
        if (secondtime == false)
            crown += 15
        if (secondtime == true)
            crown += 18
        global.msg[0] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_296_0")
        with (obj_herokris_ch1)
            visible = false
        global.faceaction[0] = 0
        global.charaction[0] = 0
        bowkris = scr_dark_marker_ch1(obj_herokris_ch1.x, obj_herokris_ch1.y, spr_krisb_bow_ch1)
        with (bowkris)
        {
            scr_oflash_ch1()
            a = scr_afterimage_ch1()
            a.hspeed = 5
            a.depth = (depth + 1)
        }
        snd_play_ch1(snd_item_ch1)
        scr_battletext_default_ch1()
        actcon = 20
    }
    if (actcon == 20 && (!instance_exists(obj_writer_ch1)))
    {
        visible = false
        bowcheck = scr_dark_marker_ch1(x, y, spr_checkers_bow_ch1)
        with (bowcheck)
            image_speed = 0.334
        global.fc = 0
        global.typer = 4
        global.msg[0] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_327_0")
        if (ralsei_lecture == false && secondtime == false)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_330_0")
            scr_ralface_ch1(1, 0)
            global.msg[2] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_332_0")
            global.msg[3] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_333_0")
            global.msg[4] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_334_0")
            scr_susface_ch1(5, 0)
            global.msg[6] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_336_0")
            global.msg[7] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_337_0")
            scr_ralface_ch1(8, 1)
            global.msg[9] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_339_0")
            ralsei_lecture = true
        }
        if (thrown == 0 && secondtime == true)
        {
            if (bowcounter == 0)
            {
                global.fc = 2
                global.fe = 3
                global.typer = 45
                global.msg[0] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_349_0")
                global.msg[1] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_350_0")
                scr_susface_ch1(2, 1)
                global.msg[3] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_352_0")
            }
            if (bowcounter == 1)
            {
                global.fc = 2
                global.fe = 3
                global.typer = 45
                global.msg[0] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_359_0")
                global.msg[1] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_360_0")
                scr_susface_ch1(2, 2)
                global.msg[3] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_362_0")
            }
            if (bowcounter == 2)
            {
                global.fc = 2
                global.fe = 8
                global.typer = 45
                global.msg[0] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_369_0")
                global.msg[1] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_370_0")
                scr_susface_ch1(2, 7)
                global.msg[3] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_372_0")
            }
        }
        bowcounter += 1
        scr_battletext_ch1()
        actcon = 21
    }
    if (actcon == 21 && (!instance_exists(obj_writer_ch1)))
    {
        with (bowkris)
            instance_destroy()
        with (bowcheck)
            instance_destroy()
        visible = true
        with (obj_herokris_ch1)
            visible = true
        actcon = 1
    }
    if (secondtime == false)
    {
        if (acting == 3 && actcon == 0)
        {
            crown += 20
            global.msg[0] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_398_0")
            with (obj_herokris_ch1)
                visible = false
            with (obj_heroralsei_ch1)
                visible = false
            global.faceaction[0] = 0
            global.charaction[0] = 0
            global.faceaction[1] = 0
            global.charaction[1] = 0
            bowkris = scr_dark_marker_ch1(obj_herokris_ch1.x, obj_herokris_ch1.y, spr_krisb_bow_ch1)
            with (bowkris)
            {
                scr_oflash_ch1()
                a = scr_afterimage_ch1()
                a.hspeed = 5
                a.depth = (depth + 1)
            }
            bowral = scr_dark_marker_ch1(obj_heroralsei_ch1.x, obj_heroralsei_ch1.y, spr_ralseib_bow_ch1)
            with (bowral)
            {
                scr_oflash_ch1()
                a = scr_afterimage_ch1()
                a.hspeed = 5
                a.depth = (depth + 1)
            }
            snd_play_ch1(snd_item_ch1)
            scr_battletext_default_ch1()
            actcon = 30
        }
    }
    if (actcon == 30 && (!instance_exists(obj_writer_ch1)))
    {
        visible = false
        bowcheck = scr_dark_marker_ch1(x, y, spr_checkers_bow_ch1)
        with (bowcheck)
            image_speed = 0.5
        global.msg[0] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_442_0")
        if (ralsei_lecture == false && secondtime == false)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_445_0")
            scr_ralface_ch1(1, 0)
            global.msg[2] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_447_0")
            global.msg[3] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_448_0")
            global.msg[4] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_449_0")
            scr_susface_ch1(5, 0)
            global.msg[6] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_451_0")
            global.msg[7] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_452_0")
            scr_ralface_ch1(8, 1)
            global.msg[9] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_454_0")
            ralsei_lecture = true
        }
        scr_battletext_default_ch1()
        actcon = 31
    }
    if (actcon == 31 && (!instance_exists(obj_writer_ch1)))
    {
        with (bowral)
            instance_destroy()
        with (bowkris)
            instance_destroy()
        with (bowcheck)
            instance_destroy()
        visible = true
        with (obj_heroralsei_ch1)
            visible = true
        with (obj_herokris_ch1)
            visible = true
        actcon = 1
    }
    if (secondtime == true)
    {
        if (acting == 3 && actcon == 0)
        {
            if (thrown == 1)
            {
                with (trsus)
                    instance_destroy()
                thrown = 2
            }
            if (thrown > 0)
            {
                global.actname[myself][2] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_487_0")
                global.msg[0] = ((scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_489_0") + scr_get_input_name_ch1(6)) + scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_489_1"))
                flash = false
                becomeflash = false
                scr_battletext_default_ch1()
                actcon = 90
                instance_create_ch1(x, y, obj_throwtarget_ch1)
                throwsus = instance_create_ch1(obj_herosusie_ch1.x, obj_herosusie_ch1.y, obj_throwralsei_ch1)
                visible = false
                global.faceaction[1] = 0
                global.charaction[1] = 0
                global.faceaction[2] = 0
                global.charaction[2] = 0
                with (obj_herosusie_ch1)
                    visible = false
                with (obj_heroralsei_ch1)
                    visible = false
                snd_play_ch1(snd_grab_ch1)
            }
            else
            {
                global.typer = 31
                global.fc = 2
                global.fe = 6
                global.msg[0] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_510_0")
                scr_susface_ch1(1, 0)
                global.msg[2] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_512_0")
                global.msg[3] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_513_0")
                scr_ralface_ch1(4, 8)
                global.msg[5] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_515_0")
                global.msg[6] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_516_0")
                scr_susface_ch1(7, 2)
                global.msg[8] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_518_0")
                actcon = 10
                scr_battletext_ch1()
            }
        }
    }
    if (acting == 4 && actcon == 0)
    {
        actcon = 1
        global.msg[0] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_531_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_532_0")
        if (warned == true)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_535_0")
            global.msg[1] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_536_0")
        }
        if (warned == 2)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_540_0")
            global.msg[1] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_541_0")
            global.msg[2] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_542_0")
            global.battleat[2] *= 1.5
        }
        warned += 1
        scr_battletext_default_ch1()
    }
    if (actcon == 1 && (!instance_exists(obj_writer_ch1)))
    {
        actcon = 0
        if (crown >= 100)
        {
            global.mercymod[myself] = 999
            actcon = 50
        }
        else
            scr_attackphase_ch1()
    }
    if (actcon == 10 && (!instance_exists(obj_writer_ch1)))
    {
        actcon = 11
        alarm[4] = 30
        with (obj_herosusie_ch1)
            visible = false
        with (obj_heroralsei_ch1)
            visible = false
        thrown = 1
        trsus = scr_dark_marker_ch1(obj_herosusie_ch1.x, obj_herosusie_ch1.y, spr_susieb_throwralseiready_ch1)
        snd_play_ch1(snd_grab_ch1)
    }
    if (actcon == 12)
    {
        global.fe = 7
        global.msg[0] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_578_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_checkers_enemy_slash_Step_0_gml_579_0")
        scr_battletext_ch1()
        actcon = 13
    }
    if (actcon == 13 && (!instance_exists(obj_writer_ch1)))
        actcon = 0
    if (actcon == 50)
    {
        visible = false
        snd_free_all_ch1()
        animtest = instance_create_ch1(x, y, obj_checker_animtest_ch1)
        animtest.sprite_index = spr_smallchecker_transform3_ch1
        animtest.image_xscale = 2
        animtest.image_yscale = 2
        animtest.type = 1
        actcon = 51
    }
}
if (global.myfight == 7)
    hspeed = 15
