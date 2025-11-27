updatetimer++;
if (updatetimer < 5)
    exit;
updatetimer = 0;
image_index += 1;
depth = 900000;
if (instance_exists(rotator_target))
{
    x = rotator_target.x + lengthdir_x(len, place);
    y = rotator_target.y + lengthdir_y(len, place);
    place += place_speed;
    len += len_speed;
}
else
{
    instance_destroy();
}
