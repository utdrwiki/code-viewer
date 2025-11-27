if (act == 0)
    yy = scr_approach(yy, 0, 4);
if (act == 1)
{
    var _y = y + 30 + yy;
    if (obj_mike_controller.my > _y)
        yy = scr_approach(yy, 80, 0.5 * abs(_y - obj_mike_controller.my));
    if (yy == 80)
    {
        snd_play(snd_locker);
        act = 2;
    }
    var check_hats = 0;
    with (obj_mouse_hat)
    {
        if (act == 1)
            check_hats = 1;
    }
    if (check_hats)
        act = 0;
    if (obj_mike_controller.mx < x || obj_mike_controller.mx > (x + 80))
    {
        act = 0;
        with (obj_mike_controller)
            hand_type = 0;
    }
}
