if (action < 3)
{
    if (move)
    {
        y = scr_approach(y, ystart + 200, 12);
        if (y == (ystart + 200))
        {
            move = false;
            while (x == lastx)
                x = xstart + choose(-250, 0, 250);
            lastx = x;
        }
    }
    else
    {
        y = scr_approach(y, ystart, 12);
    }
}
else
{
    vspeed += 0.5;
}
xscale = 1 + (sin(current_time / 120) * 0.1);
yscale = 1 + (sin(32 + (current_time / 120)) * 0.1);
timer += 1;
if (action == 1)
{
    action = 2;
    timer = 0;
    image_xscale = scr_approach(image_xscale, 2, 0.01);
    image_yscale = scr_approach(image_yscale, 2, 0.01);
}
if (action == 2)
{
    image_xscale += ((xscale - image_xscale) * 0.9);
    image_yscale += ((yscale - image_yscale) * 0.9);
    if (timer > 30)
        action = 0;
}
if (instance_number(obj_mike_grabcat) == 0 && action < 3 && !keepalive)
{
    scr_doom(self, 60);
    action = 3;
}
