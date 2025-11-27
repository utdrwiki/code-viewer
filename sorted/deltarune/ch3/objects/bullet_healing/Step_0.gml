if (wall_destroy == 1)
{
    if (x < (camerax() - 80) || x > (camerax() + 640 + 80) || y < (cameray() - 80) || y > (cameray() + 480 + 80))
        instance_destroy();
}
if (updateimageangle == 1)
    image_angle = direction;
if (spin == 1)
    image_angle += spinspeed;
if (bottomfade != 0)
{
    if (y > (cameray() + bottomfade))
        image_alpha *= 0.8;
}
lifetime++;
if (lifetime >= maxlifetime || !i_ex(obj_heart))
    instance_destroy();
if (place_meeting(x, y, obj_heart))
{
    snd_play(snd_power);
    instance_destroy();
}
