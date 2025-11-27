if (init == 0)
{
    if (custdepth != -1)
        depth = custdepth;
    sprite_index = sprite;
    if (globalflag != -1)
    {
        if (global.flag[globalflag])
        {
            pressed = 1;
            pushonce = true;
        }
    }
    init = 1;
}
if (pressed == 0)
{
    image_index = 0;
    var dopress = false;
    if (place_meeting(x, y, obj_mainchara))
        dopress = true;
    if (actorpressable)
    {
        if (place_meeting(x, y, obj_actor))
            dopress = true;
    }
    if (caterpressable)
    {
        if (place_meeting(x, y, obj_caterpillarchara) || place_meeting(x, y, obj_caterpillar_generic))
            dopress = true;
    }
    if (dopress)
    {
        if (globalflag != -1)
            global.flag[globalflag] = 1;
        switch (actsound)
        {
            case 0:
            default:
                snd_play(snd_spearappear, 0.6, 1.2);
                snd_play(snd_spearappear, 0.8, 1.4);
                snd_play(snd_noise, 0.6);
                break;
            case -1:
                break;
            case 3:
                snd_play(snd_churchbell_long, 1, 1.1);
                break;
        }
        presscount++;
        event_user(0);
        pressed = 1;
    }
}
if (pressed)
{
    image_index = 1;
    if (!pushonce)
    {
        var stillpressed = false;
        if (place_meeting(x, y, obj_mainchara))
            stillpressed = true;
        if (actorpressable)
        {
            if (place_meeting(x, y, obj_actor))
                stillpressed = true;
        }
        if (caterpressable)
        {
            if (place_meeting(x, y, obj_caterpillarchara) || place_meeting(x, y, obj_caterpillar_generic))
                stillpressed = true;
        }
        if (!stillpressed)
        {
            switch (actsound)
            {
                case 0:
                default:
                    snd_play(snd_noise, 1, 0.8);
                    break;
            }
            pressed = false;
        }
    }
}
