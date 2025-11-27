event_inherited();
eyex = 0;
eyey = 0;
eyetimer = 0;
image_index = 1;
image_speed = 0;
image_blend = c_white;
dodraw = true;
if (i_ex(obj_rotating_tower_controller_new))
{
    dodraw = false;
    x -= 40;
    sprite_index = spr_climb_eyeenemy_noeye;
}
