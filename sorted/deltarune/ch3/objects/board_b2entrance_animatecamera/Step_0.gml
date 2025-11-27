if (active)
{
    if (con == 0)
    {
        if (type == 1)
            visible = 0;
        if (i_ex(obj_board_grayregion))
        {
            if (place_meeting(x, y, obj_board_grayregion))
            {
                visible = 1;
                if (photod == 0)
                {
                    if (amount > 0)
                    {
                        var pointsDisplay = instance_create(x + 16, y + 32, obj_board_pointsGetDisplay);
                        pointsDisplay.amount = other.amount;
                        pointsDisplay.depth = 900000;
                    }
                    photod = 1;
                }
                scr_lerpvar("image_index", 0, 8, 15);
                con = 1;
            }
        }
    }
    if (type == 0)
    {
        if (con == 1 && image_index >= 8 && !i_ex(obj_board_grayregion))
            con = 0;
        var photocount = global.flag[1041] + global.flag[1042];
        if (i_ex(obj_b2pantheonentrance))
        {
            if (obj_b2pantheonentrance.con < 2)
                photocount++;
        }
        visible = true;
        if (photocount >= 3)
            visible = false;
    }
    if (type == 1)
    {
        if (con == 1 && !i_ex(obj_board_grayregion))
        {
            con = 0;
            visible = false;
        }
    }
}
