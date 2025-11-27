event_inherited();
if (is_active)
{
    timer++;
    loop_timer++;
    if (timer == 1)
    {
        audio_file = (santa_type == 0) ? 140 : 11;
        play_time = (santa_type == 0) ? 40 : 60;
        sprite_index = spr_noellehouse_dancing_santa_pressed;
        image_speed = 0.25;
        image_speed = (santa_type == 0) ? 0.25 : 0.15;
        if (santa_type == 2)
        {
            image_speed = 0.4;
            santa_pitch = 2.5;
            play_time = 30;
        }
        snd_play(audio_file, 0.5, santa_pitch);
    }
    if (timer == play_time)
    {
        timer = 0;
        image_speed = 0;
        image_index = 0;
        if (global.interact == 0 && loop_timer >= 90)
        {
            is_looping = false;
            loop_timer = 0;
        }
        if (is_looping)
        {
            timer = 0;
        }
        else
        {
            sprite_index = spr_noellehouse_dancing_santa;
            alarm[10] = 1;
            is_active = false;
        }
    }
    if (global.interact == 3)
    {
        is_active = false;
        snd_stop(audio_file);
    }
}
