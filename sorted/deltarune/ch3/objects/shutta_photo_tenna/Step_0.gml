_timer++;
if (_timer < 30)
    y -= 8;
if (auto_walk == 1)
{
    if (walk == 1)
    {
        v_speed = 0;
        if (fake_speed != 0)
            v_speed = fake_speed;
        if (speed != 0)
            v_speed = speed;
    }
    if (auto_facing == 1)
    {
        v_vspeed = 0;
        v_hspeed = 0;
        if (fake_speed != 0)
        {
            v_vspeed = lengthdir_y(fake_speed, fake_direction);
            v_hspeed = lengthdir_x(fake_speed, fake_direction);
        }
        if (hspeed != 0)
            v_hspeed = hspeed;
        if (vspeed != 0)
            v_vspeed = vspeed;
    }
    if (spinspeed != 0)
    {
        spintimer += (1 / spinspeed);
        if (spintimer >= 1)
        {
            if (facing == "d")
                facing = "l";
            else if (facing == "l")
                facing = "u";
            else if (facing == "u")
                facing = "r";
            else if (facing == "r")
                facing = "d";
            spintimer = 0;
        }
        if (spintimer <= -1)
        {
            if (facing == "d")
                facing = "r";
            else if (facing == "l")
                facing = "d";
            else if (facing == "u")
                facing = "l";
            else if (facing == "r")
                facing = "u";
            spintimer = 0;
        }
    }
    else
    {
        spintimer = 0;
    }
    if (debug_killtimer > 0)
    {
        debug_killtimer--;
        if (debug_killtimer <= 0)
            instance_destroy();
    }
    if (auto_depth == 1)
    {
        scr_depth_alt();
        depth += depthbonus;
    }
    sinerx = 0;
    sinery = 0;
    if (siner_add0 != 0)
    {
        siner0 += siner_add0;
        if (siner_type0 == "sin")
            sinmove = sin(siner0) * siner_amplitude0;
        else
            sinmove = cos(siner0) * siner_amplitude0;
        if (siner_visual0 == 1)
        {
            sinerx += lengthdir_x(sinmove, siner_direction0);
            sinery += lengthdir_y(sinmove, siner_direction0);
        }
        else
        {
            x += lengthdir_x(sinmove, siner_direction0);
            y += lengthdir_y(sinmove, siner_direction0);
        }
    }
    if (siner_add1 != 0)
    {
        siner1 += siner_add1;
        if (siner_type1 == "sin")
            sinmove = sin(siner1) * siner_amplitude1;
        else
            sinmove = cos(siner1) * siner_amplitude1;
        if (siner_visual1 == 1)
        {
            sinerx += lengthdir_x(sinmove, siner_direction1);
            sinery += lengthdir_y(sinmove, siner_direction1);
        }
        else
        {
            x += lengthdir_x(sinmove, siner_direction1);
            y += lengthdir_y(sinmove, siner_direction1);
        }
    }
    if (shakeamt > 0)
    {
        shaketimer--;
        if (shaketimer <= 0)
        {
            shakex = random_range(-shakeamt, shakeamt);
            shakey = random_range(-shakeamt, shakeamt);
            shaketimer = shaketime;
        }
    }
    else
    {
        shakex = 0;
        shakey = 0;
    }
}
