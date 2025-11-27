if (room == room_dw_puzzlecloset_3)
{
    draw_sprite_ext(spr_pxwhite, 0, x, y, sprite_width, sprite_height, 0, merge_color(c_blue, c_white, 0.4), 0.5);
    for (var i = 0; i < 8; i++)
    {
        for (var ii = 0; ii < 6; ii++)
        {
            draw_set_font(fnt_8bit);
            draw_set_color(merge_color(c_blue, c_yellow, clamp(abs(sin((siner + ((i + ii) * 10)) / 30)), 0, 1)));
            draw_set_alpha(sin((siner + ((i + (ii * 20)) * 10)) / 30));
            draw_text(x + 1 + (i * 16), y + (ii * 16), "0");
            draw_set_alpha(1);
            draw_set_color(c_white);
        }
    }
}
