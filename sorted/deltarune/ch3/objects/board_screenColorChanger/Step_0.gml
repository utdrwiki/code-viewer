if (roomstart < 60)
    roomstart++;
if (active && roomstart > 30)
{
    if (init == 0)
    {
        var skip = false;
        init = 1;
        if (scr_debug())
        {
            if (image_blend == c_white)
            {
            }
        }
        if (obj_board_camera.shift == "warp")
        {
            init = 0;
            skip = true;
        }
        if (i_ex(obj_board_squaretransition) || i_ex(obj_puzzlecloset_tvturnon))
        {
            skip = true;
            init = 1;
        }
        if (force)
        {
            colorchangetime = force;
            skip = false;
            force = false;
        }
        if (!skip)
        {
            colorchangetime = 16;
            obj_gameshow_swordroute.colorchange = colorchangetime;
            obj_gameshow_swordroute.colorchangetime = colorchangetime;
            obj_gameshow_swordroute.newcolor = image_blend;
        }
    }
}
else
{
    init = 0;
}
