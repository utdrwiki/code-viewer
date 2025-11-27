con = 0;
timer = 0;
init = 0;
siner = 0;
layer_set_visible("DEBUG_ASSETS", 0);
roomglow = instance_create(x, y, obj_roomglow);
if (scr_debug())
{
    scr_setparty(1, 1);
    if (keyboard_check(ord("P")))
        global.flag[1596] = 0;
}
cutscene = 0;
if (global.flag[1596] == 1)
    cutscene = 2;
makenpcarea = false;
if (global.flag[1596])
    makenpcarea = true;
npcarea = -4;
