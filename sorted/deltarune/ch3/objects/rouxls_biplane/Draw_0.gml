if (i_ex(obj_heart))
    depth = obj_heart.depth - 1;
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle - 29, image_blend, image_alpha);
image_xscale = lerp(image_xscale, 1, 0.2);
image_yscale = lerp(image_xscale, 1, 0.2);
speed = lerp(speed, 10, 0.1);
if (global.turntimer < 1)
    instance_destroy();
