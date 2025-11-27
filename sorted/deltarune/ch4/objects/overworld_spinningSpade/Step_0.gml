image_angle += 4;
if (active == 2)
{
    fade = scr_afterimage_grow();
    fade.xrate = 0.4;
    fade.yrate = 0.4;
    inactivetimer = 30;
    active = 3;
}
if (active == 3)
{
    image_alpha = lerp(image_alpha, 0, 0.35);
    inactivetimer--;
    if (inactivetimer <= 0)
    {
        inactivetimer = 0;
        active = 4;
    }
}
if (active == 4)
{
    image_alpha = lerp(image_alpha, 1, 0.35);
    if (image_alpha == 1)
        active = 1;
}
