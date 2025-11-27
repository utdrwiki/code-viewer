if (bounce == 1)
{
    image_yscale = 2.5;
    image_xscale = 1.5;
    bounce = 2;
}
if (bounce == 2)
{
    scr_lerpvar("image_xscale", image_xscale, 2, 16, -2, "out");
    scr_lerpvar("image_yscale", image_yscale, 2, 16, -2, "out");
    bounce = 3;
}
if (bounce == 3)
{
    if (image_yscale <= 2.01)
    {
        image_yscale = 2;
        bounce = 0;
    }
}
