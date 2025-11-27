if (init == 0)
{
    var dontbell = false;
    if (global.flag[1798] == 1)
        dontbell = 1;
    if (!dontbell)
    {
        var bellpos = scr_heromarker("gen", "bellbingbong");
        bell = instance_create(bellpos[0], bellpos[1], obj_bell_small_playable);
        scr_size(2, 2, bell);
    }
    else
    {
        belltime = -999;
    }
    init = 1;
}
if (scr_debug())
{
    if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("V")))
    {
        var pos = -4;
        with (obj_climbloc)
            pos = id;
        setxy(bell.x, pos.y, 1049);
    }
}
if (belltime == 0)
{
    if (bell.con == 1)
    {
        global.flag[1544] = 1;
        belltime = 1;
        bell.canring = false;
        with (obj_dw_church_watercooler)
        {
            if (con == 0)
            {
                con = 1;
                doappear = 1;
            }
            mizzle.con = 20;
            mizzle.alerted = 1;
            with (mizzle)
                scr_delay_var("con", 30, 30);
        }
        with (obj_event_manager)
            trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_27);
    }
}
if (i_ex(bell))
{
    if (belltime < 20)
    {
        var trig = 0;
        with (obj_battleback)
        {
            if (image_alpha == 1)
                trig = 1;
        }
        if (trig == 1)
        {
            safe_delete(bell);
            belltime = -1;
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_27 = 27
}
