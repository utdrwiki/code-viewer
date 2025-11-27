if (autodepth == true)
    scr_depth_board();
if (!variable_instance_exists(id, "camkill"))
    camkill = false;
if (camkill && i_ex(obj_board_camera))
{
    if (obj_board_camera.con != 0 || obj_board_camera.shift != "none")
        instance_destroy();
}
