size = 96;
mylight = instance_create(x, y, obj_light_following);
with (mylight)
{
    size = 0;
    scr_lerpvar("size", 0, other.size, 15, -1, "out");
}
dir = 0;
movespeed = 1;
lifetime = 180;
active = true;
damage = 1;
image_speed = 0.5;
scr_size(0, 0);
image_alpha = 0;
scr_lerpvar("image_alpha", 0, 1, 10, 2, "out");
scr_lerpvar("image_xscale", 0, 2, 10, 2, "out");
scr_lerpvar("image_yscale", 0, 2, 10, 2, "out");
