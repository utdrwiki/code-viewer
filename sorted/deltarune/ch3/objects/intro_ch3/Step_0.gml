if (con == 0)
{
    if (!files_exist)
    {
        timer++;
        if (timer == 75)
            con = 1;
    }
    else
    {
        tv_timer++;
        if (tv_timer == 75)
            tv_time_vfx = instance_create(0, 0, obj_intro_tv_time);
        if (!is_canceled && tv_timer >= 105)
        {
            if (button1_p() || button2_p())
            {
                is_canceled = true;
                tv_time_max = tv_timer;
                fade_time_max = 60;
                var _fade_time = fade_time_max;
                with (tv_time_vfx)
                    snd_volume(tv_sound, 0, _fade_time);
            }
        }
        if (tv_timer == tv_time_max)
        {
            is_canceled = true;
            fade_out();
        }
        if (tv_timer == (tv_time_max + fade_time_max + 30))
            exit_screen();
    }
}
