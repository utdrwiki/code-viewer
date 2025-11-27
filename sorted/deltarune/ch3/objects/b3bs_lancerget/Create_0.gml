init = 0;
with (instance_create(128, 128, obj_board_screen))
{
    screenwidth = 1344;
    screenheight = 160;
    depth = 100000;
}
if (global.flag[1055] >= 6)
    scr_marker_ext(128, 128, spr_pxwhite, 1344, 160, undefined, undefined, c_black, 99999);
var activecount = global.flag[1099];
for (var i = 3; i > -1; i--)
{
    var console = instance_create(256 + (i * 320), 268, obj_b3bs_lancerget_console);
    if (i != 0)
    {
        if (activecount)
            console.hascontroller = false;
        activecount--;
        if (i == 1)
            console.lany = board_tiley(4);
    }
    else
    {
        console.con = 9999;
    }
}
instance_create(250, 276, obj_b3bs_lancerget_lancer);
