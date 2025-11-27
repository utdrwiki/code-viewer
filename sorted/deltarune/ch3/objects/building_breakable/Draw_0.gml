if (con == 3)
{
    despawn_timer++;
    if (despawn_timer == 5)
    {
        var fx = instance_create(x - 19, y + 10, obj_susiezilla_multiexplosion);
        fx.depth = depth - 11;
    }
    if (despawn_timer >= 5)
    {
        image_alpha = 1 - image_alpha;
        if (despawn_timer >= 20)
        {
            image_index = 3;
            con = 4;
            collectible = instance_create(x + 40, y + 80, obj_susiezilla_collectible);
            collectible.depth = depth - 100;
            collectible.itemtype = 4;
            with (collectible)
                event_user(0);
        }
    }
}
if (con == 2)
{
    timer++;
    if (timer == 12)
    {
        con = 1;
        timer = 0;
    }
}
draw_self_offset(0, -height);
