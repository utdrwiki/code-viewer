scr_populatechars();
if (scr_debug())
{
    if (con == 0)
    {
        if (global.tempflag[90] == 10)
        {
            global.tempflag[90] = 0;
            var pos = scr_heromarker("kris", "cutsceneEnd");
            setxy(pos[0], pos[1], 1049);
            con = 1;
        }
    }
}
if (!init)
{
    global.flag[7] = 1;
    mus_play_ext("creepychase.ogg", 1, 0.72, 0.8);
    init = 1;
}
if (con == 0)
{
    chaser = instance_create((camerax() + 640) - 70, cameray() + 240, obj_dw_church_waterfallchaser);
    con = 1;
    global.interact = 0;
}
if (con == 1)
{
    if (subcon == 0)
    {
        if (global.hp[1] <= 50)
        {
            subcon = 1;
            scr_delay_var("subcon", 2, 10);
        }
    }
    if (scr_trigcheck("seqEnd") || subcon == 2)
    {
        with (obj_darkcontroller)
            charcon = 0;
        con = 2;
        global.interact = 1;
        safe_delete(chaser);
        timer = 0;
    }
}
if (con == 2)
{
    timer++;
    if (timer == 30)
    {
        with (obj_dmgwriter)
            depth = 4000;
        with (scr_marker_ext(camerax() - 10, cameray() - 10, spr_pxwhite, 660, 500, undefined, undefined, c_black, 5000, undefined, undefined, 0))
            scr_lerpvar("image_alpha", 0, 1, 30);
    }
    if (timer > 90)
    {
        global.flag[7] = 0;
        con = 3;
        global.tempflag[90] = 7;
        room_goto(room_dw_church_ripplepuzzle);
    }
}
