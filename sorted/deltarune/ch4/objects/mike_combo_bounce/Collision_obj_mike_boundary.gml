if (bounce < 0)
{
    bounce = 1;
    x = xprevious;
    y = yprevious;
    sound_play(snd_bump);
    scr_shakescreen();
    aim += 1;
    if (aim > 1)
    {
        aim = 0;
        direction = point_direction(x, y, obj_mike_controller.x, obj_mike_controller.y) + choose(-25, 0, 25);
    }
    else
    {
        move_bounce_all(true);
    }
}
