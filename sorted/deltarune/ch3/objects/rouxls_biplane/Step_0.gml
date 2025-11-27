image_angle = direction + 180;
if (x < (obj_growtangle.x - 220))
    fade = 1;
if (fade == 1)
{
    image_alpha -= 0.1;
    flag.image_alpha -= 0.1;
    if (image_alpha < 0)
        instance_destroy();
}
