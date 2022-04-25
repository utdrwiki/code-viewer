if (global.monster[myself] == true)
{
    if (global.mnfight == 1 && talked == false)
    {
        scr_randomtarget_ch1()
        if (!instance_exists(obj_darkener_ch1))
            instance_create_ch1(0, 0, obj_darkener_ch1)
        global.typer = 50
        rr = choose(0, 1, 2, 3)
        rando = floor(random(50))
        if (rando == 0)
            rr = 4
        if (rr == 0)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_rabbick_enemy_slash_Step_0_gml_13_0")
        if (rr == 1)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_rabbick_enemy_slash_Step_0_gml_14_0")
        if (rr == 2)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_rabbick_enemy_slash_Step_0_gml_15_0")
        if (rr == 3)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_rabbick_enemy_slash_Step_0_gml_16_0")
        if (rr == 4)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_rabbick_enemy_slash_Step_0_gml_17_0")
        if (blown == 1)
        {
            if (rr == 0 || rr == 4)
                global.msg[0] = scr_84_get_lang_string_ch1("obj_rabbick_enemy_slash_Step_0_gml_21_0")
            if (rr == 1)
                global.msg[0] = scr_84_get_lang_string_ch1("obj_rabbick_enemy_slash_Step_0_gml_22_0")
            if (rr == 2)
                global.msg[0] = scr_84_get_lang_string_ch1("obj_rabbick_enemy_slash_Step_0_gml_23_0")
            if (rr == 3)
                global.msg[0] = scr_84_get_lang_string_ch1("obj_rabbick_enemy_slash_Step_0_gml_24_0")
        }
        scr_enemyblcon_ch1((x - 160), y, 3)
        talked = true
        talktimer = 0
    }
    if (talked == true && global.mnfight == 1)
    {
        rtimer = 0
        scr_blconskip_ch1(15)
        if (global.mnfight == 2)
        {
            if (!instance_exists(obj_moveheart_ch1))
                scr_moveheart_ch1()
            if (!instance_exists(obj_growtangle_ch1))
                instance_create_ch1((__view_get((0 << 0), 0) + 320), (__view_get((1 << 0), 0) + 170), obj_growtangle_ch1)
        }
    }
    if (global.mnfight == 2 && attacked == false)
    {
        rtimer += 1
        if (rtimer == 12)
        {
            rr = choose(0, 1)
            if (rr == 0)
            {
                dc = instance_create_ch1(x, y, obj_dbulletcontroller_ch1)
                dc.type = 30
                dc.target = mytarget
                dc.damage = (global.monsterat[myself] * 5)
                dc.grazepoints = 9
                dc.timepoints = 3
            }
            else
            {
                dc = instance_create_ch1(x, y, obj_dbulletcontroller_ch1)
                dc.type = 32
                dc.target = mytarget
                dc.damage = (global.monsterat[myself] * 5)
                dc.grazepoints = 9
                dc.timepoints = 3
            }
            turns += 1
            global.turntimer = 170
            attacked = true
            global.typer = 6
            global.fc = 0
            rr = choose(0, 1, 2, 3)
            if (rr == 0)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_rabbick_enemy_slash_Step_0_gml_79_0")
            if (rr == 1)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_rabbick_enemy_slash_Step_0_gml_80_0")
            if (rr == 2)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_rabbick_enemy_slash_Step_0_gml_81_0")
            if (rr == 3)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_rabbick_enemy_slash_Step_0_gml_82_0")
            if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 3))
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_rabbick_enemy_slash_Step_0_gml_83_0")
            if (global.mercymod[myself] >= global.mercymax[myself])
                global.msg[0] = scr_84_get_lang_string_ch1("obj_rabbick_enemy_slash_Step_0_gml_84_0")
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
if (global.myfight == 3)
{
    xx = __view_get((0 << 0), 0)
    yy = __view_get((1 << 0), 0)
    if (acting == true && actcon == 0)
    {
        actcon = 1
        global.msg[0] = scr_84_get_lang_string_ch1("obj_rabbick_enemy_slash_Step_0_gml_118_0")
        scr_battletext_default_ch1()
    }
    if (acting == 2 && actcon == 0)
    {
        blowall = 0
        input_name = scr_get_input_name_ch1(4)
        global.msg[0] = scr_84_get_subst_string_ch1(scr_84_get_lang_string_ch1("obj_rabbick_enemy_slash_Step_0_gml_128_0"), input_name)
        if (blown == 0)
        {
            actcon = 10
            blowing = 1
            blowtimer = 90
            scr_battletext_default_ch1()
        }
        if (blown == 1)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_rabbick_enemy_slash_Step_0_gml_138_0")
            scr_battletext_default_ch1()
            actcon = 20
        }
    }
    if (acting == 3 && actcon == 0)
    {
        blowall = 1
        input_name = scr_get_input_name_ch1(4)
        global.msg[0] = scr_84_get_subst_string_ch1(scr_84_get_lang_string_ch1("obj_rabbick_enemy_slash_Step_0_gml_150_0"), input_name)
        actcon = 10
        blowing = 1
        blowtimer = 90
        obj_rabbick_enemy_ch1.bunnycount = 0
        obj_rabbick_enemy_ch1.bunnyid = id
        with (obj_rabbick_enemy_ch1)
        {
            if (blown == 0)
                bunnyid.bunnycount += 1
            blowbuffer = 2
            blow_wait = 0
            blowall = 1
            blowing = 1
            blowtimer = 90
        }
        if (bunnycount == 0)
        {
            with (obj_rabbick_enemy_ch1)
            {
                blowing = 0
                blowtimer = -1
                actcon = 30
                global.msg[0] = scr_84_get_lang_string_ch1("obj_rabbick_enemy_slash_Step_0_gml_175_0")
            }
        }
        scr_battletext_default_ch1()
    }
    if (acting == 4 && actcon == 0)
    {
        actcon = 1
        global.msg[0] = scr_84_get_lang_string_ch1("obj_rabbick_enemy_slash_Step_0_gml_186_0")
        if (scr_monsterpop_ch1() > 1)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_rabbick_enemy_slash_Step_0_gml_188_0")
        for (i = 0; i < 3; i += 1)
        {
            global.monstercomment[i] = scr_84_get_lang_string_ch1("obj_rabbick_enemy_slash_Step_0_gml_191_0")
            global.automiss[i] = true
        }
        scr_battletext_default_ch1()
    }
    if (actcon == 10 && blowing == 0)
    {
        with (obj_writer_ch1)
            instance_destroy()
        actcon = 1
    }
    if (actcon == 20 && (!instance_exists(obj_writer_ch1)))
    {
        event_user(10)
        actcon = 1
    }
    if (actcon == 30 && (!instance_exists(obj_writer_ch1)))
    {
        with (obj_rabbick_enemy_ch1)
            event_user(10)
        actcon = 1
    }
    if (actcon == 1 && (!instance_exists(obj_writer_ch1)))
    {
        actcon = 0
        scr_attackphase_ch1()
    }
    if (blowing == 1)
    {
        if (blow_wait == 1)
            blowtimer -= 1
        blowbuffer -= 1
        if (blowamt > 0 && blowanimtimer <= 0)
            blowamt -= 1
        if (blowbuffer <= 0 && button1_p_ch1())
        {
            blow_wait = 1
            snd_stop_ch1(snd_whistlebreath_ch1)
            blowsnd = snd_play_ch1(snd_whistlebreath_ch1)
            snd_pitch_ch1(blowsnd, (1 + (blowamt / 100)))
            onoff = 0
            shakeamt = 5
            blowamt += 12
            blowbuffer = 2
            blowanimtimer = 20
            repeat (6)
                event_user(2)
        }
        if (blowtimer <= 0)
            blowing = 0
        if (blowamt >= 100)
        {
            if (blown == 0)
            {
                scr_mercyadd_ch1(myself, 100)
                blown = 1
                blowing = 0
                blowanimtimer = 0
                repeat (15)
                    event_user(2)
            }
        }
        if (blowing == 0)
        {
        }
    }
}
