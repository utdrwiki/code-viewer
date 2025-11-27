image_angle += 2;
timer++;
if (timer > 12)
{
    if (flicker)
    {
        image_alpha = 1 - image_alpha;
        if (timer >= 18)
            instance_destroy();
    }
    else
    {
        image_alpha -= 0.1;
        if (image_alpha < 0)
            instance_destroy();
    }
}
