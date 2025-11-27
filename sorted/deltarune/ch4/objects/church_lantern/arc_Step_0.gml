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
    if (lanterntype == 0)
    {
        timer++;
        if (timer == 30 || timer == 33 || timer == 36 || timer == 39)
        {
            bullet = instance_create(x, y + 12, obj_overworld_lanternflame_arc);
            bullet.depth = depth - 5;
            bullet.targetx = x - 80 - rand;
            bullet.targety = y + 12;
            bullet.bouncy = 1;
            if (timer == 39)
            {
                timer = 0;
                rand = irandom(100);
            }
        }
    }
    if (lanterntype == 1)
    {
        timer++;
        if (timer >= 50)
        {
            bulletcounter++;
            repeat (3)
            {
                bullet = instance_create(x, y + 12, obj_overworld_lanternflame_arc);
                bullet.depth = depth - 5;
                bullet.targetx = 570 + random(60);
                bullet.targety = 530 + random(250);
                bullet = instance_create(x, y + 12, obj_overworld_lanternflame_arc);
                bullet.depth = depth - 5;
                bullet.targetx = 730 + random(60);
                bullet.targety = 530 + random(250);
                bullet = instance_create(x, y + 12, obj_overworld_lanternflame_arc);
                bullet.depth = depth - 5;
                bullet.targetx = 890 + random(60);
                bullet.targety = 530 + random(250);
                bullet = instance_create(x, y + 12, obj_overworld_lanternflame_arc);
                bullet.depth = depth - 5;
                bullet.targetx = 1050 + random(60);
                bullet.targety = 530 + random(250);
                bullet = instance_create(x, y + 12, obj_overworld_lanternflame_arc);
                bullet.depth = depth - 5;
                bullet.targetx = 1210 + random(60);
                bullet.targety = 530 + random(250);
                bullet = instance_create(x, y + 12, obj_overworld_lanternflame_arc);
                bullet.depth = depth - 5;
                bullet.targetx = 560 + random(700);
                bullet.targety = 530 + random(20);
                bullet = instance_create(x, y + 12, obj_overworld_lanternflame_arc);
                bullet.depth = depth - 5;
                bullet.targetx = 560 + random(700);
                bullet.targety = 650 + random(20);
                bullet = instance_create(x, y + 12, obj_overworld_lanternflame_arc);
                bullet.depth = depth - 5;
                bullet.targetx = 560 + random(700);
                bullet.targety = 770 + random(20);
            }
            timer = 0;
        }
    }
    if (i_ex(mylight))
    {
        mylight.smallerLight = lerp(mylight.smallerLight, 1120, 0.25);
        mylight.biggerLight = (mylight.smallerLight * 1.1) + 20;
    }
}
