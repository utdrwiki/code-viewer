if (init == 0)
{
    init = 1;
    with (obj_mainchara)
    {
        dsprite = spr_krisd;
        rsprite = spr_krisr;
        lsprite = spr_krisl;
        usprite = spr_krisu;
    }
}
if (faded == 0)
{
    if (!i_ex(fadein))
    {
        faded = 1;
        global.interact = 0;
    }
}
if (rudinn4 == 0)
{
    with (obj_npc_room)
    {
        if (extflag == "rudinn4")
            other.rudinn4 = id;
    }
}
if (rudinn4.talked == 1 && binocon == -1 && !bw_ex())
{
    global.interact = 1;
    destx = 256;
    desty = 268;
    if (obj_mainchara.x < 320)
        destx = 384;
    binocon = -9;
}
if (binocon == -9)
{
    global.interact = 1;
    scr_script_delayed(scr_var, 2, "binocon", -8);
}
if (binocon == -8)
{
    var movetime = 18;
    with (rudinn4)
        scr_lerpvar("y", y, y - 16, movetime);
    scr_script_delayed(scr_var, movetime, "binocon", -7);
    binocon = -999;
}
if (binocon == -7)
{
    var movetime = 24;
    with (rudinn4)
        scr_lerpvar("x", x, other.destx, movetime);
    scr_script_delayed(scr_var, movetime + 2, "binocon", -6);
    binocon = -999;
}
if (binocon == -6)
{
    global.interact = 0;
    global.facing = 0;
    binocon = 0;
}
if (binocon == 1)
{
    binobuff = 3;
    binocon = 2;
}
if (binocon == 2)
{
    binobuff--;
    if (binobuff < 0 && button1_p())
    {
        snd_play_pitch(snd_item, 0.5);
        global.interact = 0;
        global.facing = 0;
        binocon = 99;
        binobuff = 3;
    }
}
if (binocon == 99)
{
    binobuff--;
    if (binobuff <= 0)
        binocon = 0;
}
