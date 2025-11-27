function scr_board_instawarp(arg0, arg1, arg2, arg3, arg4)
{
    with (obj_board_camera)
    {
        instawarp = true;
        if (argument_count == 6)
        {
            instawarproomgoto = argument5;
            camsavex = arg0;
            camsavey = arg1;
        }
        if (arg4 == "left" || arg4 == "right")
            scr_quickwarp(arg0, arg1, arg2, arg3 + (obj_board_controller.kris_object.y - 144));
        else if (arg4 == "up" || arg4 == "down")
            scr_quickwarp(arg0, arg1, arg2 + (obj_board_controller.kris_object.x - 288), arg3);
        else
            scr_quickwarp(arg0, arg1, arg2, arg3);
    }
}
