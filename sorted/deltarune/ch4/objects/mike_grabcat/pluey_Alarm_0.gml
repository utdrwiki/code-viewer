if (point_distance(x, 0, camerax() + (camerawidth() / 2), 0) < 100)
{
    if (action == 0)
    {
        hspeed = 0;
        friction = 0.25;
        action = 2;
    }
}
else
{
    alarm[0] = 1;
}
