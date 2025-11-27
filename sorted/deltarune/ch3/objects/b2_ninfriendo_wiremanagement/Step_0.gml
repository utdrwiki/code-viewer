if (drop0 == 1)
{
    drop0 = 2;
    if (ver == 0)
    {
        dcont0 = cont[1];
        stick[1] = false;
    }
    else
    {
        dcont0 = cont[0];
        stick[0] = false;
    }
    dcont0.depth = 96220;
    dcont0.gravity = 1;
}
if (drop0 == 2)
{
    dcont0.depth = 0;
    if (dcont0.y >= 358)
    {
        dcont0.gravity = 0;
        dcont0.vspeed = 0;
        dcont0.y = 358;
        with (dcont0)
            scr_depth();
        snd_play_x(snd_noise, 0.25, 0.8);
        drop0 = 3;
    }
}
if (i_ex(dcont0))
    yoff[0] = dcont0.y;
if (drop1 == 1)
{
    drop1 = 2;
    if (ver == 0)
    {
        dcont1 = cont[0];
        stick[0] = false;
    }
    else
    {
        dcont1 = cont[1];
        stick[1] = false;
    }
    dcont1.depth = 96220;
    dcont1.gravity = 1;
}
if (drop1 == 2)
{
    dcont1.depth = 0;
    if (dcont1.y >= 358)
    {
        dcont1.gravity = 0;
        dcont1.vspeed = 0;
        dcont1.y = 358;
        with (dcont1)
            scr_depth();
        snd_play_x(snd_noise, 0.25, 0.8);
        drop1 = 3;
    }
}
if (i_ex(dcont1))
    yoff[1] = dcont1.y;
