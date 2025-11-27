timer++;
if (timer == 5)
    active_hitbox = false;
if (timer == 7)
    instance_destroy();
if (image_xscale < 2)
{
    image_xscale += 0.4;
    image_yscale += 0.4;
}
