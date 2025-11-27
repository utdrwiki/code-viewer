if (global.interact == 0)
{
    with (obj_board_camera)
    {
        playerX = other.playerX;
        playerY = other.playerY;
        warpx = other.warpx;
        warpy = other.warpy;
        shift = "warp";
        con = 1;
    }
}
