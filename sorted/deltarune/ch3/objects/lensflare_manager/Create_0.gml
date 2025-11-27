dir = point_direction(obj_growtangle.x, obj_growtangle.y, x, y);
dist = 0;
delay = 24;
flipside = power(-1, instance_number(object_index));
bullet1 = instance_create(x, y, obj_regularbullet);
bullet2 = instance_create(x, y, obj_regularbullet);
bullet3 = instance_create(x, y, obj_regularbullet);
dist_max = 150;
total_rot = 0;
image_blend = c_gray;
image_alpha = 0;
scr_lerpvar_instance(id, "image_alpha", 0, 1, 15);
scr_lerpvar_instance(id, "image_xscale", 0, 2, 15);
scr_lerpvar_instance(id, "image_yscale", 0, 2, 15);
with (bullet1)
{
    image_xscale = 2;
    image_yscale = 2;
    sprite_index = spr_lenslare1;
    destroyonhit = false;
    image_alpha = 0;
    active = false;
    scr_lerpvar_instance(id, "image_alpha", 0, 1, 15);
}
with (bullet2)
{
    image_xscale = 2;
    image_yscale = 2;
    sprite_index = spr_lenslare2;
    destroyonhit = false;
    image_alpha = 0;
    active = false;
    scr_lerpvar_instance(id, "image_alpha", 0, 1, 15);
}
with (bullet3)
{
    image_xscale = 2;
    image_yscale = 2;
    sprite_index = spr_lenslare3;
    destroyonhit = false;
    image_alpha = 0;
    active = false;
    scr_lerpvar_instance(id, "image_alpha", 0, 1, 15);
}
