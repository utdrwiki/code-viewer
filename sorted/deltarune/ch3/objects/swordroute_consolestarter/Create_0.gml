audio_stop_all();
standalone = 0;
ver = 0;
if (global.flag[1007] == 0 && room != room_board_gsa02_b0)
{
    global.facing = 3;
    obj_mainchara.x = 576;
}
else
{
    global.flag[1007] = 0;
    global.facing = 0;
    global.swordscreencolor = c_black;
}
shinetimer = 0;
image_speed = 0;
depth = 99980;
scr_darksize();
buff = 0;
con = 0;
kris = 1185;
walktime = 999;
draw_blue = false;
draw_static = false;
statictimer = 0;
drawlogo = false;
controllerprompt = false;
controllertext = stringsetloc("NO CONTROLLER", "obj_swordroute_consolestarter_slash_Create_0_gml_42_0");
with (obj_mainchara_board)
{
    canfreemove = false;
    facing = 2;
    visible = false;
}
draw_green = false;
boxy = 0;
draw_green_intro = false;
screenlerp = false;
drawboxcolor = false;
drawcolor = c_black;
startimer = 0;
starindex = 0;
draw_stars = 0;
logoalpha = 0;
logocolor = 16777215;
bar1 = 0;
bar2 = 0;
specialskip = 0;
draw_heart = false;
roomtogoto = 136;
if (global.plot >= 130)
{
    roomtogoto = 148;
    if (global.flag[1055] == 1.5)
        roomtogoto = 115;
}
if (global.plot >= 180)
{
    roomtogoto = 186;
    if (global.flag[1055] == 4)
    {
        roomtogoto = 116;
        global.tempflag[52] = 1;
    }
    if (global.flag[1055] == 5)
    {
        roomtogoto = 134;
        global.tempflag[52] = 1;
        specialskip = 1;
    }
}
createstars = 0;
if (global.swordboardeath == 1)
    specialskip = 1;
if (global.flag[1103] == 1)
    con = 99999;
