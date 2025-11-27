dodraw = true;
image_speed = 0;
if (i_ex(obj_rotating_tower_controller_new))
{
    dodraw = false;
    x -= 40;
}
climbarea = instance_create(x, y, obj_climb_climbable);
climbarea.image_xscale = image_xscale;
climbarea.image_yscale = image_yscale;
siner = 0;
timer = 0;
con = 0;
depth = 999900;
image_alpha = 1;
sprite_index = sprite;
