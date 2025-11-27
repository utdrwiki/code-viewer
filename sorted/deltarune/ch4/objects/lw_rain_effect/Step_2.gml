if (active && rainsplash)
{
    with (obj_mainchara)
    {
        if (!visible)
            continue;
        if (fun == 0)
        {
            if (image_index == 1 && other.stepped == 0)
            {
                if (!collision_point(x + 10, y + 38, obj_lw_rain_dryzone, false, true))
                    snd_play(snd_stepsplash1, 0.5);
                other.stepped = 1;
            }
            else if (image_index == 0 || image_index == 2)
            {
                other.stepped = 0;
            }
            else if (image_index == 3 && other.stepped == 0)
            {
                if (!collision_point(x + 10, y + 38, obj_lw_rain_dryzone, false, true))
                    snd_play(snd_stepsplash2, 0.5);
                other.stepped = 1;
            }
        }
    }
    with (obj_actor)
    {
        if (!visible)
            continue;
        if (name == "kris")
        {
            if (image_index == 1 && other.stepped == 0)
            {
                if (!collision_point(x + 10, y + 38, obj_lw_rain_dryzone, false, true))
                    snd_play(snd_stepsplash1, 0.5);
                other.stepped = 1;
            }
            else if (image_index == 0 || image_index == 2)
            {
                other.stepped = 0;
            }
            else if (image_index == 3 && other.stepped == 0)
            {
                if (!collision_point(x + 10, y + 38, obj_lw_rain_dryzone, false, true))
                    snd_play(snd_stepsplash2, 0.5);
                other.stepped = 1;
            }
        }
    }
}
