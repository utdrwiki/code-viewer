event_inherited();
if (drop_ornament)
{
    drop_timer++;
    if (drop_timer == 1)
    {
        gravity = 0.5;
        friction = 0.1;
    }
    if (drop_timer == 13)
    {
        with (obj_homealone_dess_closet_controller)
            hit_tree = true;
        vspeed = -vspeed / 2;
        hspeed = -0.5;
    }
    if (drop_timer == 18)
        vspeed = -vspeed / 2;
    if (y >= 110)
    {
        hspeed = scr_movetowards(hspeed, 0, 1);
        vspeed = 0;
        gravity = 0;
    }
}
