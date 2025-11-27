event_inherited();
if (scr_debug())
{
}
con = -1;
if (global.flag[1090] == 1)
{
    with (obj_b3bs_console)
        cantuse = false;
    con = 100;
    x = room_width;
}
else
{
    scr_setparty(1, 1, 0);
}
shineindex = 0;
image_speed = 0.125;
