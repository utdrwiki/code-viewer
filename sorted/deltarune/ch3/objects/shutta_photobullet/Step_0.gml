if (disappear)
{
    if (!init)
    {
        active = false;
        init = true;
        gravity = 0.5;
        rotation_spd = random_range(-5, 5);
        var _launch_angle = 90 + random_range(-45, 45);
        var _launch_power = random_range(2, 5);
        hspeed = lengthdir_x(_launch_power, _launch_angle);
        vspeed = lengthdir_y(_launch_power, _launch_angle);
    }
    if (vspeed >= 0)
        image_alpha -= 0.05;
    image_angle += rotation_spd;
    if (image_alpha <= 0)
        instance_destroy();
}
