timer++;
if (timer > 0)
{
    scr_depth_pivot();
    image_xscale = lerp(image_xscale, 4, timer / 14);
}
if (timer > 30)
    instance_destroy();
