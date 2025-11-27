function scr_quickwarp(arg0, arg1, arg2, arg3)
{
    with (obj_board_camera)
    {
        global.interact = 1;
        shift = "warp";
        warpx = arg0;
        warpy = arg1;
        playerX = arg2;
        playerY = arg3;
    }
}
