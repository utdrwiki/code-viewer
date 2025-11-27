scr_84_set_draw_font("dotumche");
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_alpha(speech_alpha);
draw_text_transformed(speech_xpos, speech_ypos, current_text, speech_xscale, speech_yscale, 0);
draw_set_alpha(1);
draw_set_halign(fa_left);
