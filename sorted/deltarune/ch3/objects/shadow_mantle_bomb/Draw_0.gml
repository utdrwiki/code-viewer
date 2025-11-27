if (fakey < -14)
    draw_sprite_ext(spr_board_bomb_shadow, 0, (round(x / 2) * 2) - 16, (round(y / 2) * 2) - 28, 2, 2, 0, c_white, flickershadow);
draw_sprite_ext(sprite_index, image_index, round(x / 2) * 2, round((y + fakey) / 2) * 2, image_xscale, image_yscale, 0, image_blend, image_alpha);
