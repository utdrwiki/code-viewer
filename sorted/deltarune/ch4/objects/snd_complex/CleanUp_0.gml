if (killall)
{
    for (var i = 0; i < array_length(snd); i++)
    {
        if (audio_exists(play[i]))
            snd_stop(play[i]);
    }
}
if (killind)
{
    for (var i = 0; i < array_length(snd); i++)
    {
        if (audio_exists(play[i]))
        {
            if (killsnd[i])
                snd_stop(play[i]);
        }
    }
}
