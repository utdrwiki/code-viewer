scr_board_enemy_step_init();
scr_depth_board();
repeat (spd)
{
    if (delay < 1)
    {
        if (direction == 270)
        {
            if (!position_meeting(x + 16 + 32, y + 4, obj_board_solid))
            {
                direction = 0;
                delay = 8;
            }
            if (position_meeting(x + 1, y + 33, obj_board_solid))
            {
                direction = 180;
                delay = 4;
                alt = 1;
            }
            xx = x + 16 + 32;
            yy = y + 4;
            xx2 = x + 1;
            yy2 = y + 33;
        }
        else if (direction == 0)
        {
            if (!position_meeting(x + 4, (y + 16) - 32, obj_board_solid))
            {
                direction = 90;
                delay = 8;
            }
            if (position_meeting(x + 33, y, obj_board_solid))
            {
                direction = 270;
                delay = 4;
            }
            xx = x + 4;
            yy = (y + 16) - 32;
            xx2 = x + 33;
            yy2 = y;
        }
        else if (direction == 90)
        {
            if (!position_meeting((x + 16) - 32, y + 28, obj_board_solid))
            {
                direction = 180;
                delay = 8;
            }
            if (position_meeting(x + 4, y - 1, obj_board_solid))
            {
                direction = 0;
                delay = 4;
            }
            xx = (x + 16) - 32;
            yy = y + 28;
            xx2 = x + 4;
            yy2 = y - 1;
        }
        else if (direction == 180)
        {
            if (!position_meeting(x + 28, y + 16 + 32, obj_board_solid))
            {
                direction = 270;
                delay = 8;
            }
            if (position_meeting(x - 1, y + 1, obj_board_solid))
            {
                direction = 90;
                delay = 4;
            }
            xx = x + 28;
            yy = y + 16 + 28;
            xx2 = x - 1;
            yy2 = y;
        }
    }
    x += lengthdir_x(1, direction);
    y += lengthdir_y(1, direction);
}
if (delay > 0)
    delay--;
