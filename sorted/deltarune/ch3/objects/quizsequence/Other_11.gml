var ralStart = ralseicoord;
if (scr_debug() && con == 3 && keyboard_check_pressed(ord("3")))
{
    rsel = false;
    ralBehavior++;
    rtimer = 0;
    rCon = 0;
    if (ralBehavior > 2)
        ralBehavior = 0;
    var _b_desc = "";
    if (ralBehavior == 0)
        _b_desc = "idle";
    else if (ralBehavior == 1)
        _b_desc = "follow kris";
    else if (ralBehavior == 2)
        _b_desc = "guess";
    scr_debug_print("Ralsei behavior set to " + string(ralBehavior) + " (" + _b_desc + ")");
}
if (rsel)
    exit;
var _can_answer = (!board4 || myanswer != -1) && (con == 4 || commenttimer >= ra_wait);
if (con == 4 && countdown <= 2 && myanswer != -1)
{
    rtarget = ralseicoord;
    rtimer = 0;
    rchoose = 1;
    rCon = -1;
}
if (rchoose == 1)
{
    if (rCon >= 0)
    {
        if (rtarget == ralseicoord && myanswer == rtarget)
            rtimer = 15;
        else
            rtimer = 12;
        rCon = -1;
    }
    rtimer--;
    if (rtimer <= 0)
    {
        if (ralseicoord == rtarget)
        {
            rsel = true;
            if (i_ex(quizzler))
                quizzler.ra_press = 8;
            choicepitch += 0.1;
        }
        else
        {
            if (ralseicoord < rtarget)
                ralseicoord++;
            else
                ralseicoord--;
            rtimer = 12;
        }
    }
}
else if (quizid == "cable" && con == 3 && commenttimer == 150)
{
    rtarget = 1;
}
else if (quizid == "puppetshow")
{
}
else if (con == 4 && quizid == "hathy" && menucoord[0] == 0)
{
    rchoose = 1;
    rtarget = ra_guess;
}
else if (con == 4 && rchoose == -1)
{
    rchoose = 1;
    if (ra_guess < 0)
        ra_guess = irandom(3);
    rtarget = ra_guess;
}
else if (con == 4 && rchoose != -1 && !board4)
{
    rtarget = menucoord[0];
    rchoose = 1;
}
else if (_can_answer)
{
    if (ra_guess >= 0)
        rtarget = ra_guess;
    else
        rchoose = menucoord[0];
    rchoose = 1;
}
else
{
    switch (ralBehavior)
    {
        case 0:
            rtimer--;
            if (rtimer < 0 && ralseicoord != rtarget)
            {
                if (ralseicoord < rtarget)
                    ralseicoord++;
                else
                    ralseicoord--;
                rtimer = 10;
            }
            break;
        case 1:
            if (ralbuffer > 0)
            {
                ralbuffer--;
                if (ralbuffer <= 0)
                {
                    rtimer = 0;
                    rtarget = menucoord[0];
                }
            }
            rtimer--;
            if (rtimer < 0 && ralseicoord != rtarget)
            {
                if (ralseicoord < rtarget)
                    ralseicoord++;
                else
                    ralseicoord--;
                rtimer = 10;
            }
            break;
        case 2:
            if (rCon == 0)
            {
                rCon = 1;
                rtarget = irandom(3);
                rtimer = (ralseicoord == rtarget) ? 30 : 20;
            }
            rtimer--;
            if (rtimer < 0)
            {
                if (ralseicoord != rtarget)
                {
                    if (ralseicoord < rtarget)
                        ralseicoord++;
                    else
                        ralseicoord--;
                    rtimer = 10;
                }
                else if (ralseicoord == rtarget)
                {
                    if (rCon == 1)
                    {
                        var _guess = irandom(7);
                        if (_guess > 2)
                            rtarget = correctanswer;
                        else
                            rtarget = _guess;
                        rCon = 2;
                        rtimer = 20;
                    }
                    else if (rCon == 2)
                    {
                        rCon = 3;
                        rtimer = 20;
                    }
                    else if (rCon == 3)
                    {
                        rCon = 4;
                        rsel = true;
                    }
                }
            }
            break;
    }
}
if (ralStart != ralseicoord)
{
    var _ralMenuSnd = snd_play_pitch(snd_menumove, 1.1);
    snd_volume(_ralMenuSnd, 0.6, 0);
    if (i_ex(quizzler))
        quizzler.ra_press = 6;
}
if (rsel)
    snd_play_pitch(snd_select, choicepitch);
