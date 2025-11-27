scr_flag_set(1579, scr_flag_get(1579) + 1);
is_active = !is_active;
is_looping = is_active;
loop_timer = 0;
timer = 0;
image_speed = 0;
image_index = 0;
if (!is_active)
{
    sprite_index = spr_noellehouse_dancing_santa;
    snd_stop(audio_file);
}
snd_play(snd_noise);
alarm[10] = 1;
