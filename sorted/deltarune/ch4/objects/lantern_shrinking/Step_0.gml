if (init == 0)
{
    if (r_littlesize != -1)
        littlesize = r_littlesize;
    if (r_bigsize != -1)
        bigsize = r_bigsize;
    if (r_maxtimer != -1)
        maxtimer = r_maxtimer;
    if (r_timebuffer != -1)
        timebuffer = r_timebuffer;
    nointeract = true;
    init = 1;
}
siner++;
size = ease_inout_expo(timer, littlesize, bigsize - littlesize, maxtimer + timebuffer);
if (!nointeract)
{
    if (con == 0 && global.interact == 0)
    {
        timer = max(timer - 1, 0);
        if (mytrig.myinteract == 3)
        {
            snd_play(snd_wing, 1, 1.4);
            mytrig.myinteract = 0;
            growtime = timetogrow;
            scr_lerpvar("timer", timer, maxtimer + timebuffer, growtime, 2, "in");
            con = 1;
        }
    }
    if (con == 1)
    {
        growtime--;
        if (growtime <= 0)
        {
            mytrig.myinteract = 0;
            con = 0;
        }
    }
}
if (extflag != "")
{
    var amon = false;
    with (obj_floorswitch)
    {
        if (extflag == other.extflag)
        {
            if (pressed)
                amon = true;
        }
    }
    if (amon)
        timer = clamp(round(lerp(timer, maxtimer + timebuffer + 1, 0.25)), 0, maxtimer + timebuffer);
    else
        timer--;
}
if (i_ex(myspr2))
    myspr2.image_alpha = ((((size + (littlesize / 6)) * 1.125) + (sin(siner / 30) * 2)) - littlesize) / (bigsize - littlesize);
