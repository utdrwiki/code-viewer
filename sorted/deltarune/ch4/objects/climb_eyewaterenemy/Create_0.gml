event_inherited();
image_blend = c_white;
makewater = 0;
dodraw = true;
if (i_ex(obj_rotating_tower_controller_new))
{
    dodraw = false;
    sprite_index = spr_climb_eyeenemy_40;
    image_xscale = 1;
    image_yscale = 1;
    x -= 40;
}
