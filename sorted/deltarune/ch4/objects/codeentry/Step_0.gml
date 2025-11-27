if (con == 0)
{
    timer++;
    if (left_p())
    {
        snd_play_pitch(snd_menumove, 0.9);
        mpos--;
    }
    if (right_p())
    {
        snd_play_pitch(snd_menumove, 1);
        mpos++;
    }
    if (mpos == numcount)
        mpos = 0;
    if (mpos < 0)
        mpos = numcount - 1;
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
    buffmodrate = 5;
    if ((uholdbuff % buffmodrate) == 0)
    {
        snd_play_pitch(snd_menumove, 1);
        num[mpos]++;
    }
    else if ((dholdbuff % buffmodrate) == 0)
    {
        snd_play_pitch(snd_menumove, 0.9);
        num[mpos]--;
    }
    if (num[mpos] > maxnum)
        num[mpos] = 0;
    if (num[mpos] < 0)
        num[mpos] = maxnum;
    if (button1_p())
    {
        snd_play_pitch(snd_menumove, 1.2);
        con = 1;
        timer = 0;
    }
    if (button2_p() && !noquit)
    {
        snd_play_pitch(snd_menumove, 0.8);
        con = 1;
        result = -2;
        timer = 31;
    }
}
if (con == 1)
{
    timer++;
    if (timer == 30)
    {
        var wrong = false;
        for (var i = 0; i < numcount; i++)
        {
            if (correctcode[i] != num[i])
                wrong = true;
            entrystring += string(num[i]);
        }
        if (wrong == true)
        {
            snd_play(snd_error);
            txtcolor = 255;
        }
        else
        {
            snd_play(snd_bell);
            txtcolor = 65535;
        }
        result = 1 - wrong;
    }
}
