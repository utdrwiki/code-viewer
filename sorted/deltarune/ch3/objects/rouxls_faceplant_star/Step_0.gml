timer++;
image_angle = lerp(0, 100, timer / 10);
speed = lerp(12, 0, timer / 10);
if (timer > 10)
{
    image_xscale = lerp(1, 0, (timer - 10) / 5);
    image_yscale = lerp(1, 0, (timer - 10) / 5);
}
if (timer == 15)
    instance_destroy();
