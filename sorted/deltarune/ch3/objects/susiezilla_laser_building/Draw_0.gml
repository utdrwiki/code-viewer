if (con == 3)
{
    despawn_timer++;
    if (despawn_timer == 5)
    {
        var fx;
        if (image_xscale > 0)
            fx = instance_create(x - 16, y - 32, obj_susiezilla_multiexplosion);
        else
            fx = instance_create(x - 96, y - 32, obj_susiezilla_multiexplosion);
        fx.depth = depth - 11;
    }
    if (despawn_timer >= 5)
    {
        image_alpha = 1 - image_alpha;
        if (despawn_timer >= 20)
        {
            image_alpha = 0;
            instance_destroy();
            if (image_xscale > 0)
                collectible = instance_create(x + 40, y + 40, obj_susiezilla_collectible);
            else
                collectible = instance_create(x - 40, y + 40, obj_susiezilla_collectible);
            collectible.depth = depth - 100;
            collectible.itemtype = 4;
            with (collectible)
                event_user(0);
        }
    }
}
draw_self_offset(0, -height);
if (con > 0)
{
    if (eyetimer < 10)
        eyetimer++;
    if (con == 1)
        draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, 0, c_white, (eyetimer / 10) * image_alpha);
    if (con >= 2)
        draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, 0, c_white, (eyetimer / 10) * image_alpha);
}
if (eyeflashtimer > 0 && con != 3)
{
    eyeflashtimer--;
    if (eyeflashtimer == 1 || eyeflashtimer == 2 || eyeflashtimer == 5 || eyeflashtimer == 6 || eyeflashtimer == 9 || eyeflashtimer == 10)
        draw_sprite_ext(sprite_index, 2, x, y, image_xscale, image_yscale, 0, c_white, 1);
}
