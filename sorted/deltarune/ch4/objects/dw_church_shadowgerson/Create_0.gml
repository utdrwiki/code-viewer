layer_set_visible("debug_assets", 0);
movetocutscene = 0;
if (scr_debug())
{
    scr_setparty(1, 1);
    if (global.tempflag[90] == 1 || keyboard_check(ord("P")))
    {
        global.facing = 1;
        global.tempflag[90] = 0;
        movetocutscene = 1;
    }
}
if (global.plot < 126)
    global.plot = 126;
cutscene = 0;
if (global.plot >= 128)
    cutscene = 999;
init = 0;
roomglow = instance_create(0, 0, obj_roomglow);
prop1 = instance_create(620, 570, obj_dw_church_prophecy);
prop1.extflag = "main3";
prop2 = instance_create(1300, 378, obj_dw_church_prophecy);
prop2.extflag = "joke2";
germark = 0;
dogerson = 0;
