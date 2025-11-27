shineindex += 0.05;
if (con == 0)
    draw_sprite_ext(spr_shine, round(shineindex) / 2, x + 6, y - 4, 2, 2, 0, c_white, 0.25 + abs(sin(shineindex / 5)));
