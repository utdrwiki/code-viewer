global.msc = 0
global.typer = 6
global.fc = 0
global.fe = 0
global.interact = 1
global.msc = 460
scr_text_ch1(global.msc)
if (on == 0)
    global.msg[0] = scr_84_get_lang_string_ch1("obj_shortcut_door_slash_Other_10_gml_13_0")
myinteract = 3
mydialoguer = instance_create_ch1(0, 0, obj_dialoguer_ch1)
talked += 1
