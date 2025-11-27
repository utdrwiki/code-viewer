lifetimer++;
if (fadetime != -1)
{
    if (lifetimer >= fadetime)
        active = 0;
}
if (active == 0)
{
    image_alpha = lerp(image_alpha, 0, 0.25);
    if (image_alpha == 0)
        instance_destroy();
}
if (updateangle == 1)
    image_angle = direction;
