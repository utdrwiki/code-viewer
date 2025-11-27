lifetimer++;
timer++;
if (con == 0)
{
    image_alpha = lerp(image_alpha, 1, 0.5);
    if (image_alpha == 1)
    {
        con = 1;
        timer = 0;
    }
}
if (con == 1)
{
    if (timer < 10 && i_ex(obj_heart))
        direction = point_direction(x, y, obj_heart.x, obj_heart.y);
    speed = lerp(speed, 6, 0.25);
}
spinspeed = lerp(spinspeed, 8, 0.125);
if (spinspeed > 0)
{
    if (side == 1)
        image_angle += spinspeed;
    else
        image_angle -= spinspeed;
}
if (active == 0)
{
    image_alpha = lerp(image_alpha, 0, 0.25);
    if (image_alpha == 0)
        instance_destroy();
}
