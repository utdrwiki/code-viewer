var floatamt = sin(siner / 30) * 4;
draw_sprite_ext(sprite_index, 0, scr_even(x), scr_even(y + floatamt), 2, 2, 0, c_white, 1);
if (nosedraw)
    draw_sprite_ext(spr_board_sphinx_nose, 0, scr_even(x + 56), scr_even(y + 36 + floatamt), 2, 2, 0, c_white, 1);
