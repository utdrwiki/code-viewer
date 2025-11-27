event_inherited();
if (is_active)
{
    timer++;
    loop_timer++;
    if (timer == 1)
    {
        if (i_ex(obj_homealone_dess_closet_kris))
        {
            if (santa_type == 0)
            {
                with (obj_homealone_dess_closet_kris)
                    santaactive[0] = 1;
            }
            else
            {
                with (obj_homealone_dess_closet_kris)
                    santaactive[1] = 1;
            }
        }
        audio_file = (santa_type == 0) ? 140 : 11;
        play_time = (santa_type == 0) ? 40 : 60;
        image_speed = (santa_type == 0) ? 0.25 : 0.15;
        if (santa_type == 2)
        {
            image_speed *= 1.5;
            santa_pitch *= 1.5;
            play_time *= 1.5;
        }
        snd_play(audio_file, 1, santa_pitch);
    }
    if (timer == play_time)
    {
        timer = 0;
        image_speed = 0;
        image_index = 0;
        if (is_looping)
        {
            timer = 0;
        }
        else
        {
            alarm[10] = 1;
            is_active = false;
        }
    }
}
