if (con == 1)
{
    alarm[4] = 30
    con = 1.5
}
if (con == 2.5)
{
    global.currentsong[0] = snd_init_ch1("mus_school.ogg")
    global.fe = 0
    global.fc = 11
    global.typer = 20
    global.msg[0] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_14_0")
    d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 3
}
if (con == 3 && instance_exists(obj_dialoguer_ch1) == 0)
{
    snd_play_ch1(snd_dooropen_ch1)
    with (door)
        image_index = 1
    con = 4
    with (alphys)
        sprite_index = spr_alphysr_ch1
    alarm[4] = 30
}
if (con == 5)
{
    with (obj_mainchara_ch1)
    {
        fun = true
        sprite_index = spr_krisd_ch1
        image_speed = 0.2
        vspeed = 2
    }
    con = 6
    alarm[4] = 10
}
if (con == 7)
{
    with (obj_mainchara_ch1)
    {
        image_index = 0
        vspeed = 0
        image_speed = 0
    }
    with (door)
        image_index = 0
    snd_play_ch1(snd_doorclose_ch1)
    con = 8
    alarm[4] = 30
}
if (con == 9)
{
    global.msg[0] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_60_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_61_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_62_0")
    con = 10
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 10 && instance_exists(obj_dialoguer_ch1) == 0)
{
    mus_loop_ch1(global.currentsong[0])
    __view_set((9 << 0), 0, -4)
    door_readable = instance_create_ch1(244, 51, obj_readable_room1_ch1)
    alphys2 = alphys
    alphys = instance_create_ch1(alphys.x, (alphys.y + alphys.sprite_height), obj_npc_facing_ch1)
    with (alphys2)
        instance_destroy()
    doorsolid = instance_create_ch1(236, 52, obj_solidblock_ch1)
    with (doorsolid)
        image_xscale = 2
    with (door)
        depth = 500000
    with (obj_mainchara_ch1)
        fun = false
    global.plot = 2
    global.interact = 0
    con = 11
}
if (con == 20 && instance_exists(obj_dialoguer_ch1) == 0)
{
    global.interact = 1
    con = 21
    alarm[4] = 2
}
if (con == 21)
    global.interact = 1
if (con == 22)
{
    global.typer = 13
    global.fc = 12
    global.fe = 3
    global.facing = 2
    global.msg[0] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_107_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_108_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_109_0")
    global.msg[3] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_110_0")
    global.msg[4] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_111_0")
    global.msg[5] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_112_0")
    con = 23
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 23 && instance_exists(obj_dialoguer_ch1) == 0)
{
    instance_create_ch1(0, 0, obj_shake_ch1)
    snd_stop_all_ch1()
    snd_free_ch1(global.currentsong[0])
    with (door)
    {
        image_index = 0
        image_speed = 0.5
        sprite_index = spr_classdoorslam_ch1
        depth = 5000
    }
    sus = scr_marker_ch1(237, 24, spr_susied_plain_ch1)
    with (sus)
        scr_depth_ch1()
    con = 24
    alarm[4] = 4
    with (doorsolid)
        instance_destroy()
}
if (con == 25)
{
    snd_play_ch1(snd_impact_ch1)
    alphys2 = alphys
    alphys = scr_marker_ch1(alphys.x, alphys.y, spr_alphysr_shock_ch1)
    with (alphys)
        scr_depth_ch1()
    with (alphys2)
        instance_destroy()
    con = 26
    alarm[4] = 6
}
if (con == 27)
{
    with (door)
    {
        image_speed = 0
        depth = 500000
    }
    con = 32
    alarm[4] = 50
}
if (con == 29 && instance_exists(obj_dialoguer_ch1) == 0)
{
    with (sus)
    {
        image_speed = 0.1
        vspeed = 0.5
    }
    con = 30
    alarm[4] = 40
}
if (con == 31)
{
    with (sus)
    {
        image_index = 0
        image_speed = 0
        vspeed = 0
    }
    con = 34
    alarm[4] = 30
}
if (con == 33)
{
    global.fe = 2
    global.fc = 11
    global.typer = 22
    global.msg[0] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_190_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 28
    alarm[4] = 20
}
if (con == 35)
{
    global.fc = 1
    global.fe = 0
    global.typer = 10
    global.msg[0] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_203_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_204_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_205_0")
    global.msg[3] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_206_0")
    global.msg[4] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_207_0")
    scr_susface_ch1(5, 0)
    global.msg[6] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_209_0")
    global.msg[7] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_210_0")
    con = 36
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 36 && instance_exists(obj_dialoguer_ch1) == 0)
{
    con = 37
    alarm[4] = 40
    with (alphys)
        sprite_index = spr_alphysd_ch1
}
if (con == 38)
{
    global.fc = 11
    global.typer = 20
    global.fe = 6
    global.msg[0] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_230_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_231_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 39
}
if (con == 39 && instance_exists(obj_dialoguer_ch1) == 0)
{
    with (alphys)
    {
        sprite_index = spr_alphysr_ch1
        hspeed = 3
        image_speed = 0.2
    }
    con = 40
    alarm[4] = 26
}
if (con == 41)
{
    with (alphys)
    {
        sprite_index = spr_alphysu_ch1
        image_index = 0
        image_speed = 0
        hspeed = 0
    }
    con = 42
    alarm[4] = 30
}
if (con == 43)
{
    global.msg[0] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_263_0")
    con = 44
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 44 && instance_exists(obj_dialoguer_ch1) == 0)
{
    con = 45
    with (alphys)
        sprite_index = spr_alphysl_ch1
    con = 46
    alarm[4] = 20
}
if (con == 47)
{
    with (alphys)
        sprite_index = spr_alphysr_ch1
    con = 48
    alarm[4] = 20
}
if (con == 49)
{
    with (alphys)
        sprite_index = spr_alphysd_ch1
    con = 50
    alarm[4] = 30
}
if (con == 51)
{
    global.fe = 8
    global.msg[0] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_294_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_295_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_296_0")
    global.msg[3] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_298_0")
    global.msg[4] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_299_0")
    global.msg[5] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_300_0")
    global.msg[6] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_301_0")
    global.msg[7] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_302_0")
    global.msg[8] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_303_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 51.1
}
if (con == 51.1 && d_ex_ch1() == 0)
{
    with (alphys)
        sprite_index = spr_alphysd_ch1
    con = 50.2
    alarm[4] = 90
}
if (con == 51.2)
{
    with (alphys)
        sprite_index = spr_alphysd_ch1
    global.fe = 6
    global.msg[0] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_319_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_320_0")
    con = 51.3
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 51.3 && d_ex_ch1() == 0)
{
    with (alphys)
        sprite_index = spr_alphysr_ch1
    con = 50.4
    alarm[4] = 90
}
if (con == 51.4)
{
    with (alphys)
        sprite_index = spr_alphysd_ch1
    global.fe = 9
    global.msg[0] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_336_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_337_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_338_0")
    global.msg[3] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_339_0")
    global.msg[4] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_340_0")
    global.msg[5] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_341_0")
    global.msg[6] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_342_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 52
}
if (con == 52)
{
    if instance_exists(obj_writer_ch1)
    {
        if (obj_writer_ch1.msgno == 4)
        {
            with (alphys)
                sprite_index = spr_alphysr_ch1
        }
    }
}
if (con == 52 && instance_exists(obj_dialoguer_ch1) == 0)
{
    with (sus)
    {
        vspeed = -1
        sprite_index = spr_susieu_ch1
        image_speed = 0.2
    }
    con = 53
    alarm[4] = 15
}
if (con == 54)
{
    with (sus)
        instance_destroy()
    instance_create_ch1(0, 0, obj_shake_ch1)
    snd_play_ch1(snd_impact_ch1)
    with (door)
        image_index = 0
    con = 55
    alarm[4] = 50
}
if (con == 56)
{
    with (sus)
        instance_destroy()
    with (alphys)
        sprite_index = spr_alphysd_ch1
    global.fc = 11
    global.typer = 20
    global.fe = 4
    global.msg[0] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_394_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_395_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_classscene_slash_Step_0_gml_396_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 57
}
if (con == 57 && instance_exists(obj_dialoguer_ch1) == 0)
{
    with (door_readable)
        instance_destroy()
    doorb = instance_create_ch1(242, 51, obj_doorB_ch1)
    global.plot = 3
    global.facing = 0
    alphys2 = alphys
    alphys = instance_create_ch1(alphys.x, (alphys.y + alphys.sprite_height), obj_npc_facing_ch1)
    with (obj_npc_facing_ch1)
        talked = false
    with (alphys2)
        instance_destroy()
    with (doorsolid)
        instance_destroy()
    global.interact = 0
    con = 58
}
