toggle++;
is_rotating = (toggle % 2) == 1;
if (is_rotating)
{
    image_index = 0;
    image_speed = 0.1;
}
else
{
    image_speed = 0;
    image_index = 0;
}
snd_play(snd_noise);
alarm[10] = 1;
