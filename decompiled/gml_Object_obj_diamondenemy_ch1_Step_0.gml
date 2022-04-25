if (global.monster[myself] == true)
{
    if (global.mnfight == 1 && talked == false)
    {
        scr_randomtarget_ch1()
        if (!instance_exists(obj_darkener_ch1))
            instance_create_ch1(0, 0, obj_darkener_ch1)
        global.typer = 50
        rr = choose(0, 1, 2, 3)
        if (rr == 0)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_11_0")
        if (rr == 1)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_12_0")
        if (rr == 2)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_13_0")
        if (rr == 3)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_14_0")
        if (acting == 2)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_24_0")
        if (acting == 3)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_28_0")
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
                dc.type = 0
                dc.target = mytarget
                dc.damage = (global.monsterat[myself] * 5)
            }
            else
            {
                dc = instance_create_ch1(x, y, obj_dbulletcontroller_ch1)
                dc.type = 1
                dc.target = mytarget
                dc.damage = (global.monsterat[myself] * 5)
            }
            turns += 1
            global.turntimer = 140
            attacked = true
            global.typer = 6
            global.fc = 0
            rr = choose(0, 1, 2, 3, 4)
            if (rr == 0)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_77_0")
            if (rr == 1)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_78_0")
            if (rr == 2)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_79_0")
            if (rr == 3)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_80_0")
            if (rr == 4)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_81_0")
            if (global.monsterstatus[myself] == true)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_82_0")
            if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 3))
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_83_0")
            if (global.mercymod[myself] >= global.mercymax[myself])
                global.msg[0] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_84_0")
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
if (con == 1)
{
    con = 2
    alarm[4] = 10
}
if (con == 3)
{
    global.typer = 50
    global.mercymod[myself] = 999
    global.msg[0] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_118_0")
    scr_enemyblcon_ch1((x - 160), y, 3)
    con = 4
}
if (con == 4 && (!instance_exists(obj_writer_ch1)))
{
    hspeed = 15
    con = 5
    alarm[4] = 15
    with (obj_battlecontroller_ch1)
        alarm[2] = 17
}
if (con == 6)
{
    with (obj_battlecontroller_ch1)
        noreturn = false
    scr_monsterdefeat_ch1()
    instance_destroy()
    con = 7
}
if (global.myfight == 3)
{
    xx = __view_get((0 << 0), 0)
    yy = __view_get((1 << 0), 0)
    if (acting == true && actcon == 0)
    {
        actcon = 1
        global.msg[0] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_154_0")
        scr_battletext_default_ch1()
    }
    if (acting == 2 && actcon == 0)
    {
        if (nexttry == true)
            global.flag[208] = 1
        global.msg[0] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_163_0")
        scr_mercyadd_ch1(myself, 100)
        scr_battletext_default_ch1()
        actcon = 1
    }
    if (acting == 3 && actcon == 0)
    {
        global.msg[0] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_173_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_174_0")
        for (i = 0; i < 3; i += 1)
        {
            global.monstercomment[i] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_177_0")
            global.monsterstatus[i] = true
        }
        scr_mercyadd_ch1(myself, 50)
        scr_battletext_default_ch1()
        actcon = 1
    }
    if (acting == 4 && actcon == 0)
    {
        actcon = 1
        global.msg[0] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_188_0")
        if (scr_monsterpop_ch1() > 1)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_190_0")
        for (i = 0; i < 3; i += 1)
        {
            global.monstercomment[i] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_193_0")
            global.automiss[i] = true
        }
        scr_battletext_default_ch1()
    }
    if (actcon == 1 && (!instance_exists(obj_writer_ch1)))
    {
        actcon = 0
        scr_attackphase_ch1()
    }
    if (actcon == 10 && instance_exists(obj_writer_ch1) == 0)
    {
        global.typer = 50
        global.msg[0] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_215_0")
        scr_enemyblcon_ch1((x - 160), y, 3)
        actcon = 11
    }
    if (actcon == 11 && instance_exists(obj_writer_ch1) == 0)
    {
        global.typer = 45
        global.fc = 2
        global.fe = 8
        global.msg[0] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_225_0")
        scr_battletext_ch1()
        actcon = 12
    }
    if (actcon == 12 && instance_exists(obj_writer_ch1) == 0)
    {
        global.typer = 50
        global.msg[0] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_233_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_234_0")
        scr_enemyblcon_ch1((x - 160), y, 3)
        actcon = 14
    }
    if (actcon == 14 && instance_exists(obj_writer_ch1) == 0)
    {
        global.typer = 45
        global.fc = 2
        global.fe = 3
        global.msg[0] = scr_84_get_lang_string_ch1("obj_diamondenemy_slash_Step_0_gml_244_0")
        scr_battletext_ch1()
        nexttry = true
        actcon = 1
    }
}
if (global.myfight == 7)
    hspeed = 15
