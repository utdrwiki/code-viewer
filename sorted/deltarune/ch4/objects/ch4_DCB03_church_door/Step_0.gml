if (crack_door)
{
    crack_door = false;
    is_cracked = true;
    snd_play(snd_noise);
    image_index = 1;
    ballcon = 3;
}
if (open_door)
{
    open_door = false;
    is_open = true;
    is_cracked = false;
    snd_play(snd_locker);
    image_index = 2;
    alarm[0] = 30;
}
if (close_door)
{
    close_door = false;
    is_open = false;
    is_cracked = false;
    image_index = 0;
}
