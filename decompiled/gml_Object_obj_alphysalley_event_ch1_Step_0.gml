if (con == 1 && global.interact == 0)
{
    if (obj_mainchara_ch1.y <= 160)
    {
        global.interact = 1
        a = obj_npc_facing_ch1
        with (a)
        {
            facing = 0
            dfacing = 0
            sprite_index = spr_alphysd_ch1
        }
        exc = instance_create_ch1((a.x + 15), (a.y - 6), obj_excblcon_ch1)
        con = 2
        alarm[4] = 30
    }
}
if (con == 3)
{
    with (exc)
        instance_destroy()
    global.typer = 20
    global.fc = 11
    global.fe = 3
    global.msg[0] = scr_84_get_lang_string_ch1("obj_alphysalley_event_slash_Step_0_gml_25_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_alphysalley_event_slash_Step_0_gml_26_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_alphysalley_event_slash_Step_0_gml_27_0")
    global.msg[3] = scr_84_get_lang_string_ch1("obj_alphysalley_event_slash_Step_0_gml_28_0")
    global.msg[4] = scr_84_get_lang_string_ch1("obj_alphysalley_event_slash_Step_0_gml_29_0")
    global.msg[5] = scr_84_get_lang_string_ch1("obj_alphysalley_event_slash_Step_0_gml_30_0")
    global.msg[6] = scr_84_get_lang_string_ch1("obj_alphysalley_event_slash_Step_0_gml_31_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 4
}
if (con == 4 && (!d_ex_ch1()))
{
    global.interact = 0
    global.flag[269] = 1
    con = 5
}
