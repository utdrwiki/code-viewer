siner++;
if (radius < targetradius)
{
    radius += 4;
    radius = min(radius, targetradius);
}
smallerLight = max(0, (sin(siner / 30) * 10) + radius);
biggerLight = max(0, (sin((siner - 10) / 30) * 10) + radius + 40);
scr_depth();
if (con == 0)
{
    with (collider)
    {
        if (place_meeting(x, y, obj_overworldheart))
            other.con = 1;
    }
}
else
{
    radius -= shrinkspeed;
    targetradius = radius;
    if (radius < -50)
        instance_destroy();
}
