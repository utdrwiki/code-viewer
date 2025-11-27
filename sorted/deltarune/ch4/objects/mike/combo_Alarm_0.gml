if (cooldown > 0)
{
    alpha = 0.75;
    alarm[0] = clamp(point_distance(cooldown, 0, 0, 0) / 20, 2, 8);
}
else
{
    flash = true;
    alpha = 1;
}
