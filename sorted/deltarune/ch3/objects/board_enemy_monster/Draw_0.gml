draw_self_board();
if (hurttimer > 0 && (hurttimer % 2) == 0 && image_blend != c_gray && hp != maxhp)
    draw_sprite_ext(hurt_sprite, image_index, round(x / 2) * 2, round(y / 2) * 2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
