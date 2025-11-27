if (i_ex(obj_climb_kris))
{
    if (con == 0)
    {
        if (defaultbias == -4)
            defaultbias = obj_climb_kris.naturalybias;
        var skipcheck = false;
        if (permanent && ((obj_climb_kris.dir % 2) == 1 || obj_climb_kris.naturalybias == (nudge * (obj_climb_kris.dir - 1))))
            skipcheck = true;
        if (!skipcheck && place_meeting(x, y, obj_climb_kris))
            con = 1;
    }
    else if (con == 1)
    {
        if (permanent)
        {
            if ((obj_climb_kris.dir % 2) == 0)
            {
                if (obj_climb_kris.naturalybias != (nudge * (obj_climb_kris.dir - 1)))
                    scr_lerpvar_instance(27, "naturalybias", obj_climb_kris.naturalybias, nudge * (obj_climb_kris.dir - 1), 30, 0, "out");
            }
            timer = 0;
            con = 3;
        }
        timer = clamp(0, 1, timer + 0.05);
        obj_climb_kris.naturalybias = lerp(defaultbias, nudge, timer);
        if (!place_meeting(x, y, obj_climb_kris))
            con = 2;
    }
    else if (con == 2)
    {
        timer = clamp(0, 1, timer - 0.05);
        if (timer == 0)
            con = 0;
        obj_climb_kris.naturalybias = lerp(defaultbias, nudge, timer);
        if (place_meeting(x, y, obj_climb_kris))
            con = 1;
    }
    else
    {
        timer++;
        if (timer >= 35)
            con = 0;
    }
}
