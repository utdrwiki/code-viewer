if (scr_debug())
    scr_setparty(1, 1, 0);
siner = 0;
global.flag[7] = 0;
prophecyactive = false;
roomglow = instance_create(0, 0, obj_roomglow);
prophecy[0] = 0;
prophecy[1] = 0;
prophecy[2] = 0;
init = 0;
if (scr_flag_get(1609) == 0)
{
    scr_flag_set(1609, 1);
    scr_tempsave();
}
lightinit = 0;
