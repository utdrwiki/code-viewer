if (hp < 1)
{
    if (active == true)
        snd_play(snd_dtrans_flip)
    active = false
    image_alpha -= 0.05
    if (image_alpha < 0.01)
        instance_destroy()
    return;
}
if instance_exists(obj_heart)
{
    rotator_target = obj_heart
    depth = (obj_heart.depth - 1)
    var extra_speed = (obj_heart.z_hold / 2)
    if (extra_speed > 8)
        extra_speed = 8
    myspeed = (8 - extra_speed)
    x = (rotator_target.x + lengthdir_x(length, place))
    y = (rotator_target.y + lengthdir_y(length, place))
    place += myspeed
}
if (!instance_exists(obj_heart))
    visible = false
if instance_exists(obj_heart)
{
    if (alarm[0] == 9)
        visible = false
    else if (alarm[0] == 8)
        visible = false
    else if (alarm[0] == 5)
        visible = false
    else if (alarm[0] == 4)
        visible = false
    else if (alarm[0] == 1)
        visible = false
    else if (alarm[0] == 0)
        visible = false
    else
        visible = true
}
