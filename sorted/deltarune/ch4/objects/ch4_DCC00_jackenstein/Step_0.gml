if (current_mode == 1)
{
    if (up_h())
    {
        if (current_state == 0)
            image_index += 1;
        change_state(1);
    }
    else if (down_p())
    {
        x = fixed_x_pos;
        scr_shakeobj();
    }
    else
    {
    }
    if (current_state == 1)
    {
        if (floor(image_index) != 2 && floor(image_index) != 0)
            y -= (6 * climb_speed);
        if (dust_timer == 10)
            dust_timer = 0;
        if (floor(image_index) == 2)
        {
            if (floor(image_was) != 2)
            {
                y -= (10 * climb_speed);
                dust_timer = 0;
                if (!up_h())
                    change_state(0);
                dust_effect();
                crack_a_row();
            }
        }
        if (floor(image_index) == 0 && floor(image_was) != 0)
        {
            y -= (10 * climb_speed);
            dust_timer = 0;
            if (!up_h())
                change_state(0);
            dust_effect();
            crack_a_row();
        }
    }
    image_was = image_index;
}
