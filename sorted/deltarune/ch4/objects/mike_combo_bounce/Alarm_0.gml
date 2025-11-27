if (cooldown > 0)
{
    flash = -flash;
    alpha = 0.5;
    alarm[0] = clamp(point_distance(cooldown, 0, 0, 0) / 20, 2, 8);
}
else
{
    flash = true;
    alpha = 1;
    active = true;
}
