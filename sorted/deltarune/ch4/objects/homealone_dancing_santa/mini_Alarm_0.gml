if (turn_on)
    exit;
scr_flag_set(1579, scr_flag_get(1579) + 1);
is_active = !is_active;
is_looping = is_active;
if (room == room_lw_noellehouse_basement)
    is_looping = false;
loop_timer = 0;
timer = 0;
image_speed = 0;
image_index = 0;
if (!is_active)
{
    snd_stop(audio_file);
}
else
{
    turn_on = true;
    snd_play(snd_noise);
}
alarm[10] = 1;
