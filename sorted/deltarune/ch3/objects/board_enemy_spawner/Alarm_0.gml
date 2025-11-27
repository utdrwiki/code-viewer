with (obj_board_camera)
{
    instawarp = true;
    if (other.teleport_type == "none")
        scr_quickwarp(2432, 576, 2432, 656 + (obj_mainchara_board.y - 144));
    if (other.teleport_type == "to maze")
        scr_quickwarp(3584, 1344, 3584, 1424 + (obj_mainchara_board.y - 144));
    if (other.teleport_type == "maze up")
    {
        scr_quickwarp(3584, 1344, 3600 + (obj_mainchara_board.x - 144), 1568);
        if (obj_board_camera.board_2_maze_state == 0)
            obj_board_camera.board_2_maze_state = 1;
        else if (obj_board_camera.board_2_maze_state == 1)
            obj_board_camera.board_2_maze_state = 2;
        else
            obj_board_camera.board_2_maze_state = 0;
    }
    if (other.teleport_type == "maze down")
    {
        scr_quickwarp(3584, 1344, 3600 + (obj_mainchara_board.x - 144), 1344);
        if (obj_board_camera.board_2_maze_state == 5)
            obj_board_camera.board_2_maze_state = 6;
        else
            obj_board_camera.board_2_maze_state = 0;
    }
    if (other.teleport_type == "maze left")
    {
        scr_quickwarp(3584, 1344, 3936, 1424 + (obj_mainchara_board.y - 144));
        if (obj_board_camera.board_2_maze_state == 2)
            obj_board_camera.board_2_maze_state = 3;
        else
            obj_board_camera.board_2_maze_state = 0;
        if (obj_board_camera.board_2_maze_state == 0)
            scr_quickwarp(1280, 1344, 1632, 1424 + (obj_mainchara_board.y - 144));
    }
    if (other.teleport_type == "maze right")
    {
        scr_quickwarp(3584, 1344, 3584, 1424 + (obj_mainchara_board.y - 144));
        if (obj_board_camera.board_2_maze_state == 3)
            obj_board_camera.board_2_maze_state = 4;
        else if (obj_board_camera.board_2_maze_state == 4)
            obj_board_camera.board_2_maze_state = 5;
        else if (obj_board_camera.board_2_maze_state == 6)
            obj_board_camera.board_2_maze_state = 7;
        else
            obj_board_camera.board_2_maze_state = 0;
        if (obj_board_camera.board_2_maze_state == 7)
            scr_quickwarp(3968, 1088, 3968, 1168 + (obj_mainchara_board.y - 144));
    }
    if (other.teleport_type == "maze out")
        scr_quickwarp(2432, 1344, 2432, 1424 + (obj_mainchara_board.y - 144));
}
if (teleport_type == "none")
    instance_destroy();
