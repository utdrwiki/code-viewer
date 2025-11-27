draw_set_color(c_black);
if (change_mode)
{
    if (top_y_limit != 20)
        top_y_limit = scr_movetowards(top_y_limit, 20, 2);
    if (bottom_y_limit != 416)
        bottom_y_limit = scr_movetowards(bottom_y_limit, 416, 4);
    else
        change_mode = false;
}
ossafe_fill_rectangle(camerax(), cameray(), camerax() + view_wport[0], cameray() + top_y_limit, false);
if (!hide_bottom)
    ossafe_fill_rectangle(camerax(), cameray() + bottom_y_limit, camerax() + view_wport[0], cameray() + view_hport[0], false);
draw_set_color(c_white);
