timer++;
if (timer > 5)
    image_blend = c_white;
if (timer > 15)
{
    gravity = 0.5;
    gravity_direction = 90;
    image_alpha -= 0.1;
    if (image_alpha < 0)
        instance_destroy();
    image_yscale += 0.05;
}
