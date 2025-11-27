if (bounce_buffer <= 0)
{
    snd_stop(snd_bump);
    var bouncespeed = 9;
    bounce_buffer = 3;
    vspeed = -bouncespeed;
    var plusdirection = point_direction(other.x, other.y, x, y) - 90;
    direction += plusdirection;
    if (up_h())
        vspeed -= 2;
    if (down_h())
    {
        if (vspeed < -3)
            vspeed += 3;
    }
    if (right_h())
        hspeed += 2;
    if (left_h())
        hspeed -= 2;
    with (object_index)
    {
        if (bounce_count == 1)
        {
            with (obj_lanino_rematch_enemy)
                scr_mercyadd(myself, 5);
            with (obj_elnina_rematch_enemy)
                scr_mercyadd(myself, 5);
        }
        if (bounce_count > 0)
            bounce_count--;
    }
}
