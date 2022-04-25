if (room == room_field2_ch1)
{
    if (obj_mainchara_ch1.x >= x && global.interact == 0 && con == 0)
    {
        global.fc = 5
        global.typer = 32
        global.interact = 1
        if (global.flag[210] == 1)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_11_0")
            scr_ralface_ch1(1, "B")
            global.msg[2] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_13_0")
            scr_lanface_ch1(3, 3)
            global.msg[4] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_15_0")
        }
        else
        {
            global.fe = 6
            global.msg[0] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_20_0")
            scr_ralface_ch1(1, "B")
            global.msg[2] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_22_0")
            scr_lanface_ch1(3, 2)
            global.msg[4] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_24_0")
            global.flag[210] = 2
        }
        if (global.plot < 34)
            global.plot = 34
        con = 1
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
    }
    if (con == 1 && d_ex_ch1() == 0)
    {
        global.interact = 0
        instance_destroy()
    }
}
if (room == room_field2A_ch1 || room == room_field_puzzle1_ch1)
{
    if instance_exists(candytree)
    {
        siner += 1
        candytree.image_alpha = (0.7 + (sin((siner / 8)) * 0.3))
        candytree.image_index = global.flag[candyflag]
        if (global.flag[candyflag] >= 2)
        {
            with (candytree)
                instance_destroy()
            instance_destroy()
        }
    }
}
if (room == room_krishallway_ch1)
    event_user(3)
if (room == room_town_krisyard_ch1)
    event_user(3)
if (room == room_torhouse_ch1)
{
    timer += 1
    event_user(3)
    if (timer >= 5 && global.interact == 0 && con == 0 && rem_facing == 3)
    {
        if (global.flag[277] == 7)
        {
            global.typer = 7
            global.fc = 4
            global.fe = 0
            global.flag[277] += 1
            global.interact = 1
            con = 1
            global.msg[0] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_71_0")
            global.msg[1] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_72_0")
            instance_create_ch1(0, 0, obj_dialoguer_ch1)
        }
        if (global.flag[277] >= 2 && global.flag[277] <= 6)
        {
            global.flag[277] += 1
            con = 2
        }
        if (global.flag[277] == 1)
        {
            global.typer = 7
            global.fc = 4
            global.fe = 0
            global.flag[277] += 1
            global.interact = 1
            con = 1
            global.msg[0] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_91_0")
            global.msg[1] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_92_0")
            global.msg[2] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_93_0")
            instance_create_ch1(0, 0, obj_dialoguer_ch1)
        }
        if (global.flag[277] == 0)
        {
            global.typer = 7
            global.fc = 4
            global.fe = 0
            global.flag[277] += 1
            global.interact = 1
            con = 1
            global.msg[0] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_106_0")
            global.msg[1] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_107_0")
            global.msg[2] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_108_0")
            global.msg[3] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_109_0")
            global.msg[4] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_110_0")
            instance_create_ch1(0, 0, obj_dialoguer_ch1)
        }
    }
    if (con == 1 && (!d_ex_ch1()))
    {
        con = 2
        global.interact = 0
    }
}
if (room == room_cc_prison_prejoker_ch1)
{
    m = ((obj_mainchara_ch1.x - 200) / 1400)
    if (m < 0.2)
        m = 0.2
    if (m < maxm)
        m = maxm
    if (m >= 0.8)
        m = 0.8
    maxm = m
    mus_volume_ch1(global.currentsong[1], m, 0)
    if (con == 5 && (!d_ex_ch1()))
    {
        doorimg2 = scr_dark_marker_ch1(doorimg.x, doorimg.y, spr_jokerdoor_ch1)
        with (doorimg2)
        {
            depth = 400000
            image_alpha = 0
            image_index = 1
        }
        con = 6
        timer = 0
        snd_play_ch1(snd_magicsprinkle_ch1)
    }
    if (con == 6)
    {
        global.interact = 1
        with (doorimg2)
            image_alpha += 0.03
        timer += 1
        if (timer >= 80)
            con = 7
    }
    if (con == 7)
    {
        timer = 0
        global.typer = 6
        global.fc = 0
        global.msg[0] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_163_0")
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
        con = 8
    }
    if (con == 8 && (!d_ex_ch1()))
    {
        with (doorimg)
            image_index = 2
        with (doorimg2)
            instance_destroy()
        instance_create_ch1(0, 0, obj_shake_ch1)
        snd_play_ch1(snd_dooropen_ch1)
        snd_play_ch1(snd_locker_ch1)
        con = 9
        alarm[4] = 60
    }
    if (con == 10)
    {
        with (doorsolid)
            instance_destroy()
        with (doorevent)
            instance_destroy()
        door_door = instance_create_ch1((x + 15), y, obj_doorA_ch1)
        global.interact = 0
        con = 11
    }
    if (con == 20 && (!d_ex_ch1()))
    {
        snd_play_ch1(snd_creepyjingle_ch1)
        con = 21
    }
}
if (room == room_cc_prefountain_ch1)
{
    timer += 1
    if (global.flag[248] == 1)
    {
        if (obj_mainchara_ch1.x <= 30 && global.interact == 0 && con == 0)
        {
            con = 1
            global.facing = 1
            global.interact = 1
            global.typer = 30
            obj_mainchara_ch1.x = 32
            global.fc = 1
            global.fe = 0
            global.msg[0] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_212_0")
            global.msg[1] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_213_0")
            if (talked >= true && timer >= 900)
            {
                global.fe = 3
                global.msg[0] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_217_0")
            }
            instance_create_ch1(0, 0, obj_dialoguer_ch1)
        }
        if (con == 1 && (!d_ex_ch1()))
        {
            global.interact = 0
            con = 0
            talked += 1
        }
    }
    if (global.flag[248] == 0)
    {
        if (global.plot < 244)
        {
            if (obj_mainchara_ch1.x <= 30 && global.interact == 0 && con == 0 && global.plot <= 240)
            {
                con = 1
                global.facing = 1
                global.interact = 1
                global.typer = 30
                global.fc = 1
                global.fe = 0
                global.msg[0] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_248_0")
                global.msg[1] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_249_0")
                global.msg[2] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_250_0")
                global.msg[3] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_251_0")
                global.msg[4] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_252_0")
                global.msg[5] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_253_0")
                global.msg[6] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_254_0")
                instance_create_ch1(0, 0, obj_dialoguer_ch1)
                global.plot = 241
            }
            if (obj_mainchara_ch1.y <= 280 && global.interact == 0 && con == 0)
            {
                con = 1
                global.facing = 0
                global.interact = 1
                global.typer = 30
                obj_mainchara_ch1.y = 282
                global.fc = 1
                global.fe = 0
                if (global.plot >= 241)
                {
                    global.fe = 2
                    global.msg[0] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_272_0")
                }
                else
                {
                    global.msc = 445
                    scr_text_ch1(global.msc)
                }
                instance_create_ch1(0, 0, obj_dialoguer_ch1)
                if (global.plot <= 240)
                    global.plot = 241
            }
            if (con == 1 && (!d_ex_ch1()))
            {
                global.interact = 0
                con = 0
                talked += 1
            }
        }
        if (global.plot >= 244)
        {
            if (obj_mainchara_ch1.x <= 30 && global.interact == 0 && con == 0)
            {
                con = 1
                global.facing = 1
                global.interact = 1
                global.typer = 30
                obj_mainchara_ch1.x = 32
                global.fc = 1
                global.fe = 0
                global.msg[0] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_307_0")
                global.msg[1] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_308_0")
                instance_create_ch1(0, 0, obj_dialoguer_ch1)
            }
            if (con == 1 && (!d_ex_ch1()))
            {
                global.interact = 0
                con = 0
                talked += 1
            }
        }
    }
}
if (room == room_forest_savepoint3_ch1)
{
    if (con == 10)
    {
        snd_free_all_ch1()
        con = 10.5
        snd_play_ch1(snd_hurt1_ch1)
    }
    if (con == 11.5)
    {
        ll = snd_play_ch1(snd_lancerlaugh_ch1)
        sl = snd_play_ch1(snd_suslaugh_ch1)
        snd_volume_ch1(ll, 0.8, 0)
        snd_volume_ch1(sl, 0.8, 0)
        con = 12
        alarm[4] = 60
    }
    if (con == 13)
    {
        instance_create_ch1(0, 0, obj_fadein_ch1)
        with (blackmarker)
            instance_destroy()
        global.interact = 0
        con = 13
        instance_destroy()
    }
}
if (room == room_field_secret1_ch1)
{
    if (pcon == 0 && global.interact == 0)
    {
        if (puzzle.won == 1 && pcon == 0)
        {
            with (spike_solid)
                instance_destroy()
            global.interact = 1
            pcon = 1
            with (spikee[0])
                image_index = 1
            with (spikee[1])
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
            pcon = 3
            global.interact = 0
        }
    }
}
if (room == room_forest_beforeclover_ch1)
{
    if (pcon == 0 && global.interact == 0)
    {
        if (puzzle.won == 1 && pcon == 0 && global.flag[290] == 0)
        {
            with (spike_solid)
                instance_destroy()
            global.interact = 1
            pcon = 1
            with (spikee[0])
                image_index = 1
            with (spikee[1])
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
            global.flag[290] = 1
            ptimer = 0
            pcon = 3
            global.interact = 0
        }
    }
}
if (room == room_forest_savepoint_relax_ch1)
{
    if (obj_mainchara_ch1.y <= 40 && global.plot < 85 && global.interact == 0 && con == 1)
    {
        global.interact = 1
        global.typer = 32
        global.fe = 2
        global.fc = 5
        global.msg[0] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_437_0")
        scr_susface_ch1(1, 1)
        global.msg[2] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_439_0")
        global.msg[3] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_440_0")
        scr_lanface_ch1(4, 3)
        global.msg[5] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_442_0")
        con = 2
        d_make_ch1()
    }
    if (con == 2 && (!d_ex_ch1()))
    {
        global.plot = 85
        global.interact = 0
        con = 3
    }
}
if (room == room_forest_maze_susie_ch1)
{
    if (con == 1 && obj_mainchara_ch1.y <= (y + 120) && global.interact == 0)
    {
        global.fc = 1
        global.fe = 2
        global.typer = 30
        global.msg[0] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_461_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_462_0")
        scr_ralface_ch1(2, 8)
        global.msg[3] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_464_0")
        scr_susface_ch1(4, 9)
        global.msg[5] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_466_0")
        global.msg[6] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_467_0")
        global.msg[7] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_468_0")
        scr_lanface_ch1(8, 3)
        global.msg[9] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_470_0")
        scr_ralface_ch1(10, 1)
        global.msg[11] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_472_0")
        scr_susface_ch1(12, 6)
        global.msg[13] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_474_0")
        global.msg[14] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_475_0")
        global.msg[15] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_476_0")
        if (global.plot < 100)
            global.plot = 100
        global.interact = 1
        con = 2
        d_make_ch1()
    }
    if (con == 2 && (!d_ex_ch1()))
    {
        sprite_index = spr_susieu_dark_ch1
        vspeed = -10
        image_speed = 0.25
        con = 3
        alarm[4] = 30
    }
    if (con == 4)
    {
        global.fc = 2
        global.fe = 6
        global.typer = 31
        global.msg[0] = scr_84_get_lang_string_ch1("obj_event_room_slash_Step_0_gml_497_0")
        d_make_ch1()
        con = 5
    }
    if (con == 5 && (!d_ex_ch1()))
    {
        global.interact = 0
        global.facing = 0
        con = 6
    }
}
