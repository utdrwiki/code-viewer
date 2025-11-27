if (event_chase_active)
{
    runner_anim += runner_anim_speed;
    event_x_pos -= (bg_speed_max - event_run_speed);
    var tenna_pos = (camerax() + (view_wport[0] / 2)) - 20;
    var runner_pos = camerax() + event_x_pos;
    if (!event_speed_up)
    {
        if (abs(tenna_pos - runner_pos) <= 60 && abs(tenna_pos - runner_pos) > 20)
        {
            event_run_speed = 3;
            runner_anim_speed = 0.2;
        }
    }
    if (abs(tenna_pos - runner_pos) <= 20)
    {
        event_chase_active = false;
        if (event_mode == "battle")
            runner_sprite = 734;
        event_start();
    }
}
