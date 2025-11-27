draw_sprite_ext(spr_gameshow_ui_window_50w_top, 0, x, y, 2, 2, 0, image_blend, 1);
draw_sprite_ext(spr_gameshow_ui_window_50w_mid, 0, x, y + 8, 2, 20, 0, image_blend, 1);
draw_sprite_ext(spr_gameshow_ui_window_50w_bottom, 0, x, y + 28, 2, 2, 0, image_blend, 1);
draw_set_color(c_white);
draw_set_halign(fa_right);
draw_set_font(fnt_8bit);
draw_text(x + 92, y + 11, string(global.flag[1044]) + "G");
draw_set_halign(fa_left);
