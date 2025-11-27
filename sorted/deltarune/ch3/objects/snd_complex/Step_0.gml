mastertime++;
timer++;
var count = array_length(snd);
for (var i = 0; i < count; i++)
{
    if (looprate[i] != -1)
    {
        if (((timer - delay[i]) % looprate[i]) == 0)
        {
            if (snd[i] != -1)
            {
                if (killsnd[i])
                {
                    if (audio_exists(play[i]))
                        snd_stop(play[i]);
                }
                play[i] = snd_play(snd[i], volume[i], pitch[i]);
            }
        }
    }
    else if (timer == (1 + delay[i]))
    {
        if (snd[i] != -1)
            play[i] = snd_play(snd[i], volume[i], pitch[i]);
    }
}
if (lifetime)
{
    if (mastertime >= lifetime)
        instance_destroy();
}
var lastdelay = 0;
var anyloop = 0;
var nothingplaying = true;
for (var i = 0; i < count; i++)
{
    if (snd[i] != -1)
        nothingplaying = false;
    lastdelay += delay[i];
    if (looprate != -1)
        anyloop = true;
}
if (!anyloop)
{
    if (timer > (lastdelay + 10))
    {
        var killme = true;
        for (var i = 0; i < count; i++)
        {
            if (audio_is_playing(play[i]))
                killme = false;
        }
        if (killme)
        {
            debug_message("obj_snd_complex: Sounds are done playin'. Die time.");
            instance_destroy();
        }
    }
}
if (nothingplaying)
{
    debug_message("obj_snd_complex: Nothing was playing in this complex sound");
    instance_destroy();
}
