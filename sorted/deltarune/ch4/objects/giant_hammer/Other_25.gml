if (type == 0)
{
    if (con == 2)
    {
        fakex += fakehspeed;
        if (fakehspeed < 0)
            fakehspeed += 0.6;
        else
            fakehspeed = 0;
    }
    if (con == 0)
    {
        timer++;
        if (timer == 3)
            snd_play(motor_upper_quick);
        var a = lerp(600, 360, timer / 20);
        var b = lerp(120, 50, timer / 20);
        var c = lerp(240, 100, timer / 20);
        image_angle = lerp(200, a, timer / 20);
        if (timer < 21)
        {
            image_alpha += 0.04;
            x = lerp(xstart, (xstart - b) + fakex, timer / 20);
            y = lerp(ystart, ystart - c, timer / 20);
        }
        if (timer == 20)
        {
            timer = 0;
            con = 1;
        }
    }
    if (con == 1)
    {
        timer++;
        if (timer >= 6)
        {
            timer = 0;
            con = 2;
            snd_play(motor_upper_quick_high);
        }
    }
    if (con == 2)
    {
        timer++;
        x = lerp(xstart, (xstart - 50) + fakex, 1);
        if (timer == 20)
        {
            timer = 0;
            con = 3;
        }
    }
    if (con == 3)
    {
        gravity_direction = 0;
        gravity = 5;
        timer++;
        if (timer == 7)
        {
            snd_play(snd_punchheavythunder);
            snd_play(snd_break2);
            fadecon = 1;
            breakcon = 1;
        }
        if (timer == 90)
        {
            timer = 0;
            con = 4;
        }
    }
}
if (type == 1)
{
    if ((con == 0 && timer > 8) || con != 0)
    {
        fakex += fakehspeed;
        if (fakehspeed < 0)
            fakehspeed += 0.6;
        else
            fakehspeed = 0;
    }
    if (con == 0)
    {
        timer++;
        if (timer == 3)
            snd_play(motor_upper_quick);
        var a = lerp(600, 360, timer / 20);
        var b = lerp(120, 50, timer / 20);
        var c = lerp(240, 100, timer / 20);
        image_angle = lerp(200, a, timer / 20);
        if (timer < 21)
        {
            image_alpha += 0.04;
            x = lerp(xstart, (xstart - b) + fakex, timer / 20);
            y = lerp(ystart, ystart - c, timer / 20);
        }
        if (timer == 20)
        {
            timer = 0;
            con = 1;
        }
    }
    if (con == 1)
    {
        timer++;
        x = lerp(xstart, (xstart - 50) + fakex, 1);
        if (timer >= 6)
        {
            timer = 0;
            con = 2;
        }
    }
    if (con == 2)
    {
        timer++;
        x = lerp(xstart, (xstart - 50) + fakex, 1);
        if (timer == 7)
        {
            timer = 0;
            con = 3;
        }
    }
    if (con == 3)
    {
        gravity_direction = 0;
        gravity = 5;
        timer++;
        if (timer == 7)
        {
            snd_play(snd_punchheavythunder);
            snd_play(snd_break2);
            fadecon = 1;
            breakcon = 1;
        }
        if (timer == 50)
            instance_destroy();
    }
}
if (type == 2)
{
    if ((con == 0 && timer > 8) || con != 0)
    {
        fakex += fakehspeed;
        if (fakehspeed < 0)
            fakehspeed += 0.6;
        else
            fakehspeed = 0;
    }
    if (con == 0)
    {
        timer++;
        if (timer == 3)
            snd_play(motor_upper_quick);
        var a = lerp(900, 490, timer / 20);
        var b = lerp(120, 50, timer / 20);
        var c = lerp(240, 100, timer / 20);
        image_angle = lerp(200, a, timer / 20);
        if (timer < 21)
        {
            image_alpha += 0.04;
            x = lerp(xstart, xstart - b, timer / 20);
            y = lerp(ystart, ystart - c, timer / 20);
        }
        if (timer == 20)
        {
            timer = 0;
            con = 1;
            fadecon = 1;
            snd_play(snd_punchheavythunder);
            snd_play(snd_break2);
        }
    }
    if (con == 1)
    {
        timer++;
        if (timer == 3)
            breakcon = 1;
        var a = lerp(0, 260, timer / 9);
        image_angle = lerp(500, a, timer / 9);
        if (timer < 6)
        {
            x = lerp(xstart - 50, xstart, timer / 6);
            y = lerp(ystart - 100, ystart + 100, timer / 6);
        }
        if (timer >= 9)
        {
            timer = 0;
            con = 2;
        }
    }
    if (con == 2)
    {
        timer++;
        if (timer > 5)
            image_alpha -= 0.2;
        if (image_alpha < 0)
            instance_destroy();
    }
}
