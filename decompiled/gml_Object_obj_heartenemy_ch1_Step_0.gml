if (global.monster[myself] == true)
{
    if (global.mnfight == 1 && talked == false)
    {
        scr_randomtarget_ch1()
        if (!instance_exists(obj_darkener_ch1))
            instance_create_ch1(0, 0, obj_darkener_ch1)
        hb = instance_create_ch1((x - 100), y, obj_heartblcon_ch1)
        hb.sprite_index = choose(3890, 3891)
        if (acting == 2)
            hb.sprite_index = spr_heartblcon_2_ch1
        if (acting == 3)
            hb.sprite_index = spr_heartblcon_3_ch1
        talked = true
        talktimer = 0
    }
    if (talked == true && global.mnfight == 1)
    {
        rtimer = 0
        if (button1_p_ch1() && talktimer > 15)
            talktimer = talkmax
        talktimer += 1
        if (talktimer >= talkmax)
        {
            with (obj_heartblcon_ch1)
                instance_destroy()
            global.mnfight = 2
        }
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
        with (obj_heartblcon_ch1)
            instance_destroy()
        rtimer += 1
        if (rtimer == 12)
        {
            rr = scr_monsterpop_ch1()
            global.turntimer = 140
            if (rr == 1)
            {
                dc = instance_create_ch1(x, y, obj_spinheart_ch1)
                dc.type = 0
                dc.target = mytarget
                dc.damage = (global.monsterat[myself] * 5)
            }
            else
            {
                dc = instance_create_ch1(x, y, obj_heartshaper_ch1)
                dc.type = 0
                dc.target = mytarget
                dc.damage = (global.monsterat[myself] * 5)
                if (global.encounterno == 9)
                    global.turntimer = 100
            }
            turns += 1
            attacked = true
            global.typer = 6
            global.fc = 0
            rr = choose(0, 1, 2, 3, 4)
            if (rr == 0)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_79_0")
            if (rr == 1)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_80_0")
            if (rr == 2)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_81_0")
            if (rr == 3)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_82_0")
            if (rr == 4)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_83_0")
            if (global.monsterstatus[myself] == true)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_84_0")
            if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 3))
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_85_0")
            if (global.mercymod[myself] >= global.mercymax[myself])
                global.msg[0] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_86_0")
        }
        else
            global.turntimer = 120
    }
    if (global.mnfight == 2)
    {
        if (global.turntimer <= 1)
        {
            if (instance_exists(obj_hathyfightevent_ch1) && firstturn == 0)
            {
                if (checkhp1 <= global.hp[1])
                {
                    if (checkhp2 <= global.hp[2])
                    {
                        with (obj_battlecontroller_ch1)
                            noreturn = true
                        with (obj_hathyfightevent_ch1)
                            con = 15
                    }
                }
            }
            firstturn = 1
            if (battlecancel == 1)
                global.mercymod[myself] = 999
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
        global.msg[0] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_127_0")
        scr_battletext_default_ch1()
    }
    if (acting == 2 && actcon == 0)
    {
        rr = choose(0, 1, 2)
        global.msg[0] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_136_0")
        if (rr == 1)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_137_0")
        if (rr == 2)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_138_0")
        scr_mercyadd_ch1(myself, 100)
        scr_battletext_default_ch1()
        battlecancel = 1
        actcon = 1
    }
    if (acting == 3 && actcon == 0)
    {
        global.msg[0] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_147_0")
        scr_ralface_ch1(1, 0)
        rr = choose(0, 1, 2)
        global.msg[2] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_150_0")
        if (rr == 1)
            global.msg[2] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_151_0")
        if (rr == 2)
            global.msg[2] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_152_0")
        scr_mercyadd_ch1(0, 100)
        scr_mercyadd_ch1(1, 100)
        scr_mercyadd_ch1(2, 100)
        actcon = 1
        scr_battletext_default_ch1()
    }
    if (acting == 4 && actcon == 0)
    {
        actcon = 1
        if (global.plot < 150)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_168_0")
            if (scr_monsterpop_ch1() > 1)
                global.msg[0] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_170_0")
            for (i = 0; i < 3; i += 1)
            {
                global.monstercomment[i] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_173_0")
                global.automiss[i] = true
            }
        }
        else
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_179_0")
            scr_susface_ch1(1, 2)
            rr = choose(0, 1, 2)
            global.msg[2] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_182_0")
            global.msg[3] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_183_0")
            if (rr == 1)
                global.msg[3] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_184_0")
            if (rr == 2)
                global.msg[3] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_185_0")
            scr_mercyadd_ch1(0, 100)
            scr_mercyadd_ch1(1, 100)
            scr_mercyadd_ch1(2, 100)
        }
        scr_battletext_default_ch1()
    }
    if (actcon == 1 && (!instance_exists(obj_writer_ch1)))
    {
        actcon = 0
        scr_attackphase_ch1()
    }
    if (actcon == 5 && instance_exists(obj_writer_ch1) == 0)
    {
        global.battleat[1] = 90
        global.battleat[2] = 90
        actcon = 6
        with (obj_herosusie_ch1)
        {
            attacktimer = 0
            state = 1
            points = (100 + round(random(40)))
            global.faceaction[myself] = 0
            if (global.automiss[0] == true)
                points = 0
        }
        alarm[4] = 50
    }
    if (actcon == 7)
    {
        global.msg[0] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_223_0")
        scr_ralface_ch1(1, 3)
        global.msg[2] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_225_0")
        if (global.automiss[0] == true)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_228_0")
            scr_ralface_ch1(1, 3)
            global.msg[2] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_230_0")
            global.msg[3] = scr_84_get_lang_string_ch1("obj_heartenemy_slash_Step_0_gml_231_0")
        }
        scr_battletext_ch1()
        actcon = 1
    }
}
if (global.myfight == 7)
    hspeed = 15
