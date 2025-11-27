if (active)
{
    if (con == 0)
    {
        if (i_ex(obj_board_grayregion))
        {
            if (place_meeting(x, y, obj_board_grayregion))
            {
                if (photod == 0)
                {
                    var pointsDisplay = instance_create(x + 16, y + 32, obj_board_pointsGetDisplay);
                    pointsDisplay.amount = 10;
                    pointsDisplay.depth = depth - 1;
                    photod = 1;
                }
                if (image_speed == 0.125)
                    image_speed = 0;
                else
                    image_speed = 0.125;
                con = 1;
            }
        }
    }
    if (con == 1 && !i_ex(obj_board_grayregion))
        con = 0;
}
