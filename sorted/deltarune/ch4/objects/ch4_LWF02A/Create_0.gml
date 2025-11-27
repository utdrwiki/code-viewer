con = -1;
customcon = 0;
can_getup = false;
getup_con = 0;
timer = 0;
if (global.plot >= 290 && scr_flag_get(712) == 0)
    con = 0;
else
    instance_destroy();
