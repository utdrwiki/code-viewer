if (global.monster[myself] == true)
{
    if (global.mnfight == 1 && talked == false)
    {
        scr_randomtarget_ch1()
        global.flag[(51 + myself)] = 4
        global.targeted[mytarget] = true
        if (!instance_exists(obj_darkener_ch1))
            instance_create_ch1(0, 0, obj_darkener_ch1)
        global.typer = 50
        if (turns == 0)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_17_0")
        if (turns == 1)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_18_0")
        if (turns == 2)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_19_0")
        if (turns >= 3)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_20_0")
        if (compliment_just == 1)
        {
            if (compliment == 1)
                global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_26_0")
            if (compliment == 2)
                global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_30_0")
            if (compliment == 3)
                global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_34_0")
            compliment_just = 0
        }
        scr_enemyblcon_ch1((x - 235), (y - 65), 3)
        talked = true
        talktimer = 0
    }
    if (talked == true && global.mnfight == 1)
    {
        if (button1_p_ch1() && talktimer > 15)
            talktimer = talkmax
        talktimer += 1
        if (talktimer >= talkmax)
        {
            if (!instance_exists(obj_moveheart_ch1))
                scr_moveheart_ch1()
            if (!instance_exists(obj_growtangle_ch1))
                instance_create_ch1((__view_get((0 << 0), 0) + 320), (__view_get((1 << 0), 0) + 170), obj_growtangle_ch1)
            with (obj_writer_ch1)
                instance_destroy()
            global.mnfight = 2
        }
    }
    if (global.mnfight == 2 && attacked == false)
    {
        if (attacks == false)
        {
            bike = instance_create_ch1(x, y, obj_lancerbike_ch1)
            visible = false
            bike.racecon = 1
            bike.target = mytarget
            bike.damage = (global.monsterat[myself] * 5)
            attacks = true
        }
        else
        {
            bike = instance_create_ch1(x, y, obj_lancerbike_ch1)
            visible = false
            bike.lcon = 1
            bike.target = mytarget
            bike.damage = (global.monsterat[myself] * 5)
            attacks = false
        }
        turns += 1
        global.turntimer = 999
        attacked = true
        rr = floor(random(5))
        global.typer = 6
        global.fc = 0
        if (rr == 0)
            global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_90_0")
        if (rr == 1)
            global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_91_0")
        if (rr == 2)
            global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_92_0")
        if (rr == 3)
            global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_93_0")
        if (rr == 4)
            global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_94_0")
        if (turns == 1)
        {
            global.typer = 47
            global.fc = 1
            global.fe = 2
            global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_100_0")
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
        global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_118_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_119_0")
        scr_battletext_default_ch1()
    }
    if (acting == 2 && actcon == 0)
    {
        actcon = 1
        if (global.automiss[myself] == false)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_130_0")
            global.automiss[myself] = true
        }
        else
            global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_135_0")
        scr_battletext_default_ch1()
    }
    if (acting == 3 && actcon == 0)
    {
        if (compliment >= 3)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_145_0")
        if (compliment == 2)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_150_0")
            global.msg[1] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_151_0")
            scr_mercyadd_ch1(myself, 20)
        }
        if (compliment == 1)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_157_0")
            global.msg[1] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_158_0")
            scr_mercyadd_ch1(myself, 20)
            global.monsterat[myself] += 1
        }
        if (compliment == 0)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_164_0")
            global.msg[1] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_165_0")
            scr_mercyadd_ch1(myself, 20)
            global.monsterat[myself] -= 1
        }
        compliment_just = 1
        compliment += 1
        scr_battletext_default_ch1()
        actcon = 1
    }
    if (actcon == 1 && (!instance_exists(obj_writer_ch1)))
    {
        actcon = 0
        scr_attackphase_ch1()
    }
}
if (con == 1)
{
    alarm[4] = 5
    con = 2
}
if (con == 3)
{
    global.typer = 50
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_196_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_197_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_198_0")
    global.msg[3] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_199_0")
    global.msg[4] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_200_0")
    global.msg[5] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_201_0")
    global.msg[6] = scr_84_get_lang_string_ch1("obj_lancerboss_slash_Step_0_gml_202_0")
    con = 4
    scr_enemyblcon_ch1((x - 235), (y - 65), 3)
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
    if (global.plot < 22)
        global.plot = 22
    scr_monsterdefeat_ch1()
    instance_destroy()
    con = 7
}
