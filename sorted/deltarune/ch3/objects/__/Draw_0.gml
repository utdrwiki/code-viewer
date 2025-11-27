if (hurttimer > 0)
{
    hurttimer--;
    if ((hurttimer % 2) == 0)
    {
        if (sprite_index == spr___hurt)
            sprite_index = spr___;
        else
            sprite_index = spr___hurt;
    }
    if (hurttimer == 0)
    {
        alivetimer = 600;
        active = false;
    }
    if (hurttimer > 6)
    {
        if (hitdir == 0)
        {
            repeat (10)
            {
                if (!place_meeting(x, y + 1, obj_board_solid))
                    y += 1;
                else
                    break;
            }
        }
        if (hitdir == 1)
        {
            repeat (10)
            {
                if (!place_meeting(x + 1, y, obj_board_solid))
                    x += 1;
                else
                    break;
            }
        }
        if (hitdir == 2)
        {
            repeat (10)
            {
                if (!place_meeting(x, y - 1, obj_board_solid))
                    y -= 1;
                else
                    break;
            }
        }
        if (hitdir == 3)
        {
            repeat (10)
            {
                if (!place_meeting(x - 1, y, obj_board_solid))
                    x -= 1;
                else
                    break;
            }
        }
    }
}
if (sprite_index != spr___no)
    draw_self_board();
if (state == "disappear")
{
    scr_board_marker(x, y, spr___laugh, 0.4, depth, 2, 1);
    instance_create(x, y, obj_create_candy);
    instance_destroy();
}
