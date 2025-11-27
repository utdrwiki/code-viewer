scr_tensionheal(12.5);
instance_destroy();
sound_play(snd_coin);
for (var _flip = 1; _flip >= -1; _flip -= 2)
{
    for (var dir = 0; dir < 360; dir += 36)
    {
        with (instance_create(x, y, obj_bulletparent))
        {
            scr_doom(id, 25);
            direction = dir;
            scr_lerpvar("direction", direction, direction + (120 * _flip), 18, 4, "out");
            speed = 5 + (_flip * 1.5);
            sprite_index = spr_incense_sparkle;
            scr_lerpvar("image_alpha", 2, 0, 20 + ceil(speed / 3));
            friction = speed / (24 + speed);
            image_xscale = 0.5;
            image_yscale = 0.5;
            image_speed = 0.1;
        }
    }
}
with (obj_ghosthouse_lock)
{
    mask_index = spr_nothing;
    scr_lerpvar("image_angle", image_angle, image_angle + (135 * sign(image_xscale)), 72, -2, "inout");
}
with (obj_ghosthouse_exit)
    alarm[0] = 60;
with (light)
{
    scr_lerpvar("x", x, obj_ghosthouse_lock.x - (6 * obj_ghosthouse_lock.image_xscale), 24, -1, "out");
    scr_lerpvar("y", y, obj_ghosthouse_lock.y + (obj_ghosthouse_lock.sprite_height / 2), 24, -1, "out");
    scr_lerpvar("radius", radius, radius + 16, 24, 3, "out");
    scr_lerpvar("radius_2", radius_2, radius_2 + 8, 24, 3, "out");
}
if (tutu)
    instance_create(obj_heart.x, obj_heart.y, obj_your_tutu);
if (long)
{
    with (obj_heart)
    {
        obj_heart.sprite_index = spr_dodgeheart_long;
        obj_heart.mask_index = spr_dodgeheart_long_mask;
        obj_grazebox.sprite_index = spr_grazeappear_long;
        obj_grazebox.mask_index = spr_grazemask_long;
        obj_heart.x -= 10;
        with (obj_ghosthouse_trigger)
            alarm[0] = 45;
    }
}
else
{
    with (obj_ghosthouse_trigger)
        active = true;
}
with (obj_gh_exitsign)
{
    visible = true;
    image_alpha = 0;
    scr_lerpvar("image_alpha", 0, 1, 33, 3, "out");
}
