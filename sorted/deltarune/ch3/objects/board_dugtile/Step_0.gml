if (active)
{
    if (con == 0)
    {
        if (place_meeting(x, y, obj_board_marker))
        {
            var lan = instance_place(x, y, obj_board_marker);
            if (lan.sprite_index == spr_board_lancer_dug)
            {
                image_alpha = 1;
                con = 1;
            }
        }
    }
}
