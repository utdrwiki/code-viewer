if (active == true)
{
    if (con == 0)
    {
        if (value != "none")
        {
            if (value == "right")
            {
                con++;
                value = "none";
                snd_play_pitch(snd_coin, 1 + (con / 24));
            }
            else
            {
                con = 0;
                value = "none";
                snd_play_pitch(snd_error, 0.8);
            }
        }
    }
    if (con == 1)
    {
        if (value != "none")
        {
            if (value == "up")
            {
                con++;
                value = "none";
                snd_play_pitch(snd_coin, 1 + (con / 24));
            }
            else
            {
                con = 0;
                value = "none";
                snd_play_pitch(snd_error, 0.8);
            }
        }
    }
    if (con == 2)
    {
        if (value != "none")
        {
            if (value == "left")
            {
                con++;
                value = "none";
                snd_play_pitch(snd_coin, 1 + (con / 24));
            }
            else
            {
                con = 0;
                value = "none";
                snd_play_pitch(snd_error, 0.8);
            }
        }
    }
    if (con == 3)
    {
        if (value != "none")
        {
            if (value == "up")
            {
                con++;
                value = "none";
                snd_play_pitch(snd_coin, 1 + (con / 24));
            }
            else
            {
                con = 0;
                value = "none";
                snd_play_pitch(snd_error, 0.8);
            }
        }
    }
    if (con == 4)
    {
        if (value != "none")
        {
            if (value == "right")
            {
                con++;
                value = "none";
                snd_play_pitch(snd_coin, 1 + (con / 24));
            }
            else
            {
                con = 0;
                value = "none";
                snd_play_pitch(snd_error, 0.8);
            }
        }
    }
    if (con == 5)
    {
        if (value != "none")
        {
            if (value == "down")
            {
                con++;
                value = "none";
                snd_play_pitch(snd_coin, 1 + (con / 24));
            }
            else
            {
                con = 0;
                value = "none";
                snd_play_pitch(snd_error, 0.8);
            }
        }
    }
    if (con == 6)
    {
        with (obj_board_specialwarp)
        {
            if (extflag == "loop" || extflag == "loop_exit")
                instance_destroy();
        }
        con = 8;
    }
}
