if (global.interact == 0 && con == 0 && buffer <= 0 && obj_board_camera.con == 0 && obj_board_camera.shift == "none")
{
    con = 1;
    global.interact = 1;
    with (obj_board_grayregion)
        instance_destroy();
}
