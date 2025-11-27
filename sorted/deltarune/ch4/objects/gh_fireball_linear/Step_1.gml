var prev_x = x;
var prev_y = y;
timer += ((pi / cycle_length) * rate);
if (type == 0)
    x = basex + (sin(timer) * width);
else
    y = basey + (sin(timer) * width);
if (sprite_index == spr_ghost_house_pumpkin_horizontal)
    image_index = scr_approach(image_index, 2.01 + (2 * sign(x - prev_x)), 2 / log2(abs(width)));
else if (sprite_index == spr_ghost_house_pumpkin_vertical)
    image_index = scr_approach(image_index, 2.01 + (2 * sign(y - prev_y)), 2 / log2(abs(width)));
