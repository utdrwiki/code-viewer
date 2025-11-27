draw_self();
draw_set_halign(fa_center);
if (global.lang == "en")
{
    draw_set_font(fnt_main);
    draw_set_color(c_black);
    draw_set_alpha(0.25);
    draw_text_transformed(x + 3, (y - 50) + 2, mystring, 2, 2, 0);
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_text_transformed(x + 3, y - 50, mystring, 2, 2, 0);
}
else if (global.lang == "ja")
{
    var font_scale = 1;
    var font_offset = 8;
    if (mystring == "???")
    {
        font_scale = 2;
        font_offset = 0;
        draw_set_font(fnt_main);
    }
    else
    {
        draw_set_font(scr_84_get_font("8bit"));
    }
    draw_set_color(c_black);
    draw_set_alpha(0.25);
    draw_text_transformed(x + 3, (y - 50) + 2 + font_offset, mystring, font_scale, font_scale, 0);
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_text_transformed(x + 3, (y - 50) + font_offset, mystring, font_scale, font_scale, 0);
}
draw_set_halign(fa_left);
draw_sprite_ext(spr_quiz_podium_white, 0, x - 24, y - 44, 2, 2, 0, c_white, screen_alpha);
