if (init == 0)
{
    with (obj_overworld_bulletarea)
        y = room_height * 2;
    init = 1;
}
siner++;
fakey = -18 - (sin(siner / 6) * 2);
if (con == 0)
    timer = 0;
if (con == 1)
{
    if (init == 1)
    {
        with (obj_overworld_bulletarea)
            y = ystart;
        init = 2;
    }
    timer++;
    if (timer >= 30)
    {
        bulletcounter++;
        bullet = instance_create(x, y + 12, obj_overworld_lanternflame);
        bullet.depth = depth - 5;
        bullet.direction = 180;
        bullet.savespeed = 8;
        bullet.friction = -0.02;
        burstcount++;
        if (burstcount < burstmax)
        {
            timer = 25;
        }
        else
        {
            timer = 0;
            burstcount = 0;
        }
    }
    if (i_ex(mylight))
    {
        mylight.smallerLight = lerp(mylight.smallerLight, (80 + ((40 * timer) / 15)) * 2, 0.25);
        mylight.biggerLight = (mylight.smallerLight * 1.1) + (timer / 2);
    }
}
