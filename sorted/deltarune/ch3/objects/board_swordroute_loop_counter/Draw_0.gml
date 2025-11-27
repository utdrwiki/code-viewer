if (active)
{
    draw_set_color(c_yellow);
    draw_set_font(fnt_small);
    draw_text_outline(camerax() + 4, cameray() + 4, "con:" + string(con), 0);
}
