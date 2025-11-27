draw_set_color(c_white);
d_line(xstart - 1, cameray(), xstart - 1, cameray() + 25);
if (!drop_ornament)
    d_line(xstart - 1, cameray() + 25, xstart - 1, y);
draw_self();
