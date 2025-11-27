image_speed = 0;
scr_depth();
xx = 0;
act = 0;
timer = 0;
charge = 0;
rumble = 0;
alpha = 0;
xscale = 1;
global.flag[1697] = 0;
if (global.flag[1697] == 1)
{
    act = 1;
    xscale = 0;
    with (obj_solidblockDark)
    {
        if (x == 200 && y == 200)
            image_xscale = 1;
    }
}
else
{
    with (obj_doorAny)
    {
        if (y < 300)
            y = -1000;
    }
}
console_version = global.is_console || onSteamDeck();
lastinteract = global.interact;
