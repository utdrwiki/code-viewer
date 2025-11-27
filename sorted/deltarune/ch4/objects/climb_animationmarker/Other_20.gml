if (con == 1)
    exit;
if (index < 0)
{
    with (obj_climb_destructableclimbarea)
    {
        if (animation_idx == -other.index)
        {
            con = 2;
            safe_delete(climbarea);
            if (animation_idx > 0)
            {
                with (obj_rotating_tower_animation)
                {
                    if (index == other.animation_idx)
                    {
                        targetx = other.x + 20;
                        targety = other.y - 20;
                        con = 2;
                        break;
                    }
                }
                instance_destroy();
            }
        }
    }
    con = 1;
    exit;
}
with (obj_rotating_tower_animation)
{
    if (index == other.index)
    {
        targetx = other.x;
        targety = other.y;
        con = 2;
        break;
    }
}
con = 1;
