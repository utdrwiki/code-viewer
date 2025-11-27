if (con == 0)
{
    var triggered = false;
    if (trig != "")
    {
        with (obj_trigger)
        {
            if (extflag == other.trig)
            {
                if (place_meeting(x, y, obj_mainchara))
                    triggered = true;
            }
        }
    }
    if (triggered == true)
    {
        con = 1;
        timer = 0;
        makeindex = -2;
        chasespeed = 0.1;
    }
}
if (con == 1)
{
    var maxchase = 20;
    if (global.interact == 0)
        chasespeed = lerp(chasespeed, maxchase, 0.0125);
    var targ = 1049;
    with (chaser)
    {
        if (global.interact == 0)
            move_towards_point(targ.x + 16, targ.y + 36, other.chasespeed);
        else
            speed = 0;
        var _xloc = (x + 16) - 30;
        var _yloc = ((y + 30) - 44) + 12;
        if (global.interact == 0)
        {
            if (i_ex(collision_rectangle(_xloc, _yloc, _xloc + 28, _yloc + 20, obj_mainchara, 0, true)))
            {
                snd_play(snd_cough, 1, 1.4);
                snd_play(snd_paper_rise, 0.7, 1.2);
                snd_play(snd_paper_rise, 0.4, 1.8);
                snd_play(snd_ghostappear, undefined, 1.6);
                global.interact = 1;
                speed = 0;
                other.con++;
                scr_lerpvar("x", x, (x - 60) + 120, 20, 4, "out");
                scr_lerpvar("y", y, y - 80, 20);
            }
        }
    }
}
if (con == 2)
{
    timer++;
    if (timer == 1)
        scr_lerpvar("image_alpha", image_alpha, 0, 40, 2, "in");
    if (timer == 35)
    {
        snd_play(snd_tensionhorn);
        snd_play_delay(snd_tensionhorn, 10, undefined, 1.1);
    }
    if (timer == 59)
    {
        scr_battle(150, 0, chaser);
        con = 3;
        scr_doom(id, 120);
    }
}
