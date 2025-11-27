var prev_y = y;
timer += ((pi / cycle_length) * rate);
y = basey - (max(0, abs(sin(timer))) * width);
if (sprite_index == spr_ghost_house_pumpkin_vertical)
    image_index = scr_approach(image_index, 2.01 + (2 * sign(y - prev_y)), 1);
