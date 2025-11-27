timer += 0.025;
if (fadetype == 0)
    intensity = scr_approach(intensity, 1, abs(1 - intensity) * 0.5);
if (fadetype == 1)
{
    intensity = scr_approach(intensity, 0, 0.1);
    if (intensity == 0)
        instance_destroy();
}
