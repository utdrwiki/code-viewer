if (image_index > 1)
{
    if (image_index < 2)
        image_speed = 0.2;
    else
        image_speed = 0.5;
}
if (global.turntimer < 1)
    instance_destroy();
