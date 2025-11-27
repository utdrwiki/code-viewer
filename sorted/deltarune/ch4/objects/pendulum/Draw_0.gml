if (!cut)
{
    image_angle = point_direction(x, y, obj_growtangle.x, obj_growtangle.y - 200);
    d_line_width_color(x, y, obj_growtangle.x, obj_growtangle.y - 200, 4, 8421504, 8421504);
}
draw_self();
