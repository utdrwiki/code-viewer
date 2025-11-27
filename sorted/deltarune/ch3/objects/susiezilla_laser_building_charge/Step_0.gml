image_angle += 4;
timer++;
if (timer < 16)
{
    image_xscale = lerp(2.5, 0, timer / 15);
    image_yscale = lerp(2.5, 0, timer / 15);
}
else
{
    instance_destroy();
}
