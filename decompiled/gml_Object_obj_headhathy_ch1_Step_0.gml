if (global.monster[myself] == true)
{
    if (global.mnfight == 1 && talked == false)
    {
        scr_randomtarget_ch1()
        if (!instance_exists(obj_darkener_ch1))
            instance_create_ch1(0, 0, obj_darkener_ch1)
        hb = instance_create_ch1((x - 100), y, obj_heartblcon_ch1)
        hb.sprite_index = choose(3994, 3995)
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
            global.turntimer = 180
            if (rr == 1)
            {
                dc = instance_create_ch1(x, y, obj_spinheart_ch1)
                dc.joker = 1
                dc.type = 0
                dc.target = mytarget
                dc.damage = (global.monsterat[myself] * 5)
            }
            else
            {
                dc = instance_create_ch1(x, y, obj_dbulletcontroller_ch1)
                dc.type = 33
                dc.ratio = (1.3 - (instance_number(object_index) / 10))
                dc.target = mytarget
                dc.damage = (global.monsterat[myself] * 5)
                if (instance_number(object_index) > 1 && instance_number(obj_dbulletcontroller_ch1) > 1)
                {
                    with (dc)
                        instance_destroy()
                }
            }
            turns += 1
            attacked = true
            global.typer = 6
            global.fc = 0
            rr = choose(0, 1, 2, 3, 4)
            if (rr == 0)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_87_0")
            if (rr == 1)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_88_0")
            if (rr == 2)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_89_0")
            if (rr == 3)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_90_0")
            if (rr == 4)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_91_0")
            if (global.monsterstatus[myself] == true)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_92_0")
            if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 3))
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_93_0")
            if (global.mercymod[myself] >= global.mercymax[myself])
                global.msg[0] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_94_0")
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
        global.msg[0] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_135_0")
        scr_battletext_default_ch1()
    }
    if (acting == 2 && actcon == 0)
    {
        rr = choose(0, 1, 2)
        global.msg[0] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_144_0")
        scr_mercyadd_ch1(myself, 100)
        scr_battletext_default_ch1()
        battlecancel = 1
        actcon = 1
    }
    if (acting == 3 && actcon == 0)
    {
        scr_mercyadd_ch1(myself, 100)
        actcon = 1
        if (global.flag[504] == 0)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_159_0")
            scr_susface_ch1(1, 0)
            global.msg[2] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_161_0")
            global.msg[3] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_162_0")
            scr_ralface_ch1(4, 6)
            global.msg[5] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_164_0")
            scr_susface_ch1(6, 7)
            global.msg[7] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_166_0")
            scr_ralface_ch1(8, 6)
            global.msg[9] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_168_0")
            scr_susface_ch1(10, 7)
            global.msg[11] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_170_0")
            global.msg[12] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_171_0")
            actcon = 20
            acttimer = 0
        }
        if (global.flag[504] == 1)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_179_0")
            scr_susface_ch1(1, 2)
            global.msg[2] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_181_0")
            scr_ralface_ch1(3, 1)
            global.msg[4] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_183_0")
            global.msg[5] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_184_0")
            global.msg[6] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_185_0")
            global.msg[7] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_186_0")
            actcon = 22
        }
        if (global.flag[504] == 2)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_192_0")
            scr_susface_ch1(1, 7)
            global.msg[2] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_194_0")
            actcon = 25
        }
        if (global.flag[504] >= 3)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_200_0")
            scr_mercyadd_ch1(0, 100)
            scr_mercyadd_ch1(1, 100)
            scr_mercyadd_ch1(2, 100)
        }
        global.flag[504] += 1
        scr_battletext_default_ch1()
    }
    if (actcon == 1 && (!instance_exists(obj_writer_ch1)))
    {
        actcon = 0
        scr_attackphase_ch1()
        if (delete_n == 1)
            instance_destroy()
    }
    if (actcon == 20 && (!instance_exists(obj_writer_ch1)))
    {
        snd_pause_ch1(global.batmusic[0])
        acttimer += 1
        if (acttimer >= 60)
            actcon = 21
    }
    if (actcon == 21)
    {
        global.fe = 2
        global.msg[0] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_241_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_242_0")
        scr_battletext_ch1()
        actcon = 22
    }
    if (actcon == 22 && (!instance_exists(obj_writer_ch1)))
    {
        snd_resume_ch1(global.batmusic[0])
        hspeed = 6
        global.msg[0] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_251_0")
        scr_susface_ch1(1, 7)
        global.msg[2] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_253_0")
        if (global.flag[504] == 2)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_256_0")
            scr_ralface_ch1(1, 3)
            global.msg[2] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_258_0")
            scr_susface_ch1(3, 2)
            global.msg[4] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_260_0")
        }
        scr_battletext_default_ch1()
        delete_n = 1
        actcon = 23
        global.monster[myself] = false
    }
    if (actcon == 23)
    {
        if (x >= (__view_get((0 << 0), 0) + 640))
            actcon = 1
    }
    if (actcon == 25 && (!instance_exists(obj_writer_ch1)))
    {
        global.msg[0] = scr_84_get_lang_string_ch1("obj_headhathy_slash_Step_0_gml_276_0")
        scr_battletext_default_ch1()
        scr_mercyadd_ch1(0, 100)
        scr_mercyadd_ch1(1, 100)
        scr_mercyadd_ch1(2, 100)
        actcon = 1
    }
}
if (global.myfight == 7)
    hspeed = 15
