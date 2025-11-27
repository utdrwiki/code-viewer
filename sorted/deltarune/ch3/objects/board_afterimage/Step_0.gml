if (init == 0)
{
    remalpha = image_alpha;
    init = 1;
}
timer++;
if (timer >= length)
    instance_destroy();
if (type == 0)
{
    if ((timer % flickerrate) == 0)
        image_alpha = remalpha;
    else
        image_alpha = 0;
}
