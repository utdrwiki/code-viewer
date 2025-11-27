if (kris == 0)
{
    with (obj_mainchara_board)
        other.kris = id;
}
if (active == true)
{
    if (stopper == 0)
    {
        stopper = instance_create(4896, 1568, obj_board_solid);
        with (stopper)
        {
            setxy_board();
            image_xscale = 2;
        }
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (kris.y >= 136)
        {
            kris.wspeed = 3;
            con = 1;
        }
    }
    if (con == 1)
    {
        if (kris.y >= 224)
        {
            kris.wspeed = 2;
            con = 2;
        }
    }
}
