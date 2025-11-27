if (con == 0)
{
    if (place_meeting(x, y, obj_mainchara_board))
    {
        if (obj_board_camera.con != 0)
            con = 1;
    }
}
if (con == 1)
{
    if (!scr_board_onscreen())
    {
        con = 2;
        with (instance_create(x, y, obj_board_solid))
        {
            sprite_index = other.sprite_index;
            scr_darksize();
        }
        instance_destroy();
    }
}
