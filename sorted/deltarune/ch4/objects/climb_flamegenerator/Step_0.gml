if (!init)
{
    rate = r_rate;
    timer = r_timer;
    dir = r_dir;
    movespeed = r_movespeed;
    lifetime = r_lifetime;
    init = 1;
}
if (active)
{
    if (global.interact == 0)
    {
        timer++;
        if ((timer % rate) == 0)
        {
            var bul = instance_create(x + 20, y + 20, obj_climb_flamefalling);
            bul.dir = dir;
            bul.movespeed = movespeed;
            bul.lifetime = lifetime;
        }
    }
}
