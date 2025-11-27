if (i_ex(obj_board_camera) && tiledone == 0)
{
    obj_board_camera.shift = "warptile";
    obj_board_camera.warpx = warpx;
    obj_board_camera.warpy = warpy;
    obj_board_camera.playerX = playx;
    obj_board_camera.playerY = playy;
    obj_board_camera.movetype = movetype;
    tiledone = 1;
}
