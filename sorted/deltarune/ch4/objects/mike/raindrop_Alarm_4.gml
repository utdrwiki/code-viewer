var target = -4;
if (i_ex(obj_mike_minigame_controller))
{
    target = 719;
}
else
{
    with (obj_mike_grabcat_pluey)
    {
        target = id;
        break;
    }
}
if (i_ex(target))
{
    var targetdir = point_direction(x, y, target.x, target.y);
    speed = scr_approach(speed, 5, 0.2);
    direction = targetdir;
    image_angle = direction + 90;
    if (speed < 5)
        alarm[4] = 1;
}
else
{
    speed = scr_approach(speed, 5, 0.2);
    if (speed < 5)
        alarm[4] = 1;
}
