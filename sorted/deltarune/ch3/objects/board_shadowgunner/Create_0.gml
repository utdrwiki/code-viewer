active = 0;
image_alpha = 0;
scr_darksize();
scr_depth_board();
depth = 100011;
timer = 0;
startWait = 10 + irandom(15);
shootWait = 8;
shootRate = 15;
type = 0;
facing = 0;
if (room == room_board_3)
{
    startWait = 1;
    shootWait = 5;
    if (x < 320)
        facing = 0;
    else
        facing = 1;
}
y -= 18;
ystart = y;
hat = 0;
_hit = 0;
points = 0;
phototaken = 0;
kris = 0;
noleaves = false;
bunny = false;
buntimer = 8 + irandom_range(15, 23);
if (global.flag[1061] > 5 && room == room_board_2)
{
    if (obj_b2danger1.active == true)
    {
        with (obj_mainchara_board)
        {
            if (camera == true)
                other.bunny = true;
        }
    }
}
if (bunny)
    sprite_index = spr_board_shadowbunny;
var del = false;
with (obj_mainchara_board)
{
    if (boat == true)
        del = true;
}
if (del == true)
{
    noleaves = true;
    instance_destroy();
}
