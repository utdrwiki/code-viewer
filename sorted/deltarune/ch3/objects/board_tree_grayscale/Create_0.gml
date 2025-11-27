event_inherited();
coolbeat = 0;
con = 0;
timer = 0;
active = false;
image_speed = 0.0625;
color[0] = #FF3674;
color[1] = #EA00FF;
color[2] = #3000FF;
color[3] = #008AFF;
color[4] = #00FFC0;
color[5] = #00FF06;
color[6] = #B4FF00;
image_blend = color[0];
colorindex = 0;
init = 0;
bosstimer = 0;
bossblush = 0;
bosscon = 0;
myinteract = 0;
mysolid = 0;
buffer = 0;
treemus = 0;
if (room == room_board_2_sword)
{
    fakeground = scr_board_marker(x, y, spr_board_b3fakedirt, 0, 999995, 2);
    bosscon = 72;
}
