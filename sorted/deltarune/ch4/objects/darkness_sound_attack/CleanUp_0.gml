instance_destroy(heartlight);
if (i_ex(lightsource))
    instance_destroy(lightsource);
if (room == room_bullettest)
{
    obj_growtangle.depth = 5;
    instance_destroy(darkness);
}
