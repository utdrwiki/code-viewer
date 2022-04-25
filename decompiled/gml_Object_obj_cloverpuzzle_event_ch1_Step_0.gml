if (pcon == 0 && global.interact == 0)
{
    if (puzzle.suit[0] == 4 && puzzle.suit[1] == 1 && puzzle.suit[2] == 2 && global.flag[234] == 0)
    {
        with (blockn)
            instance_destroy()
        global.flag[234] = 1
        global.interact = 1
        pcon = 1
        with (spiken[0])
            image_index = 1
        with (spiken[1])
            image_index = 1
    }
}
if (pcon == 1)
{
    ptimer = 0
    snd_play_ch1(snd_screenshake_ch1)
    instance_create_ch1(0, 0, obj_shake_ch1)
    pcon = 2
}
if (pcon == 2)
{
    ptimer += 1
    if (ptimer >= 20)
    {
        ptimer = 0
        pcon = 0
        global.interact = 0
    }
}
if (con == 0 && global.interact == 0)
{
    if (obj_mainchara_ch1.y <= 80)
    {
        global.facing = 0
        with (global.cinstance[0])
        {
            fun = true
            sprite_index = dsprite
        }
        global.interact = 1
        con = 1
        alarm[4] = 22
        cmarker = scr_dark_marker_ch1(x, y, spr_clubs_idle_ch1)
        with (cmarker)
            depth = 960000
        with (cmarker)
            vspeed = -8
    }
}
if (con == 1)
{
    if (cmarker.y <= 280)
    {
        with (cmarker)
            scr_depth_ch1()
    }
}
if (con == 2)
{
    with (cmarker)
        scr_halt_ch1()
    global.typer = 6
    global.fc = 0
    global.msg[0] = scr_84_get_lang_string_ch1("obj_cloverpuzzle_event_slash_Step_0_gml_78_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_cloverpuzzle_event_slash_Step_0_gml_79_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_cloverpuzzle_event_slash_Step_0_gml_80_0")
    if (global.flag[236] == 1)
    {
        global.msg[0] = scr_84_get_lang_string_ch1("obj_cloverpuzzle_event_slash_Step_0_gml_85_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_cloverpuzzle_event_slash_Step_0_gml_86_0")
    }
    con = 3
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 3 && (!d_ex_ch1()))
{
    with (global.cinstance[0])
        fun = false
    if (global.plot < 75)
        global.plot = 75
    with (obj_cloverhole_ch1)
    {
        sprite_index = spr_cloverhole_ch1
        holecon = 999
        image_index = 0
    }
    cencounter = instance_create_ch1(cmarker.x, cmarker.y, obj_chaseenemy_ch1)
    with (cmarker)
        instance_destroy()
    with (cencounter)
    {
        global.interact = 0
        myencounter = 8
        sprite_index = spr_clubs_idle_ch1
        touchsprite = spr_clubs_idle_ch1
        event_user(0)
    }
    con = 4
}
