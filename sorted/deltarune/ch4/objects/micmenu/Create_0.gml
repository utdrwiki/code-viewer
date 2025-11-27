is_pc = !(global.is_console || onSteamDeck());
xcoord = 0;
ycoord = 0;
ini_ex = 0;
buffer = 3;
endme = 0;
cur_jewel = 0;
current = 0;
selected = global.microphone;
reload = 0;
microphone_volume = 0;
mic_max = audio_get_recorder_count() + 2;
act = -1;
hold_up = 0;
hold_down = 0;
mic_reload = 0;
if (selected > audio_get_recorder_count())
{
    selected = 0;
    current = 0;
    global.microphone = 0;
}
mic_name = [];
mic_on = [];
for (i = 0; i < 102; i++)
{
    mic_name2[i] = "Test " + string(i);
    mic_on[i] = false;
}
for (i = 0; i < (mic_max - 2); i++)
{
    mic_name[i] = audio_get_recorder_info(i);
    mic_on[i] = true;
}
menu_max = mic_max;
if (is_pc)
    menu_max++;
i = 0;
option[i++] = stringsetloc("Select Microphone", "obj_micmenu_slash_Create_0_gml_39_0");
option[i++] = stringsetloc("Adjust Sensitivity", "obj_micmenu_slash_Create_0_gml_40_0");
option[i++] = stringsetloc("Done", "obj_micmenu_slash_Create_0_gml_41_0");

get_right_click_mic_string = function()
{
    return stringsetloc("Mouse Right-Click [Not Recommended]", "obj_micmenu_slash_Draw_0_gml_141_0");
};

get_x_click_mic_string = function(arg0)
{
    return stringsetsubloc("~1 [Also Not Recommended]", arg0, "obj_micmenu_slash_Draw_0_gml_172_0");
};
