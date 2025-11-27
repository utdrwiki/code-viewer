r = 64;
g = 64;
b = 64;
snd_play(snd_drake_dodge);
with (scr_fire_bullet(x, y, obj_knight_weird_circle_bullet, 90, 6, spr_knight_weird_shape))
{
    destroyonhit = false;
    damage = 206;
    element = 5;
    grazepoints = 12;
    scr_script_repeat(scr_afterimage_grow, 600, 4, 0.08, 0, -0.08);
    gravity_direction = direction;
    gravity = 0.2;
    image_speed *= 0.5;
    image_yscale = 3;
    image_xscale = 0;
    scr_lerpvar("image_yscale", 3, 2, 12);
    scr_lerpvar("image_xscale", 0, 2, 12);
    image_angle = direction;
}
for (a = 0; a < 5; a++)
{
    with (scr_fire_bullet(x, y, obj_regularbullet, 27.5 + (31.25 * a), 4, spr_diamondbullet_form))
    {
        grazepoints = 3;
        damage = 206;
        element = 5;
        image_angle = direction;
    }
}
for (a = 0; a < 4; a++)
{
    if (a == 1 || a == 2)
        continue;
    with (scr_fire_bullet(x, y, obj_regularbullet, 40 + (33.333333333333336 * a), 6, spr_diamondbullet_form))
    {
        grazepoints = 3;
        damage = 206;
        element = 5;
        image_angle = direction;
    }
}
