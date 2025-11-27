if (_symbol_sprite == -4)
    exit;
draw_self();
_symbol_anim += _symbol_anim_speed;
draw_sprite_ext(_symbol_sprite, _symbol_anim, x + _symbol_x_offset, y + _symbol_y_offset, _symbol_x_scale, _symbol_y_scale, _symbol_angle, c_white, 1);
draw_set_font(fnt_main);
draw_set_color(c_black);
draw_text_ext_transformed((x - 32) + 2, (y - 6) + 2, _highscore_rank, 999, 999, 3, 3, 0);
draw_set_color(c_yellow);
draw_text_ext_transformed(x - 32, y - 6, _highscore_rank, 999, 999, 3, 3, 0);
draw_set_color(c_black);
draw_text_ext_transformed(x + 62 + 2, (y - 6) + 2, _highscore_rank_hard, 999, 999, 3, 3, 0);
draw_set_color(c_orange);
draw_text_ext_transformed(x + 62, y - 6, _highscore_rank_hard, 999, 999, 3, 3, 0);
