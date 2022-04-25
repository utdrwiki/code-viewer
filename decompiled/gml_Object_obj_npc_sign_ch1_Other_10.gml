global.msc = 0
global.typer = 5
if (global.darkzone == true)
    global.typer = 6
global.fc = 0
global.fe = 0
global.interact = 1
global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_8_0")
if (room == room_field1_ch1)
{
    if (x < (room_width / 2))
        global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_12_0")
    if (x > (room_width / 2))
        global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_13_0")
}
if (room == room_field2_ch1)
    global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_30_0")
if (room == room_field2A_ch1)
{
    global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_41_0")
    global.msg[1] = ((scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_42_0") + scr_get_input_name_ch1(6)) + scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_42_1"))
    global.msg[2] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_43_0")
}
if (room == room_field_maze_ch1)
{
    if (y > 80)
        global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_49_0")
    if (y > 200)
    {
        global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_52_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_53_0")
    }
    if (y > 640)
        global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_55_0")
    if (y > 1000 && x > 1000)
        global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_56_0")
    if (y > 1000 && x < 600)
        global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_57_0")
}
if (room == room_field_getsusie_ch1)
    global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_63_0")
if (room == room_field3_ch1)
{
    global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_68_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_69_0")
}
if (room == room_field_puzzletutorial_ch1)
{
    global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_74_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_75_0")
}
if (room == room_field_secret1_ch1)
{
    global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_80_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_81_0")
    if (read >= 1)
        global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_84_0")
}
if (room == room_forest_puzzle1_ch1)
{
    global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_90_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_91_0")
}
if (room == room_forest_thrashmaker_ch1)
{
}
if (room == room_cc_prison_cells_ch1)
{
    global.flag[231] += 1
    global.msc = 300
    scr_text_ch1(global.msc)
}
if (room == room_cc_prison2_ch1)
{
    global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_161_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_162_0")
}
if (room == room_cc_throneroom_ch1)
{
    if (sprite_index == spr_darkthrone_ch1)
        global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_169_0")
    if (sprite_index == spr_darkmoney_ch1)
        global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_173_0")
}
if (room == room_flowershop_2f_ch1)
    global.msg[0] = scr_84_get_subst_string_ch1(scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_179_0"), colortxt)
if (room == room_town_north_ch1)
{
    global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_184_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_185_0")
}
if (room == room_beach_ch1)
{
    global.msc = 192
    scr_text_ch1(global.msc)
}
if (room == room_town_krisyard_ch1)
    global.msg[0] = scr_84_get_lang_string_ch1("obj_npc_sign_slash_Other_10_gml_196_0")
read += 1
myinteract = 3
mydialoguer = instance_create_ch1(0, 0, obj_dialoguer_ch1)
