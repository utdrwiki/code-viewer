con = 0;
savey = 0;
bouncecount = 0;
depth = -999999;
image_xscale = 0.5;
image_yscale = 0.5;
previousXPrevious = x;
previousYPrevious = y;
var impactfx = instance_create(x, y, obj_animation);
impactfx.sprite_index = spr_attack_slap2;
impactfx.image_xscale = 0.5;
impactfx.image_yscale = 0.5;
impactfx.image_blend = c_red;
if (i_ex(obj_lightemup_controller))
    move_towards_point(obj_lightemup_controller.cursor_x, obj_lightemup_controller.cursor_y, 50);
else
    move_towards_point(obj_shadowman_sharpshoot_cursor.x, obj_shadowman_sharpshoot_cursor.y, 50);
