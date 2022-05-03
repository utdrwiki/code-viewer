if (con == 1)
{
    global.interact = 1
    sus = scr_dark_marker_ch1((obj_mainchara_ch1.x - 100), global.cinstance[1].y, spr_susier_dark_ch1)
    ral = scr_dark_marker_ch1((obj_mainchara_ch1.x - 50), global.cinstance[0].y, spr_ralseir_ch1)
    k = scr_dark_marker_ch1(obj_mainchara_ch1.x, obj_mainchara_ch1.y, spr_krisr_dark_ch1)
    with (obj_caterpillarchara_ch1)
        instance_destroy()
    with (obj_mainchara_ch1)
        visible = false
    with (obj_marker_ch1)
    {
        hspeed = 4
        image_speed = 0.2
    }
    con = 2
    alarm[4] = 40
}
if (con == 2)
    global.interact = 1
if (con == 3)
{
    con = 4
    with (obj_marker_ch1)
        scr_halt_ch1()
    obj_mainchara_ch1.x = k.x
    obj_mainchara_ch1.visible = true
    with (k)
        instance_destroy()
    alarm[4] = 30
    instance_create_ch1((ral.x + 20), (ral.y - 20), obj_excblcon_ch1)
}
if (con == 5)
{
    global.typer = 31
    global.fc = 2
    global.fe = 8
    global.msg[0] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_39_0")
    scr_susface_ch1(1, 0)
    global.msg[2] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_41_0")
    scr_ralface_ch1(3, 8)
    global.msg[4] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_43_0")
    con = 6
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 6 && d_ex_ch1() == 0)
{
    with (sus)
        sprite_index = spr_susieu_dark_ch1
    global.facing = 2
    with (ral)
    {
        sprite_index = spr_ralseiu_ch1
        vspeed = -6
        image_speed = 0.25
    }
    con = 12
}
if (con == 12)
{
    global.facing = 2
    if (ral.y <= 100)
    {
        with (ral)
            scr_halt_ch1()
        with (ral)
            sprite_index = spr_ralseid_ch1
        con = 13
        alarm[4] = 10
    }
}
if (con == 14)
{
    global.fc = 2
    global.fe = 3
    global.typer = 31
    global.msg[0] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_82_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_83_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_84_0")
    global.msg[3] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_85_0")
    scr_susface_ch1(4, 2)
    global.msg[5] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_87_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 5.5
}
if (con == 5.5 && d_ex_ch1() == 0)
{
    global.facing = 1
    with (sus)
    {
        sprite_index = spr_susier_dark_ch1
        hspeed = 12
        image_speed = 0.334
    }
    con = 6.5
}
if (con == 6.5)
{
    if (sus.x >= 480)
    {
        sus.vspeed = -12
        sus.hspeed = 0
        sus.sprite_index = spr_susieu_dark_ch1
        con = 7.5
    }
}
if (con == 7.5)
{
    if (sus.y <= 100)
    {
        with (sus)
            scr_halt_ch1()
        con = 8.5
        alarm[4] = 10
    }
}
if (con == 9.5)
{
    with (sus)
        sprite_index = spr_susied_dark_ch1
    global.typer = 30
    global.fc = 1
    global.fe = 1
    global.msg[0] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_134_0")
    scr_ralface_ch1(1, 3)
    global.msg[2] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_136_0")
    scr_susface_ch1(3, 2)
    global.msg[4] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_138_0")
    scr_ralface_ch1(5, 8)
    global.msg[6] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_140_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 15
}
if (con == 15 && d_ex_ch1() == 0)
{
    global.flag[212] = 1
    with (obj_pushableblock_ch1)
        event = 0
    sus2 = instance_create_ch1(sus.x, sus.y, obj_npc_facing_ch1)
    ral2 = instance_create_ch1(ral.x, ral.y, obj_npc_facing_ch1)
    with (sus)
        instance_destroy()
    with (ral)
        instance_destroy()
    global.interact = 0
    con = 20
    boxcon = 1
    leavecon = 1
    instance_activate_object(obj_doorB_ch1)
}
if (leavecon == 1 && global.interact == 0)
{
    if (obj_mainchara_ch1.x < 70)
    {
        obj_mainchara_ch1.x = 70
        global.facing = 1
        global.interact = 1
        leavecon = 2
        global.typer = 30
        global.fc = 1
        global.fe = 7
        global.msg[0] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_170_0")
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
    }
}
if (leavecon == 2)
{
    if (d_ex_ch1() == 0)
    {
        leavecon = 1
        global.interact = 0
    }
}
if (con == 20)
{
    boxcount = 0
    tilecount = 0
    with (obj_pushableblock_ch1)
    {
        if (sprite_index == spr_npc_block_solved_ch1)
        {
            with (obj_boxpuzzle_event_ch1)
                boxcount += 1
        }
    }
    with (obj_blocktile_ch1)
    {
        if (sprite_index == spr_glowtile_on_ch1)
        {
            with (obj_boxpuzzle_event_ch1)
                tilecount += 1
        }
    }
    if (boxcount == 0 && global.interact == 0 && boxon == 2)
    {
        global.fc = 2
        global.fe = 1
        global.typer = 31
        global.interact = 1
        boxon = 3
        global.msg[0] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_207_0")
        scr_susface_ch1(1, 2)
        global.msg[2] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_209_0")
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
    }
    if (boxcount == 1 && global.interact == 0 && boxon == 0)
    {
        global.fc = 2
        global.fe = 6
        global.typer = 31
        global.interact = 1
        boxon = 1
        global.msg[0] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_220_0")
        scr_susface_ch1(1, 2)
        global.msg[2] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_222_0")
        global.msg[3] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_223_0")
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
    }
    if (boxcount >= 2 && global.interact == 0)
    {
        image_index = 1
        with (groundblock)
            instance_destroy()
        global.interact = 1
        instance_create_ch1(0, 0, obj_shake_ch1)
        snd_play_ch1(snd_impact_ch1)
        con = 25
        alarm[4] = 30
    }
    else if (tilecount == 2 && boxcount == 1 && global.interact == 0 && boxcon == 1)
    {
        global.interact = 1
        boxcon = 2
        global.fc = 2
        global.fe = 6
        global.typer = 31
        global.msg[0] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_248_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_249_0")
        scr_susface_ch1(2, 1)
        global.msg[3] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_251_0")
        global.msg[4] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_252_0")
        scr_ralface_ch1(5, 1)
        global.msg[6] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_254_0")
        scr_susface_ch1(7, 2)
        global.msg[8] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_256_0")
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
    }
}
if (boxcon == 2)
{
    if (d_ex_ch1() == 0)
    {
        boxcon = 3
        global.interact = 0
    }
}
if (boxon == 1)
{
    if (d_ex_ch1() == 0)
    {
        boxon = 2
        global.interact = 0
    }
}
if (boxon == 3)
{
    if (d_ex_ch1() == 0)
    {
        boxon = 4
        global.interact = 0
    }
}
if (con == 26)
{
    global.typer = 31
    global.fc = 2
    global.fe = 0
    global.msg[0] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_295_0")
    scr_susface_ch1(1, 0)
    global.msg[2] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_297_0")
    global.msg[3] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_298_0")
    con = 27
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 27)
{
    if (d_ex_ch1() == 0)
    {
        global.facing = 2
        ral3 = scr_dark_marker_ch1(ral2.x, ral2.y, spr_ralseir_ch1)
        sus3 = scr_dark_marker_ch1(sus2.x, sus2.y, spr_susiel_dark_ch1)
        with (ral2)
            instance_destroy()
        with (sus2)
            instance_destroy()
        with (sus3)
        {
            scr_depth_ch1()
            hspeed = -8
            image_speed = 0.334
        }
        con = 28
    }
}
if (con == 28)
{
    global.interact = 1
    if (sus3.x <= ((room_width / 2) - 20) && d_ex_ch1() == 0)
    {
        with (sus3)
        {
            image_speed = 0.334
            vspeed = -8
            hspeed = 0
            sprite_index = spr_susieu_dark_ch1
        }
        con = 29
        alarm[4] = 60
    }
}
if (con == 30)
{
    with (ral3)
        sprite_index = spr_ralseid_ch1
    global.typer = 31
    global.fc = 2
    global.fe = 8
    global.msg[0] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_347_0")
    dl = instance_create_ch1(0, 0, obj_dialoguer_ch1)
    dl.side = 1
    con = 31
}
if (con == 31)
{
    if (d_ex_ch1() == 0)
    {
        with (ral3)
        {
            scr_depth_ch1()
            sprite_index = spr_ralseir_ch1
            hspeed = 6
            image_speed = 0.25
        }
        con = 32
    }
}
if (con == 32)
{
    if (ral3.x >= ((room_width / 2) - 20))
    {
        with (ral3)
        {
            vspeed = -6
            hspeed = 0
            sprite_index = spr_ralseiu_ch1
        }
        con = 33
        alarm[4] = 30
    }
}
if (con == 34)
{
    with (obj_pushableblock_ch1)
        event = 1
    con = 35
    if (global.plot < 50)
        global.plot = 50
    global.facing = 0
    global.interact = 0
    leavecon = 0
    scr_tempsave_ch1()
}
if (con == 50)
{
    if (d_ex_ch1() == 0)
    {
        con = 51
        global.interact = 1
        fade = instance_create_ch1(0, 0, obj_fadeout_ch1)
        alarm[4] = 30
    }
}
if (con == 52)
{
    instance_create_ch1(290, 200, obj_npc_room_ch1)
    instance_create_ch1(460, 370, obj_npc_room_ch1)
    ral3 = scr_dark_marker_ch1(ral2.x, ral2.y, spr_ralseir_ch1)
    with (ral3)
        scr_depth_ch1()
    with (ral2)
        instance_destroy()
    sus3 = scr_dark_marker_ch1(((room_width / 2) - 22), sus2.y, spr_susied_dark_ch1)
    with (sus3)
        scr_depth_ch1()
    with (sus2)
        instance_destroy()
    snd_play_ch1(snd_impact_ch1)
    con = 53
    alarm[4] = 30
}
if (con == 54)
{
    image_index = 2
    with (groundblock)
        instance_destroy()
    with (obj_pushableblock_ch1)
        instance_destroy()
    with (fade)
        instance_destroy()
    global.facing = 2
    instance_create_ch1(0, 0, obj_fadein_ch1)
    con = 55
    alarm[4] = 50
}
if (con == 56)
{
    global.msg[0] = scr_84_get_lang_string_ch1("obj_boxpuzzle_event_slash_Step_0_gml_437_0")
    dl = instance_create_ch1(0, 0, obj_dialoguer_ch1)
    dl.side = 1
    global.interact = 1
    con = 28
}
