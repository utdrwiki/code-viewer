ui = instance_create(x, y, obj_dw_church_remotepianomove_ui);
ui.depth = 500;
con = 0;
timer = 0;
yoffset = 0;
yspeed = 0;
shakex = 0;
ralshakex = 0;
currentdir = -1;
movedir = -1;
shakey = 0;
mysolid = instance_create(x, y, obj_trigger_interact);
engaged = false;
ralsei_knocked_down = 0;
with (mysolid)
{
    sprite_index = spr_pxwhite;
    scr_size(68, 18);
    image_alpha = 0.4;
    image_blend = c_yellow;
    issolid = true;
    strict = true;
}
final = room != room_dw_churchb_library;
if (global.flag[1585] && !final)
{
    x = floor(global.flag[1585] / 1000) * 40;
    y = (global.flag[1585] % 1000) * 40;
}
ubuff = 0;
rbuff = 0;
lbuff = 0;
dbuff = 0;
xbuff = 0;
cbuff = 0;
zbuff = 0;
hijackcamera = true;
camcont = false;
engaged = false;
con = 0;
movedir = -1;
myhspeed = 0;
myvspeed = 0;
timer = 0;
endtimer = 0;
endtime = 15;
buffer = 0;
followshelf = false;
hitstop = 0;
camcontrol = false;
camx = 0;
camy = 0;
camcon = 0;
camstrength = 1;
alpha = 0;
siner = 0;
soundtoplay = -1;
makenote = 0;
drawx = x + 40;
drawy = y - 70;
if (!instance_exists(obj_tutorial_text))
    instance_create(0, 0, obj_tutorial_text);
