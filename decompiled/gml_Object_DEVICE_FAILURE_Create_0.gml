EVENT = 0
TIMER = 0
HEARTMADE = 0
HSINER = 0
OBMADE = 0
global.flag[20] = 0
global.flag[6] = 1
global.typer = 667
scr_windowcaption(stringsetloc("THE DEATH", "DEVICE_FAILURE_slash_Create_0_gml_12_0"))
FADEFACTOR = 0
WHITEFADE = 0
FADEUP = 0
DARK_WAIT = 0
text_timer = 30
restart = false
restart_timer = 0
gamepad_controls = [32769, 32770, 32771, 32772, 32773, 32775, 32774, 32776, 32777, 32778, 32779, 32780, 32781, 32782, 32783, 32784]
if (global.chapter > 1)
{
    var gameover_bg = instance_create(0, 20, obj_gameoverbg)
    with (gameover_bg)
        scr_depth()
}
