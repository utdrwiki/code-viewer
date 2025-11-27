if (destroytimer > 0)
{
    destroytimer--;
    if (destroytimer <= 0)
        instance_destroy();
}
if (destroyoffscreen == true)
{
    if (!scr_onscreen_tolerance(id, tolerance))
        instance_destroy();
    else if (friction > 0 && speed <= 0)
        despawning = true;
}
