scr_talkroom_ch1 = function() //gml_Script_scr_talkroom_ch1
{
    global.typer = 6
    global.fc = 0
    global.fe = 0
    global.msg[0] = scr_84_get_lang_string_ch1("scr_talkroom_slash_scr_talkroom_gml_4_0")
    talkdg = instance_create_ch1(0, 0, obj_dialoguer_ch1)
    atalk += 1
    return;
}

