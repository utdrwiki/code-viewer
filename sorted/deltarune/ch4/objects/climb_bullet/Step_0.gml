if (!permanent)
{
    if (x <= (room_width - 100))
        instance_destroy();
    if (x >= (room_width + 100))
        instance_destroy();
    if (y >= (cameray() + 200))
        instance_destroy();
    if (y <= (cameray() - 400))
        instance_destroy();
}
if (permanent && falseloop)
{
    if (i_ex(obj_climb_kris))
    {
        if (x < obj_climb_kris.falseloopx[0])
            x += (obj_climb_kris.falseloopx[1] - obj_climb_kris.falseloopx[0]);
        if (x > obj_climb_kris.falseloopx[1])
            x -= (obj_climb_kris.falseloopx[1] - obj_climb_kris.falseloopx[0]);
    }
}
