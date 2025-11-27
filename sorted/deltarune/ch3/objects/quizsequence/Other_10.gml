var susStart = susiecoord;
if (scr_debug() && con == 3 && keyboard_check_pressed(ord("2")))
{
    ssel = false;
    sCon = 0;
    stimer = 0;
    susBehavior++;
    if (susBehavior > 3)
        susBehavior = 0;
    var _b_desc = "";
    if (susBehavior == 0)
        _b_desc = "idle";
    else if (susBehavior == 1)
        _b_desc = "follow kris/ralsei";
    else if (susBehavior == 2)
        _b_desc = "\"stop copying me!\"";
    else if (susBehavior == 3)
        _b_desc = "bored/guessing";
    scr_debug_print("Susie behavior set to " + string(susBehavior) + " (" + _b_desc + ")");
}
if (ssel)
    exit;
var _can_answer = !board4 || myanswer != -1;
if (con == 4 && countdown <= 5 && myanswer != -1)
{
    starget = susiecoord;
    stimer = 0;
    schoose = 1;
    sCon = -1;
}
var _followTarget = (ralBehavior == 2 && susBehavior <= 3) ? ralseicoord : menucoord[0];
if (schoose == 1)
{
    if (sCon >= 0)
    {
        if (susBehavior != 1 || starget == susiecoord)
        {
            stimer = 10;
            sCon = -1;
        }
    }
    stimer--;
    if (stimer <= 0)
    {
        if (susiecoord == starget)
        {
            if (quizid == "ax")
                quizzler.su_ready = 418;
            ssel = true;
            if (i_ex(quizzler))
                quizzler.su_press = 4;
            choicepitch += 0.1;
        }
        else
        {
            if (susiecoord < starget)
                susiecoord++;
            else
                susiecoord--;
            stimer = 7;
        }
    }
}
else if (con == 4 && schoose == 0)
{
    if (quizid == "hathy" && menucoord[0] == 0)
    {
        scr_createquizcomment(stringsetloc("You wish, dumbass. Haha.", "obj_quizsequence_slash_Other_10_gml_60_0"), 1);
        schoose = -1;
    }
    else if (quizid == "puppetshow")
    {
    }
    else if (quizid == "forest")
    {
        if (menucoord[0] == 3)
        {
            scr_createquizcomment(stringsetloc("Kris, are you stupid? Haha.", "obj_quizsequence_slash_Other_10_gml_67_0"), 1);
            schoose = 1;
            starget = su_guess;
        }
        else
        {
            if (menucoord[0] != 2)
                scr_createquizcomment(stringsetloc("Yeah, that one.", "obj_quizsequence_slash_Other_10_gml_76_0"), 1);
            schoose = 1;
            starget = menucoord[0];
        }
    }
    else if (quizid == "favfood")
    {
        scr_createquizcomment(stringsetloc("Uhh, well,#you'd know.", "obj_quizsequence_slash_Other_10_gml_83_0"), 1);
        schoose = 1;
        starget = menucoord[0];
    }
    else if (_can_answer)
    {
        schoose = 1;
        starget = menucoord[0];
    }
}
else if (con == 4 && schoose == -1)
{
    schoose = 1;
    stimer = 10;
    if (su_guess < 0)
        su_guess = irandom(3);
    starget = su_guess;
}
else if (commenttimer >= su_wait && su_guess >= 0 && _can_answer)
{
    schoose = 1;
    starget = su_guess;
}
else
{
    switch (susBehavior)
    {
        case 0:
            stimer--;
            if (stimer < 0 && susiecoord != starget)
            {
                if (susiecoord == 0 && starget == 3)
                    susiecoord = 3;
                else if (susiecoord == 3 && starget == 0)
                    susiecoord = 0;
                else if (susiecoord < starget)
                    susiecoord++;
                else
                    susiecoord--;
                stimer = 10;
            }
            break;
        case 1:
            if (susbuffer > 0)
            {
                susbuffer--;
                if (susbuffer <= 0)
                {
                    stimer = 0;
                    starget = _followTarget;
                }
            }
            stimer--;
            if (stimer < 0 && susiecoord != starget)
            {
                if (susiecoord == 0 && starget == 3)
                    susiecoord = 3;
                else if (susiecoord == 3 && starget == 0)
                    susiecoord = 0;
                else if (susiecoord < starget)
                    susiecoord++;
                else
                    susiecoord--;
                stimer = 5;
            }
            break;
        case 2:
            if (sCon == 0)
            {
                starget = irandom(1);
                if (starget == menucoord[0])
                    starget++;
                sCon = 1;
                stimer = 8;
            }
            if (susbuffer > 0)
            {
                susbuffer--;
                if (susbuffer <= 0)
                {
                    stimer = 0;
                    starget = irandom(1);
                    if (starget == menucoord[0])
                        starget++;
                }
            }
            stimer--;
            if (stimer < 0 && susiecoord != starget)
            {
                if (susiecoord == 0 && starget == 3)
                    susiecoord = 3;
                else if (susiecoord == 3 && starget == 0)
                    susiecoord = 0;
                else if (susiecoord < starget)
                    susiecoord++;
                else
                    susiecoord--;
                stimer = 5;
            }
            break;
        case 3:
            if (sCon == 0)
            {
                soffset = 0;
                sflipcount = 0;
                sCon = 1;
                stimer = 15;
            }
            stimer--;
            if (stimer <= 0)
            {
                if (sCon == 1)
                {
                    sflipcount++;
                    susiecoord = sflipcount % 2;
                    var _diff = clamp(soffset + irandom_range(-1, 1), -1, 1);
                    if (sflipcount == 33)
                    {
                        stimer = 27;
                        sCon = 2;
                    }
                    else if (sflipcount >= 20)
                    {
                        stimer = (5 + _diff) - soffset;
                    }
                    else if (sflipcount >= 10)
                    {
                        stimer = (12 + _diff) - soffset;
                    }
                    else
                    {
                        stimer = (15 + _diff) - soffset;
                    }
                    soffset = _diff;
                }
                else if (sCon == 2)
                {
                    susiecoord = irandom(2);
                    sCon = 3;
                    stimer = 10;
                }
            }
            else if (sCon == 3)
            {
                ssel = true;
                sCon = 4;
            }
            break;
    }
}
if (susStart != susiecoord)
{
    var _susMenuSnd = snd_play_pitch(snd_menumove, 0.9);
    snd_volume(_susMenuSnd, 0.6, 0);
    if (i_ex(quizzler))
        quizzler.su_press = 3;
}
if (ssel)
    snd_play_pitch(snd_select, choicepitch);
