function scr_board_instawarp_room(arg0, arg1)
{
    with (obj_board_camera)
    {
        instawarp = true;
        if ("left" || "right")
            scr_quickwarp(2432, 576, 2432, 656 + (obj_mainchara_board.y - 144));
        else if ("up" || "down")
            scr_quickwarp(2432, 576 + (obj_mainchara_board.x - 144), 2432, 656);
        else
            scr_quickwarp(2432, 576, 2432, 656 + obj_mainchara_board.y);
    }
}
