if (con == 0)
{
    if (down_h())
        dholdbuff++;
    else
        dholdbuff = -1;
    if (up_h())
        uholdbuff++;
    else
        uholdbuff = -1;
    if (up_h() && down_h())
    {
        dholdbuff = -1;
        uholdbuff = -1;
    }
    if (left_h())
        lholdbuff++;
    else
        lholdbuff = -1;
    if (right_h())
        rholdbuff++;
    else
        rholdbuff = -1;
    if (left_h() && right_h())
    {
        rholdbuff = -1;
        lholdbuff = -1;
    }
    var nummod = numinc;
    var uprate = 10;
    if (fasterovertime)
    {
        if (up_h() || down_h())
            uspeedbuff++;
        else
            uspeedbuff = 0;
        if (up_h() && down_h())
            uspeedbuff = 0;
        if (uspeedbuff == 0)
            buffmodrate = buffmoddefault;
        if (uspeedbuff > (uprate * 1))
            buffmodrate = 4;
        if (uspeedbuff > (uprate * 2))
            buffmodrate = 3;
        if (uspeedbuff > (uprate * 3))
            buffmodrate = 2;
        if (uspeedbuff > (uprate * 4))
            buffmodrate = 1;
        if (uspeedbuff > (uprate * 6))
            nummod = 5 * numinc;
        if (uspeedbuff > (uprate * 10))
            nummod = 10 * numinc;
        if (uspeedbuff > (uprate * 15))
            nummod = 100 * numinc;
        if (uspeedbuff > (uprate * 20))
            nummod = 1000 * numinc;
        if (nummod != 1 && roundval == true)
            num = round(num / nummod) * nummod;
    }
    if (up_h() && (uholdbuff % buffmodrate) == 0)
    {
        if (num < maxnum)
        {
            snd_stop(snd_menumove);
            snd_play_pitch(snd_menumove, 1);
        }
        num += nummod;
    }
    else if (down_h() && (dholdbuff % buffmodrate) == 0)
    {
        if (num > minnum)
        {
            snd_stop(snd_menumove);
            snd_play_pitch(snd_menumove, 0.9);
        }
        num -= nummod;
    }
    var checkround = false;
    if (biginc != -1)
    {
        if (right_h() && (rholdbuff % buffmodrate) == 0)
        {
            if (num < maxnum)
            {
                snd_stop(snd_menumove);
                snd_play_pitch(snd_menumove, 1);
            }
            num += biginc;
            checkround = false;
        }
        else if (left_h() && (lholdbuff % buffmodrate) == 0)
        {
            if (num > minnum)
            {
                snd_stop(snd_menumove);
                snd_play_pitch(snd_menumove, 0.9);
            }
            num -= biginc;
            checkround = false;
        }
        if (roundval == true && checkround)
            num = round(num / biginc) * biginc;
    }
    num = clamp(num, minnum, maxnum);
    if (button1_p())
    {
        snd_play_pitch(snd_menumove, 1.2);
        con = 1;
        result = num;
    }
    cancelbuffer--;
    if (cancelbuffer < 0 && button2_p())
    {
        con = 1;
        result = -2;
    }
}
if (con == 1)
{
    visible = false;
    con = 2;
    if (nokill == false)
        scr_doom(id, 1000);
}
