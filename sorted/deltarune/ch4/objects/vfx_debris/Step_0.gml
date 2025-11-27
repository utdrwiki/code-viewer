if (!init)
{
    init = true;
    base_hspeed = hspeed;
    base_vspeed = vspeed;
}
if (bouncer == 0 && (bounces > 0 || (image_angle % 90) != 0) && (timer % interval) == 0 && timer != 0)
    image_angle += rot;
timer += time_speed;
fader -= fade;
if (bouncer > 0)
{
    bouncer--;
    if (bouncer <= 0)
    {
        if (bounces > 0)
        {
            if (base_vspeed > 4)
                base_vspeed /= -2;
            else
                base_vspeed = -sqrt(base_vspeed);
            base_hspeed *= 0.5;
            time_speed = 0.5;
            vspeed = base_vspeed;
            hspeed = base_hspeed;
        }
        else
        {
            hspeed = base_hspeed;
            time_speed = 0.25;
        }
    }
}
else if (bounces > 0 && vspeed > 0 && (vspeed + y) > bottomy)
{
    if (fader > 1 && image_index > 9)
        fader = 1;
    else if (fader > 1.5 && image_index <= 9)
        fader = 1.5;
    if (split)
    {
        image_index = 4;
        split = false;
        var _shard = instance_copy(false);
        _shard.x -= 30;
        _shard.image_index += 1;
        _shard.interval--;
        _shard.vspeed += 2;
    }
    bounces--;
    y = bottomy;
    base_vspeed = vspeed;
    vspeed = 0;
    if (bounces > 0)
        hspeed = 0;
    bouncer = bounce_frames;
}
else if (bounces > 0)
{
    vspeed += 0.5;
}
else
{
    hspeed = scr_movetowards(hspeed, 0, 0.2);
}
if (fader <= -60)
    instance_destroy();
else
    image_blend = merge_color(c_black, c_white, clamp01(fader));
