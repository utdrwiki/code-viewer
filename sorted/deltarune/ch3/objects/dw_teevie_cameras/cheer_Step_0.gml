if (type == 1)
{
    if (init == 0)
    {
        y_base_pos = y + 500;
        init = 1;
    }
    if (active)
    {
        y_base_pos = lerp(y_base_pos, y + 280, 0.6);
        anim_speed = 0.2;
        siner_speed = 0.4;
    }
    else
    {
        anim_speed = lerp(anim_speed, 0, 0.01);
        siner_speed = lerp(siner_speed, 0, 0.01);
        y_base_pos = lerp(y_base_pos, y + 280 + 140, 0.1);
    }
    if (global.interact != 0)
    {
        siner_speed = 0;
        anim_speed = 0;
    }
}
