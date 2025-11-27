image_speed = 0;
dir = 0;
con = 0;
timer = 0;
init = 0;
daddy = 0;
pushspeed = 8;
active = 1;
pushcount = 0;
if (image_xscale == 1)
    image_xscale = 2;
if (image_yscale == 1)
    image_yscale = 2;
scr_depth_board();
pushsound = 155;
stopsnd = 165;
jello = false;
custom_sprite = sprite_index;
ralseipush = false;
spawnerid = -1;
abandonmentissues = 1;
blockedbyplayer = false;
blocked = false;
remotepush = -2;
freeroam = false;
waspushed = 0;
if (room == room_dw_b3bstest_big || room == room_dw_b3bstest)
    freeroam = true;
