if (init == 0)
{
    my_yscale = image_yscale;
    init = 1;
}
timer++;
image_alpha = (sin(timer / 60) * 0.25) + 0.75;
