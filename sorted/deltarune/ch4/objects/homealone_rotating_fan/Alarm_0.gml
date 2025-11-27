toggle++;
is_rotating = (toggle % 2) == 1;
if (is_rotating)
{
    scr_flag_set(784, 1);
    sfx = snd_loop(snd_smile);
    snd_volume(sfx, 0, 0);
    snd_pitch(sfx, 0.15);
    image_speed = 0.1;
}
else
{
    scr_flag_set(784, 0);
    scr_flag_set(785, image_index);
    snd_stop(sfx);
    image_speed = 0;
}
snd_play(snd_noise);
alarm[10] = 1;
