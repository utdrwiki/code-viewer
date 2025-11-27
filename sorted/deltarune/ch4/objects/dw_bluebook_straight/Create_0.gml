con = 0;
timer = 0;
encounterno = 161;
encounterflag = 1791;
depth = 33000;
auraalpha = 0;
drawsiner = 0;
starty = y;
spd = 0;
krismarker = 0;
myxoff = 48;
myyoff = 40;
easy = false;
image_speed = 0;
if (global.flag[encounterflag] == 1)
    instance_destroy();
bakeme = false;
if (room == room_dw_churchc_encounter1 || instance_exists(obj_dw_churchc_encounter1))
{
    sprite_index = spr_bibliox_flyingbook_baked;
    bakeme = true;
}
