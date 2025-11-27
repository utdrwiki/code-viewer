if (sprite_index != spr_board_quizchaser_legless)
    draw_self_board();
else
    draw_sprite_ext(spr_board_quizchaser_legless, 0, scr_even(x), scr_even(y + fakey), 2, 2, 0, c_white, 1);
