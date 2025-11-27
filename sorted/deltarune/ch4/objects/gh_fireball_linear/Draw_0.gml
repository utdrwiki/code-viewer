if (deform)
    scaler = (-cos(timer * 2) / 4) * (1 - (2 * type));
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale - scaler, image_yscale + scaler, image_angle, c_white, image_alpha);
if (draw_iris)
    draw_sprite_ext(spr_ghosthouse_iris, sprite_width > 12, x + round(2 * (x - xprevious)), y + round(2 * (y - yprevious)), 1, 1, 90 * type, c_white, 1);
