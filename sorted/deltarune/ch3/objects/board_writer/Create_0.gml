mymessage = -1;
timer = 0;
side = -1;
init = 0;
writer = -4;
con = 0;
depth = 100000;
halt = 0;
boxcolor = 0;
textcolor = 16777215;
movespeed = 16;
stay = 0;
skip = 0;
skippable = true;
textsound = snd_board_text_main;
reachedend_sound = 90;
reachedend_sound_play = true;
noiseskip = 0;
boardopensound = true;
rate = 1;
xoff = 0;
yoff = 0;
boxleft = 0;
boxright = 0;
if (room == room_dw_ch3_man)
{
}
if (room == room_dw_b3bs_bibliox)
{
}
if (room == room_dw_b3bs_idcardpuzzle)
{
    xoff = 16;
    boxleft = 16;
    boxright = 16;
}
reachedend_draw_triangle = true;
reachedend_draw_triangle_siner = 0;
reachedend_triangle_sprite = 2943;
