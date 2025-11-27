scr_enemy_object_init();
recruitcount = 4;
talkmax = 90;
image_speed = 0.1;
idlesprite = spr_watercooler;
hurtsprite = spr_watercooler;
sparedsprite = spr_watercooler_spared;
noballoon = false;
rr = 0;
myattackchoice = 1;
_init = false;
begformercycount = 0;
amimoonwarmer = false;
pinkflashcon = 0;
pinkflashtimer = 0;
if (global.encounterno == 140)
    amimoonwarmer = true;
balloonorder = 0;
ballooncon = 0;
balloonend = 1;
talked = 0;
talktimer = 0;
talkedcon = 0;
ralseitalks = 0;
susietalks = 0;
turns = 1;
if (global.flag[1119] == 1)
    begformercycount = 2;
if (room == room_dw_teevie_watercooler || room == room_dw_teevie_large_02 || room == room_dw_b3bs_zapper_b)
{
    global.tempflag[92] = 1;
    if (global.flag[1144] == 0)
        global.flag[1144] = 2;
}
