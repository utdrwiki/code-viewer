if (con == 0)
{
    image_xscale = lerp(image_xscale, 1.5, 0.4);
    image_yscale = lerp(image_yscale, 1.5, 0.4);
    if (image_alpha < 1)
        image_alpha += 0.2;
    timer++;
    if (timer == 8)
        con = 1;
}
if (con == 1)
{
    image_alpha -= 0.4;
    if (image_alpha < 0)
        instance_destroy();
}
draw_self();
