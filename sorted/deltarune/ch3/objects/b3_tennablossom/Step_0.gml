if (active)
{
    if (con == 0)
    {
        if (i_ex(obj_board_grayregion))
        {
            if (place_meeting(x, y, obj_board_grayregion))
            {
                var rose = scr_board_marker(x, y, sprite_index, 0, 999999, 2);
                with (rose)
                {
                    var pointsDisplay = instance_create(x + 16, y + 32, obj_board_pointsGetDisplay);
                    pointsDisplay.amount = 100;
                    pointsDisplay.depth = depth - 1;
                    scr_animate(0, 3, 0.25);
                }
                con = 1;
            }
        }
    }
}
