if (!i_ex(obj_growtangle))
    exit;
x1 = x;
y1 = y;
x2 = x + image_xscale;
y2 = y + image_yscale;
x3 = x;
y3 = y;
x4 = x;
y4 = y;
x5 = x;
y5 = y;
x6 = x;
y6 = y;
if (special == 0)
{
    if (obj_growtangle.maxxscale == 2)
    {
        if (x1 < (obj_growtangle.x - 210))
            x1 = obj_growtangle.x - 210;
        if (x2 > (obj_growtangle.x + 215))
            x2 = obj_growtangle.x + 215;
        if (y1 < (obj_growtangle.y - 35))
            y1 = obj_growtangle.y - 35;
        if (y2 > (obj_growtangle.y + 35))
            y2 = obj_growtangle.y + 35;
    }
    else
    {
        if (x1 < (obj_growtangle.x - 53))
            x1 = obj_growtangle.x - 53;
        if (y1 < (obj_growtangle.y - 53))
            y1 = obj_growtangle.y - 53;
        if (x2 > (obj_growtangle.x + 53))
            x2 = obj_growtangle.x + 53;
        if (y2 > (obj_growtangle.y + 53))
            y2 = obj_growtangle.y + 53;
    }
    draw_set_alpha(image_alpha);
    ossafe_fill_rectangle_color(x1, y1, x2, y2, c_white, c_white, c_white, c_white, false);
    draw_set_alpha(1);
}
if (special > 0)
{
    if (special == 1)
    {
        x1 = obj_growtangle.x + 53;
        y1 = obj_growtangle.y;
        x2 = obj_growtangle.x + 53;
        y2 = obj_growtangle.y - 53;
        x3 = obj_growtangle.x;
        y3 = obj_growtangle.y - 53;
        x4 = obj_growtangle.x - 53;
        y4 = obj_growtangle.y;
        x5 = obj_growtangle.x - 53;
        y5 = obj_growtangle.y + 53;
        x6 = obj_growtangle.x;
        y6 = obj_growtangle.y + 53;
        draw_set_alpha(image_alpha);
        draw_set_color(c_white);
        d_triangle(x1, y1, x2, y2, x3, y3, false);
        d_triangle(x4, y4, x5, y5, x6, y6, false);
        d_triangle(x3, y3, x4, y4, x6, y6, false);
        d_triangle(x1, y1, x3, y3, x6, y6, false);
        draw_set_alpha(1);
    }
    if (special == 2)
    {
        x1 = obj_growtangle.x - 53;
        y1 = obj_growtangle.y;
        x2 = obj_growtangle.x - 53;
        y2 = obj_growtangle.y - 53;
        x3 = obj_growtangle.x;
        y3 = obj_growtangle.y - 53;
        x4 = obj_growtangle.x + 53;
        y4 = obj_growtangle.y;
        x5 = obj_growtangle.x + 53;
        y5 = obj_growtangle.y + 53;
        x6 = obj_growtangle.x;
        y6 = obj_growtangle.y + 53;
        draw_set_alpha(image_alpha);
        draw_set_color(c_white);
        d_triangle(x1, y1, x2, y2, x3, y3, false);
        d_triangle(x4, y4, x5, y5, x6, y6, false);
        d_triangle(x3, y3, x4, y4, x6, y6, false);
        d_triangle(x1, y1, x3, y3, x6, y6, false);
        draw_set_alpha(1);
    }
    if (special == 3)
    {
        draw_set_alpha(image_alpha);
        ossafe_fill_rectangle_color(obj_growtangle.x - 30, obj_growtangle.y - 53, obj_growtangle.x + 32, obj_growtangle.y + 53, c_white, c_white, c_white, c_white, false);
        draw_set_alpha(1);
    }
    if (special == 4)
    {
        draw_set_alpha(image_alpha);
        ossafe_fill_rectangle_color(obj_growtangle.x - 53, obj_growtangle.y + 30, obj_growtangle.x + 53, obj_growtangle.y - 32, c_white, c_white, c_white, c_white, false);
        draw_set_alpha(1);
    }
}
