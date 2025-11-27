image_speed = 0;
alerted = 0;
scr_darksize();
facing = 0;
sprite_index = -4;
mysprite = 3900;
animindex = 0;
froze = 0;
drawtype = 0;
memspeed = 0;
con = 0;
targx = x;
targy = y;
walkcycle = 0;
walktime = 0;
walkdist = 60;
leftrange = 138;
rightrange = 502;
roomtarg = 156;
encounterflag = 580;
if (room == room_dw_b3bs_zapper_a)
{
    encounterflag = 581;
    x -= 60;
    leftrange = 220;
    rightrange = 340;
}
if (room == room_dw_b3bs_zapper_b)
{
    encounterflag = 582;
    x += 60;
    leftrange = 280;
    rightrange = 420;
}
if (room == room_dw_b3bs_zapper_c)
{
    encounterflag = 583;
    leftrange = 158;
    rightrange = 482;
}
timer = 0;
if (global.flag[encounterflag] == 0)
{
}
else
{
}
