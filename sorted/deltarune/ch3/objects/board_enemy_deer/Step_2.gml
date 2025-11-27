if ((obj_board_camera.active || global.interact == 1) && blockinteract == 0)
{
    var kris = -1;
    with (obj_mainchara_board)
    {
        if (controlled)
            kris = id;
    }
    x = kris.x;
    y = kris.y;
}
