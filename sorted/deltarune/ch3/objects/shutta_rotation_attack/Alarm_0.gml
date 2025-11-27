if (con == 0 && motion_blur && afterimage_index < afterimage_count)
{
    with (obj_collidebullet)
    {
        var _afim = instance_create(x, y, obj_bulletparent);
        scr_image_copy(_afim, self);
        _afim.image_alpha = 0;
        _afim.saved_alpha = ((other.afterimage_index + 1) / other.afterimage_count) * 0.4;
        afterimage[other.afterimage_index] = _afim;
        afterimage[other.afterimage_index].image_speed = 0;
    }
    afterimage_index++;
    alarm[0] = afterimage_interval;
}
else
{
    con++;
}
if (con == 1)
{
    take_photo = true;
    if (multiple)
        alarm[0] = 10;
    else
        alarm[0] = 15;
}
if (con == 2 && difficulty >= 1)
{
    if (difficulty >= 4)
        lerp_time = edit_time;
    if (difficulty >= 3)
        alarm[0] = edit_time;
    else
        alarm[0] = random_range(20, 50);
}
if (con == 3)
    alarm[0] = wait_time;
if (con == 4)
    event_user(1);
