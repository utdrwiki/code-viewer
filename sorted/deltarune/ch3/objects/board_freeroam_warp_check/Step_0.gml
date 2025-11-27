if (myinteract == 3)
{
    if (i_ex(obj_board_camera))
    {
        obj_board_camera.shift = "warptile";
        obj_board_camera.warpx = warpx;
        obj_board_camera.warpy = warpy;
        obj_board_camera.playerX = playx;
        obj_board_camera.playerY = playy;
    }
    if (i_ex(obj_mainchara_board))
    {
        obj_mainchara_board.movetype = "board";
        obj_mainchara_board.movesleft = 0;
    }
    if (i_ex(obj_board_controller))
        obj_board_controller.phase = 0;
    myinteract = 0;
}
