if (con == 0)
    con = 1;
if (con == 1)
{
    var trig = false;
    with (boardswitch)
    {
        if (pressed)
        {
            global.flag[1212] = 2;
            used = true;
            trig = true;
        }
    }
    if (trig)
    {
        with (obj_board_event_bridgepuzzle)
            dosolve = true;
        scr_shakescreen();
        snd_play(snd_impact);
        with (spikes)
        {
            other.spikes = scr_marker_ext(x, y, sprite_index, 2, 2, 0, 1);
            other.spikes.depth = 99000;
            instance_destroy();
        }
        con = 2;
    }
}
if (endcon == 1)
{
    if (obj_b3bs_console.swordinteract == 1)
    {
        endcon = 2;
        global.interact = 1;
        global.msc = 1411;
        scr_text(global.msc);
        d_make();
    }
}
if (endcon == 2 && !d_ex())
{
    endcon = 1;
    obj_b3bs_console.swordinteract = 0;
    global.interact = 0;
}
