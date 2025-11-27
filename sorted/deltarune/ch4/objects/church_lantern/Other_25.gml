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
    if (timer >= 40)
    {
        bulletcounter++;
        bullet = instance_create(x, y + 12, obj_overworld_lanternflame_arc);
        bullet.depth = depth - 5;
        bullet.targetx = 1900 + random(360);
        bullet.targety = 380;
        bullet = instance_create(x, y + 12, obj_overworld_lanternflame_arc);
        bullet.depth = depth - 5;
        bullet.targetx = 1900 + random(360);
        bullet.targety = 380;
        bullet = instance_create(x, y + 12, obj_overworld_lanternflame_arc);
        bullet.depth = depth - 5;
        bullet.targetx = 1900 + random(360);
        bullet.targety = 380;
        timer = 0;
    }
    if (i_ex(mylight))
    {
        mylight.smallerLight = lerp(mylight.smallerLight, 600, 0.25);
        mylight.biggerLight = (mylight.smallerLight * 1.1) + 7.5;
    }
}
