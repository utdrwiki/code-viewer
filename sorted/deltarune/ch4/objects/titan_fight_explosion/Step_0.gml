if (con == 0)
{
    timer += 1;
    if (timer == 8)
    {
        for (i = 1; i < 15; i++)
        {
            var ball = instance_create(x, y, obj_titan_fight_explosion_ball);
            ball.vspeed = random_range(-15, -2);
            ball.hspeed = random_range(minh, maxh);
            ball.depth = depth;
        }
    }
    if (!endless && timer > 30)
        con = 1;
    if (timer > 15 && (timer % 2) == 0)
    {
        var ball = instance_create(x, y, obj_titan_fight_explosion_ball);
        ball.vspeed = random_range(-20, -2);
        ball.hspeed = random_range(minh, maxh);
        ball.depth = depth;
    }
}
if (con == 1)
    instance_destroy();
