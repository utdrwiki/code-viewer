con = 0;
timer = 0;
init = 0;
siner = 0;
animindex = 0;
animspeed = 0;
delaytime = 8;
spd = 0;
maxspd = 10;
touchsize = 40;
scr_darksize();
facing = 0;
darkroom = false;
accl = 0.0625;
retimer = 0;
dir = 0;
clearall = true;
marker = -4;
encounterflag = 0;
encounterno = 156;
drawsiner = 0;
auraalph = 0;
drawaura = false;
if (room == room_dw_churchc_encounter2 || instance_exists(obj_dw_churchc_encounter2))
{
    encounterflag = 1792;
    encounterno = 188;
    if (global.flag[encounterflag] == 1)
        instance_destroy();
}
scr_depth();
