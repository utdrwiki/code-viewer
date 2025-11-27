image_xscale = 2;
image_yscale = 2;
if (i_ex(obj_shadow_mantle_enemy))
{
    x -= 4;
    y -= 4;
}
visible = false;
if (place_meeting(x, y, obj___))
    instance_destroy();
