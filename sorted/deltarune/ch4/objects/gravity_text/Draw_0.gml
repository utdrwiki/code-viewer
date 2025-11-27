if (small)
    draw_set_font(fnt_main);
else
    draw_set_font(fnt_mainbig);
draw_set_colour(image_blend);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(image_alpha);
draw_text_transformed_outline(x, y, str, 1, image_yscale, 0);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
