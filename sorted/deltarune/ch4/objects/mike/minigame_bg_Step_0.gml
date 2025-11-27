if (act == 0)
    alpha = scr_approach(alpha, 1, 0.1);
if (act == 1)
{
    alpha = scr_approach(alpha, 0, 0.1);
    if (alpha == 0)
        instance_destroy();
}
