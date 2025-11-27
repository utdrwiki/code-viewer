if (con == 0)
{
    snd_play(snd_locker);
    mylight = instance_create(x, y, obj_lightsource_static);
    con = 1;
}
