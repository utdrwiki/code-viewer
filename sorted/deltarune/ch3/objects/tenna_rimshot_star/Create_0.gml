scr_bullet_init();
element = 5;
destroyonhit = false;
active = true;
timer = 0;
laugh_timer = 1;
state = 0;
mydir = 0;
size = 0;
grazepoints = 4;
mask_index = -1;
image_xscale = 1;
image_yscale = 1;
image_alpha = 0;
scr_lerpvar("image_alpha", 0, 1, 12, 2, "in");
sway = 0;
dosway = 1;
max_trail = 14;
bullet1 = instance_create_depth(x, y, depth + 1, obj_regularbullet);
with (bullet1)
{
    grazepoints = 2;
    damage = 80;
    sprite_index = spr_ball_small;
    image_alpha = 0;
    destroyonhit = false;
    scr_lerpvar("image_alpha", -2, 1, 12, 2, "in");
}
bullet2 = instance_create_depth(x, y, depth + 1, obj_regularbullet);
with (bullet2)
{
    grazepoints = 2;
    damage = 80;
    sprite_index = spr_ball_small;
    image_alpha = 0;
    destroyonhit = false;
    scr_lerpvar("image_alpha", -4, 1, 12, 2, "in");
}
for (var i = 0; i <= max_trail; i++)
{
    xx[i] = x;
    yy[i] = y;
}
rimshot_timer = -1;
