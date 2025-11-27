if (hp <= 0)
{
    despawn_timer++;
    if (despawn_timer == 5)
    {
        var fx = instance_create(x - 59, y - 84, obj_susiezilla_multiexplosion);
        fx.depth = depth - 11;
    }
    if (despawn_timer >= 5)
    {
        if (despawn_timer >= 20)
        {
            instance_destroy();
            con = 4;
            collectible = instance_create(x, y - 20, obj_susiezilla_collectible);
            collectible.depth = depth - 100;
            collectible.itemtype = 8;
            with (collectible)
                event_user(0);
        }
    }
}
depth = 100000 - ((y - 120) * 10);
draw_self_offset(recoil, -height);
if (flashtimer > 0)
{
    flashtimer--;
    gpu_set_fog(1, c_white, 0, 0);
    draw_self_offset(recoil, -height);
    gpu_set_fog(0, c_white, 0, 0);
}
