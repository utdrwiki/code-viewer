function scr_boardlancer_voice()
{
    if (argument_count == 0)
    {
        for (var i = 0; i < 3; i++)
            snd_play_delay(snd_txtlan, 8 + (3 * i), 1, 1 + (i / 14));
    }
    else if (argument0 == 1)
    {
        for (var i = 0; i < 3; i++)
            snd_play_delay(snd_txtlan, 1 + (3 * i), 1, 1 - (i / 14));
    }
}
