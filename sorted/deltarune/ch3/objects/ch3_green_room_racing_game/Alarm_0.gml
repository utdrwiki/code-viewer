if (game_won)
    exit;
timer--;
if (timer < 0)
{
    snd_stop(snd_racing);
    time_up();
}
else
{
    if ((timer % 120) == 1)
        snd_play(snd_racing);
    alarm[0] = 1;
}
