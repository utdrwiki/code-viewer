if (con == 0)
{
    if (!longtelegraph)
    {
        image_alpha += 0.2;
        if (image_alpha == 1)
            con = 1;
    }
    else
    {
        image_alpha += 0.08;
        if (image_alpha >= 1.1)
            con = 1;
    }
}
else
{
    if (image_alpha <= -1.3)
    {
        activetimer++;
        if (activetimer == 4)
            active = 1;
        else
            active = 0;
    }
    if (!longtelegraph)
    {
        image_alpha -= 0.4;
        if (image_alpha <= -3.4)
            instance_destroy();
    }
    if (longtelegraph)
    {
        image_alpha -= (1/3);
        if (image_alpha <= -2)
            instance_destroy();
    }
}
