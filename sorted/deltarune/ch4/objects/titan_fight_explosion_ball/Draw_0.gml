if (init == -1)
{
    init = 0;
    friction = remap(-2, -20, 0.05, 0.6, vspeed);
}
if (back)
{
    if (init == 0)
    {
        init = 1;
        image_alpha = 0;
    }
    else if (init == 1)
    {
        image_alpha = 1;
        init = 2;
    }
    else
    {
        image_blend = merge_color(c_dkgray, c_white, image_alpha);
        if (image_alpha <= 0)
            instance_destroy();
    }
    if (image_yscale > 1.5)
        image_alpha -= 0.015;
}
else
{
    if (image_yscale > 2)
        image_alpha -= 0.02;
    if (image_alpha <= 0)
        instance_destroy();
}
event_inherited();
