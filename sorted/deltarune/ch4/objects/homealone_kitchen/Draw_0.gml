if (screen_dark)
{
    draw_set_color(c_black);
    ossafe_fill_rectangle(camerax(), cameray(), camerax() + view_wport[0], cameray() + view_hport[0], false);
    draw_set_color(c_white);
}
