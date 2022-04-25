if scr_debug_ch1()
{
    draw_set_font(fnt_main)
    draw_set_color(c_red)
    draw_text(__view_get((0 << 0), 0), __view_get((1 << 0), 0), fps)
}
