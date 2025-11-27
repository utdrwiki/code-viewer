if (init == 0)
{
    if (instance_exists(obj_dw_church_holywatercooler) || instance_exists(obj_dw_church_rippleworship) || instance_exists(obj_dw_church_waterfallroom) || instance_exists(obj_dw_church_waterfalltearoom) || room == room_dw_church_waterfalltearoom)
        hintcol = #FFC77B;
    if (instance_exists(obj_dw_church_holywatercooler))
    {
        hint = scr_secretpianocombo(0);
        hintno = 0;
    }
    if (instance_exists(obj_dw_church_rippleworship))
    {
        hint = scr_secretpianocombo(1);
        hintno = 1;
        hintslots = 4;
    }
    if (instance_exists(obj_dw_church_waterfallroom) || instance_exists(obj_dw_church_waterfalltearoom) || room == room_dw_church_waterfalltearoom)
    {
        hint = scr_secretpianocombo(2);
        hintno = 3;
    }
    if (globalflag != -1 && global.flag[globalflag])
        preinit = 1;
    if (preinit == 1)
    {
        preinit = 0;
        scr_lerpvar("alpha", 0, 1, 30, 2, "out");
        active = 1;
        scr_depth();
        depth -= 100;
        if (createlight)
        {
            with (instance_create(x, y, obj_light_following))
            {
                size = 1;
                scr_lerpvar("size", 1, other.lightsize, 30, -1, "out");
            }
        }
    }
    init = 1;
}
if (!active)
{
    var trig = 0;
    if (trigmark == 0)
    {
        with (obj_trigger)
        {
            if (extflag == other.hint)
                other.trigmark = 1;
        }
    }
    if (trigmark == 0)
    {
        with (obj_floorswitch)
        {
            if (extflag == other.hint)
                other.trigmark = 1;
        }
    }
    if (!trigmark)
    {
        if (instance_exists(obj_mainchara))
        {
            if (distance_to_object(obj_mainchara) < range)
                trig = 1;
        }
    }
    else
    {
        with (obj_trigger)
        {
            if (extflag == other.hint)
            {
                if (place_meeting(x, y, obj_mainchara))
                    trig = 1;
            }
        }
    }
    with (obj_floorswitch)
    {
        if (extflag == other.hint)
        {
            if (pressed)
                trig = 1;
        }
    }
    if (dotrig)
    {
        trig = 1;
        dotrig = 0;
    }
    if (trig == 1)
    {
        if (globalflag != -1)
            global.flag[globalflag] = 1;
        if (!silent && !preinit)
        {
            snd_play(snd_spearappear, 0.45, 1.2);
            snd_play(snd_spearappear, 0.65, 1.3);
            snd_play(snd_spearappear, 0.85, 1.4);
        }
        scr_lerpvar("alpha", 0, 1, 30, 2, "out");
        active = 1;
        scr_depth();
        depth -= 100;
        if (createlight)
        {
            with (instance_create(x, y, obj_light_following))
            {
                size = 1;
                scr_lerpvar("size", 1, other.lightsize, 30, -1, "out");
            }
        }
    }
}
