if (active == true)
    floatsiner++;
var yy = abs(sin(floatsiner / 15) * 2);
draw_sprite_ext(sprite_index, image_index, round(x / 2) * 2, round((y + yy) / 2) * 2, 2, 2, image_angle, image_blend, image_alpha);
