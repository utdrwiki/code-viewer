if (i_ex(obj_tenna_enemy))
    exit;
var jump = abs(x - xprevious) * 0.125;
draw_sprite_ext(sprite_index, image_index, x, (y - abs(sin(timer * 0.5) * jump * 2)) + 4, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
