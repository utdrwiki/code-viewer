global.flag[7] = 0;
con = 0;
timer = 0;
init = 0;
siner = 0;
forceactive = 0;
roomglow = instance_create(0, 0, obj_roomglow);
encounterflag = 1784;
encounterno = 155;
econ = 0;
bat = 0;
etimer = 0;
if (global.flag[encounterflag] == 1)
    econ = 99;
layer_set_visible("DEBUG_ASSETS", 0);
if (scr_debug())
{
    scr_setparty(1);
    if (keyboard_check(ord("P")))
        global.plot = 235;
}
cutscene = 0;
if (global.plot < 235)
    global.plot = 235;
if (global.plot > 235)
    cutscene = -1;
depth = 5000;
with (obj_border_controller)
    show_border();
