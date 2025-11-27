touchbuffer--;
if (touchbuffer <= 0 && place_meeting(x, y, obj_mainchara_board))
{
    if (i_ex(obj_board_camera))
    {
        obj_board_camera.shift = "warptile";
        obj_board_camera.warpx = warpx;
        obj_board_camera.warpy = warpy;
        obj_board_camera.playerX = playx;
        obj_board_camera.playerY = playy;
        obj_board_camera.movetype = movetype;
    }
    if (i_ex(obj_mainchara_board))
    {
        obj_mainchara_board.movetype = "board";
        obj_mainchara_board.movebuffer = 20;
        obj_mainchara_board.movesleft = 0;
    }
    if (i_ex(obj_board_controller))
        obj_board_controller.phase = 0;
    touchbuffer = 20;
    global.interact = 1;
}
