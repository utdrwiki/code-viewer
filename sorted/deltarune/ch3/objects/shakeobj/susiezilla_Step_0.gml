if (active == 0)
    instance_destroy();
if (active == 1)
{
    timer++;
    if (timepershake == timer)
    {
        timer = 0;
        if (instance_exists(target))
        {
            shakeamt -= shakereduct;
            on *= -1;
            target.x = nowx + (shakespeed * on);
            if (shakeamt <= 0)
                instance_destroy();
        }
        else
        {
            instance_destroy();
        }
    }
}
