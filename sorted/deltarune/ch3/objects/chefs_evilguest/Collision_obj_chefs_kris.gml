if (hit || stomped)
    exit;
var _stomp = false;
with (other)
{
    if (jumping == 2)
    {
        if (vspeed > 0)
            _stomp = true;
        else
            exit;
    }
}
if (_stomp)
{
    var _y = bbox_bottom;
    other.vspeed = -abs(other.vspeed);
    other.jumping = 2;
    image_yscale = 0.3;
    y = _y - abs(bbox_top - bbox_bottom);
    snd_play(snd_splat);
    stomped = true;
    alarm[1] = 10;
    alarm[0] = -1;
    speed = 0;
    image_speed = 0;
}
else
{
    with (other)
    {
        if (invincible <= 0 && stun <= 0)
            burn_stack();
    }
}
