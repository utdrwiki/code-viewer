if (other.canfreemove == true)
{
    if (i_ex(obj_board_camera))
    {
        if (image_index == 0)
            obj_board_camera.shift = "right";
        if (image_index == 1)
            obj_board_camera.shift = "left";
        if (image_index == 2)
            obj_board_camera.shift = "up";
        if (image_index == 3)
            obj_board_camera.shift = "down";
    }
    other.canfreemove = false;
}
