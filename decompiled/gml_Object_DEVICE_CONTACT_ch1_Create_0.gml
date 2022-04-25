EVENT = 0
TIMER = 0
HEARTMADE = 0
HSINER = 0
OBMADE = 0
global.flag[20] = 0
global.flag[6] = 1
global.typer = 666
ALREADY = true
TRUE_ALREADY = 0
if (global.tempflag[10] == 1)
    TRUE_ALREADY = 1
SKIPBUFFER = 10
FADED = 0
FADEFACTOR = 0.4
FADEUP = 0
OB_DEPTH = 0
obacktimer = 0
OBM = 0.5
global.currentsong[0] = snd_init_ch1("AUDIO_DRONE.ogg")
mus_loop_ch1(global.currentsong[0])
WHITEFADE = 0
scr_windowcaption_ch1(scr_84_get_lang_string_ch1("DEVICE_CONTACT_slash_Create_0_gml_23_0"))
if (global.lang == "ja")
    global.flag[912] = 1
