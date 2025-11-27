if (hurtCon == 1)
{
    recoil += (recoilSpeed * recoilDir);
    recoilSpeed -= 1;
    if (sign(recoil) != recoilDir)
    {
        recoil = 0;
        hurtCon = 0;
        recoilSpeed = 0;
        image_index = 0;
    }
}
if (fall_speed != 0 || height > 0)
{
    height -= fall_speed;
    fall_speed += 1;
    if (height <= 0)
    {
        height = 0;
        if (bounce_count < 1)
            fall_speed *= -0.5;
        else
            fall_speed = 0;
        var _shake = instance_create(x, y, obj_shake);
        _shake.shakex = 0;
        if (bounce_count > 0)
            _shake.shakey = 2;
        bounce_count++;
        snd_play(snd_screenshake);
    }
}
if (hurtCon == 2)
{
    if (fall_speed > 0)
    {
        image_index = 5 + reverse_image;
        hurtCon = 3;
        shadow.image_xscale *= 2;
    }
}
if (hurtCon == 3 && height == 0 && fall_speed == 0)
{
    alarm[0] = 10;
    hurtCon = 4;
    hspeed = 0;
}
if (hurtCon == 5)
{
    fader++;
    if ((fader % 2) == 1)
        visible = false;
    else
        visible = true;
    if (fader >= 20)
        instance_destroy();
}
