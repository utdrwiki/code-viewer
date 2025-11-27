var debug = false;
if (debug)
{
    var xx = camerax() + 20;
    var yy = cameray() + 20;
    var space = 8;
    var count = 0;
    draw_set_font(fnt_small);
    if (i_ex(favored))
        draw_set_color(c_yellow);
    if (i_ex(unfavored))
        draw_set_color(c_orange);
    if (i_ex(rouxls))
        draw_set_color(c_blue);
    draw_set_color(c_yellow);
    draw_text_outline(xx, yy + (space * count), "xoff[0]=" + string(xoff[0]));
    count++;
    draw_text_outline(xx, yy + (space * count), "yoff[0]=" + string(yoff[0]));
    count++;
    draw_set_color(c_aqua);
    draw_text_outline(xx, yy + (space * count), "xoff[1]=" + string(xoff[1]));
    count++;
    draw_text_outline(xx, yy + (space * count), "yoff[1]=" + string(yoff[1]));
    count++;
}
