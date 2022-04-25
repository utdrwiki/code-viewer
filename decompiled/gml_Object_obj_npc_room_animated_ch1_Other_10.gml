global.msc = 0
global.typer = 5
if (global.darkzone == true)
    global.typer = 6
global.fc = 0
global.fe = 0
global.interact = 1
global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_8_0")
if (room == room_dark1_ch1)
{
    global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_12_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_13_0")
    global.msg[2] = ((scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_14_0") + scr_get_input_name_ch1(6)) + scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_14_1"))
    global.writersnd[0] = snd_item_ch1
    global.writersnd[8] = snd_great_shine_ch1
    if (global.flag[10] == 1)
        global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_20_0")
    with (obj_npc_room_animated_ch1)
        visible = false
    global.flag[10] = 1
}
if (room == room_town_mid_ch1)
{
    if (sprite_index == spr_npc_icemascot2_ch1)
    {
        global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_31_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_32_0")
        global.msg[2] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_33_0")
        global.msg[3] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_34_0")
        global.msg[4] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_35_0")
        global.msg[5] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_36_0")
        global.msg[6] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_37_0")
        global.msg[7] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_38_0")
        if (talked >= true)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_42_0")
            global.msg[1] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_43_0")
            global.msg[2] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_44_0")
        }
    }
    if (sprite_index == spr_npc_icemascot_fake_ch1)
        global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_51_0")
    if (sprite_index == spr_npc_icemascot1_ch1)
    {
        global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_56_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_57_0")
        global.msg[2] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_58_0")
        global.msg[3] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_59_0")
        global.msg[4] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_60_0")
        with (obj_town_event_ch1)
            con = 20
    }
}
if (room == room_diner_ch1)
{
    global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_67_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_68_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_69_0")
    if (talked >= true)
        global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_72_0")
}
if (room == room_cc_clover_ch1)
    global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_78_0")
if (room == room_cc_6f_ch1)
{
    global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_83_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_84_0")
}
if (room == room_cc_throneroom_ch1)
{
    global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_89_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_90_0")
}
if (room == room_field_maze_ch1)
{
    global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_95_0")
    if scr_havechar_ch1(2)
    {
        global.fc = 1
        global.typer = 30
        global.fe = 1
        global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_101_0")
    }
}
if (room == room_forest_savepoint_relax_ch1)
{
    if (y >= 200)
    {
        global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_109_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_110_0")
        global.msg[2] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_111_0")
        if (talked >= true)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_114_0")
            global.msg[1] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_115_0")
            global.msg[2] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_116_0")
        }
        if (global.plot >= 90)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_121_0")
            global.msg[1] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_122_0")
        }
    }
    else
    {
        global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_128_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_129_0")
        scr_susface_ch1(2, 2)
        global.msg[3] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_131_0")
        global.msg[4] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_132_0")
        scr_noface_ch1(5)
        global.msg[6] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_134_0")
        if (talked >= true)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_137_0")
        if (global.plot >= 90)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_141_0")
            global.msg[1] = scr_84_get_lang_string_ch1("obj_npc_room_animated_slash_Other_10_gml_142_0")
        }
    }
}
myinteract = 3
mydialoguer = instance_create_ch1(0, 0, obj_dialoguer_ch1)
talked += 1
