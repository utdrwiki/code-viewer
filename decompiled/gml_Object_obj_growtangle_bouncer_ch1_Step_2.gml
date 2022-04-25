if (type == 0)
{
    if (con == 0)
    {
        ux += 30
        dx -= 30
        lx += 30
        rx -= 30
        con = 0.4
    }
    if (con == 0.4)
    {
        minitimer += 1
        if (minitimer >= 14)
            con = 0.5
    }
    if (con == 0.5 && speed < 4.6)
        speed += 0.2
    if (con == 0.5 && speed >= 4.6)
    {
        timer += 1
        if (timer >= 170)
            con = 1
    }
    if (con == 1)
    {
        speed -= 0.2
        if (speed <= 0.1)
            event_user(2)
    }
}
if (type == 1)
{
    if (con == 0)
    {
        direction += (random(20) - random(20))
        con = 0.5
    }
    if (con == 0.5 && speed < 5.2)
        speed += 0.2
    if (hspeed >= 4.2)
    {
        if (vspeed > 0)
        {
            vspeed += 0.1
            hspeed -= 0.1
        }
        else
        {
            vspeed -= 0.1
            hspeed -= 0.1
        }
    }
    if (hspeed <= -4.2)
    {
        if (vspeed > 0)
        {
            vspeed += 0.1
            hspeed += 0.1
        }
        else
        {
            vspeed -= 0.1
            hspeed += 0.1
        }
    }
    if (vspeed >= 4.2)
    {
        if (hspeed > 0)
        {
            hspeed += 0.1
            vspeed -= 0.1
        }
        else
        {
            hspeed -= 0.1
            vspeed -= 0.1
        }
    }
    if (vspeed <= -4.2)
    {
        if (hspeed > 0)
        {
            hspeed += 0.1
            vspeed += 0.1
        }
        else
        {
            hspeed -= 0.1
            vspeed += 0.1
        }
    }
    if (con == 0.5 && speed >= 5.2)
    {
        timer += 1
        if (timer >= 90)
            con = 1
    }
    if (con == 1)
    {
        speed -= 0.4
        if (speed <= 0.1)
            event_user(2)
    }
}
if (type == 2)
{
    if (con == 0)
    {
        direction += (random(20) - random(20))
        con = 0.5
        ux += 50
        dx -= 50
        lx += 50
        rx -= 50
    }
    if (con == 0.5 && speed < 5.2)
        speed += 0.2
    if (con == 0.5 && speed >= 5.2)
    {
        timer += 1
        if (timer >= 70)
            con = 1
    }
    if (con == 1)
    {
        speed -= 0.5
        if (speed <= 0.1)
            event_user(2)
    }
}
if (type == 3)
{
    if (con == 0)
    {
        direction += (random(20) - random(20))
        con = 0.4
        ux += 50
        dx -= 50
        lx += 50
        rx -= 50
    }
    if (con == 0.4)
    {
        minitimer += 1
        if (minitimer >= 14)
            con = 0.5
    }
    if (con == 0.5 && speed < 4.4)
        speed += 0.2
    if (con == 0.5 && speed >= 4.4)
    {
        timer += 1
        if (timer >= 170)
            con = 1
    }
    if (con == 1)
    {
        speed -= 0.5
        if (speed <= 0.1)
            event_user(2)
    }
}
if (type == 4)
{
    if (con == 0)
    {
        direction += (random(10) - random(10))
        con = 0.5
        ux += 50
        dx -= 50
        lx += 50
        rx -= 50
    }
    if (con == 0.5 && speed < 7)
        speed += 0.2
    if (con == 0.5 && speed >= 7)
    {
        timer += 1
        if (timer >= 90)
            con = 1
    }
    if (con == 1)
    {
        speed -= 0.5
        if (speed <= 0.1)
        {
            active = false
            event_user(2)
        }
    }
}
if (type == 5)
{
    if (con == 0)
    {
        ux += 30
        dx -= 30
        lx += 30
        rx -= 30
        con = 0.4
    }
    if (con == 0.4)
    {
        minitimer += 1
        if (minitimer >= 14)
            con = 0.5
    }
    if (con == 0.5 && speed < 4)
        speed += 0.2
    if (con == 0.5 && speed >= 4)
    {
        timer += 1
        if (timer >= 170)
            con = 1
    }
    if (con == 1)
    {
        speed -= 0.2
        if (speed <= 0.1)
            event_user(2)
    }
}
if instance_exists(obj_growtangle_ch1)
{
    obj_growtangle_ch1.x = x
    obj_growtangle_ch1.y = y
    lborder = (x - (sprite_width / 2))
    rborder = (x + (sprite_width / 2))
    uborder = (y - (sprite_height / 2))
    dborder = (y + (sprite_height / 2))
    if (lborder < lx && hspeed < 0)
    {
        hspeed = (-hspeed)
        bumpnoise = true
    }
    if (rborder > rx && hspeed > 0)
    {
        hspeed = (-hspeed)
        bumpnoise = true
    }
    if (uborder < ux && vspeed < 0)
    {
        vspeed = (-vspeed)
        bumpnoise = true
    }
    if (dborder > dx && vspeed > 0)
    {
        vspeed = (-vspeed)
        bumpnoise = true
    }
    if (bumpnoise == true)
    {
        snd_play_ch1(snd_bump_ch1)
        snd_play_ch1(snd_screenshake_ch1)
        bumpnoise = false
        if (!instance_exists(obj_shake_ch1))
            instance_create_ch1(0, 0, obj_shake_ch1)
    }
}
if (grazed == true)
{
    if (timerbonus == 0)
    {
        timer += 2
        timerbonus = 1
    }
    grazetimer += 1
    if (grazetimer >= 15)
    {
        timerbonus = 0
        grazetimer = 0
        grazed = false
    }
}
