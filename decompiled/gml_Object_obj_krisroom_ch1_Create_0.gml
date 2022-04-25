if (global.plot <= 10)
    snd_free_all_ch1()
con = 0
image_speed = 0
wallwindow = scr_marker_ch1(140, 40, spr_housewindow_ch1)
with (wallwindow)
    scr_depth_ch1()
if (global.plot > 0)
{
    scr_depth_ch1()
    with (wallwindow)
        image_index = 1
    image_index = 1
}
else
{
    scr_windowcaption_ch1(scr_84_get_lang_string_ch1("obj_krisroom_slash_Create_0_gml_14_0"))
    t = scr_marker_ch1(151, 97, spr_toriel_rt_ch1)
    with (t)
    {
        scr_depth_ch1()
        image_speed = 0.25
    }
    global.msc = 0
    global.typer = 7
    global.fc = 4
    global.fe = 1
    global.msg[0] = scr_84_get_lang_string_ch1("obj_krisroom_slash_Create_0_gml_21_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_krisroom_slash_Create_0_gml_22_0")
    d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 1
    global.interact = 1
    global.facing = 3
}
