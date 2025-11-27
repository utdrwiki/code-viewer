if (con == 0)
    scr_board_sword_repeat();
if (!made)
{
    if (obj_board_camera.shift != "none")
    {
        with (instance_create(288, 320, obj_board_solid))
        {
            setxy_board();
            scr_size(2, 1);
        }
        made = true;
    }
}
