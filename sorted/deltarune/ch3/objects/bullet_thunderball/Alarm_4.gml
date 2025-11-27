if (freeze)
    exit;
with (scr_fire_bullet(x, y, obj_regularbullet, 0, 2, spr_shutta_lightning))
{
    image_speed = 0.25;
    gravity_direction = 0;
    friction = -0.05;
    if (i_ex(obj_volumeup))
    {
        image_xscale = 2;
        image_yscale = 2;
        grazepoints += 1;
    }
}
with (scr_fire_bullet(x + 8, y, obj_regularbullet, 0, 3, spr_shutta_lightning))
{
    image_speed = 0.25;
    gravity_direction = 0;
    friction = -0.05;
    if (i_ex(obj_volumeup))
    {
        image_xscale = 2;
        image_yscale = 2;
        grazepoints += 1;
    }
}
with (scr_fire_bullet(x, y, obj_regularbullet, 180, 2, spr_shutta_lightning))
{
    image_speed = 0.25;
    gravity_direction = 180;
    friction = -0.05;
    if (i_ex(obj_volumeup))
    {
        image_xscale = 2;
        image_yscale = 2;
        grazepoints += 1;
    }
}
with (scr_fire_bullet(x - 8, y, obj_regularbullet, 180, 3, spr_shutta_lightning))
{
    image_speed = 0.25;
    gravity_direction = 180;
    friction = -0.05;
    if (i_ex(obj_volumeup))
    {
        image_xscale = 2;
        image_yscale = 2;
        grazepoints += 1;
    }
}
active = false;
alarm[3] = 8;
