siner++;
fakey = -18 - (sin(siner / 6) * 2);
if (i_ex(obj_mainchara))
{
    con = 1;
    if (obj_mainchara.battlemode == 1)
        con = 0;
}
if (con == 0)
{
    timer++;
    if (timer > 60)
        timer = 60;
    if (timer >= 60 && i_ex(obj_mainchara) && obj_mainchara.x > 400 && obj_mainchara.x < 1400 && obj_mainchara.y > 470)
    {
        var bullet = instance_create(x, y - 6, obj_overworld_lanternflame);
        if (i_ex(obj_mainchara))
            bullet.direction = dir;
        bullet.savespeed = 8;
        bullet.friction = -0.02;
        burstcount++;
        if (burstcount < burstmax)
        {
            timer = 55;
        }
        else
        {
            timer = 0;
            burstcount = 0;
        }
    }
}
if (con == 1)
{
    timer = 30;
    burstcount = 0;
}
mylight.smallerLight = lerp(mylight.smallerLight, (80 + ((40 * timer) / 15)) * 2, 0.25);
mylight.biggerLight = (mylight.smallerLight * 1.1) + (timer / 2);
