if (global.interact == 0)
{
    if (dir == 0)
        y += movespeed;
    if (dir == 1)
        x += movespeed;
    if (dir == 2)
        y -= movespeed;
    if (dir == 3)
        x -= movespeed;
    if (active)
    {
        var climbkris = collision_rectangle(x - 10, y - 20, x + 10, y + 10, obj_climb_kris, 0, 0);
        if (instance_exists(climbkris))
        {
            if (climbkris.fallingcon == 0 && (climbkris.neutralcon == 1 || climbkris.jumpchargecon >= 1))
            {
                if (climbkris.damagecon == 0)
                {
                    climbkris.damagecon = 1;
                    lifetime = 1;
                    active = 0;
                }
            }
        }
    }
    lifetime--;
    if (lifetime == 0)
    {
        scr_lerpvar("image_alpha", image_alpha, 0, 15);
        with (mylight)
            scr_lerpvar("size", size, 0, 15);
        scr_doom(id, 15);
        active = false;
    }
}
