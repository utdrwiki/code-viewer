var floory = 240
if (x < -20)
    instance_destroy()
if (state == 1)
{
    image_angle -= 4
    throw_yspeed += grav
    if (throw_yspeed > max_yspeed)
        throw_yspeed = max_syspeed
    prevx = x
    if (throw_xspeed < 0)
    {
        i = throw_xspeed
        while (i < 0)
        {
            x += i
            break
        }
    }
    if (throw_yspeed < 0)
    {
        i = throw_yspeed
        while (i < 0)
        {
            if ((y + i) < floory)
            {
                y += i
                break
            }
            else
            {
                i++
                continue
            }
        }
    }
    if (throw_yspeed > 0)
    {
        i = throw_yspeed
        while (i > 0)
        {
            if ((y + i) < floory)
            {
                y += i
                break
            }
            else
            {
                i--
                continue
            }
        }
    }
    if ((y + 1) > floory)
    {
        if (throw_yspeed > 0)
        {
            if (throw_yspeed > 0)
                throw_yspeed = ((-throw_yspeed) * 0.5)
            if (throw_xspeed > 0)
                throw_xspeed -= min(0.5, throw_xspeed)
            else if (throw_xspeed < 0)
                throw_xspeed += min(0.5, abs(throw_xspeed))
        }
    }
}
