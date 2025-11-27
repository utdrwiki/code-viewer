if (neverwork)
{
    hover_active = false;
    disable = true;
}
if (type == 1)
{
    if (init == 0)
    {
        y_base_pos = y;
        init = 1;
    }
    if (active)
    {
        target_y_pos = lerp(target_y_pos, y_base_pos - 124, 0.6);
        anim_speed = 0.2;
        siner_speed = 0.4;
    }
    else
    {
        anim_speed = lerp(anim_speed, 0, 0.01);
        siner_speed = lerp(siner_speed, 0, 0.01);
        target_y_pos = lerp(target_y_pos, y_base_pos, 0.6);
    }
    if (global.interact != 0)
    {
        siner_speed = 0;
        anim_speed = 0;
    }
}
