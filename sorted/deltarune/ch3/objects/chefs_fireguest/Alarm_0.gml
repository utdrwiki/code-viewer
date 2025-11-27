image_xscale = choose(-2, 2);
if (obj_chefs_kris.x < x)
    image_xscale = 2;
else
    image_xscale = -2;
sprite_index = spr_shadowman_leave;
image_speed = 0;
alarm[1] = 7;
alarm[0] = 23 + irandom(3);
with (instance_create(x - (image_xscale * 20), y - (image_yscale * 12), obj_chefs_fire))
{
    falling = 0;
    speed = 0;
    gravity = 0.125;
    gravity_direction = 270;
    hspeed = 0;
    vspeed = -1;
}
