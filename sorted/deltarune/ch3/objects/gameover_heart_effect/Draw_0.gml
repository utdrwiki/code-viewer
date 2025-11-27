if (drawbg)
{
    draw_set_color(c_black);
    ossafe_fill_rectangle(camerax() - 20, cameray() - 20, camerax() + 640 + 20, cameray() + 480 + 20, false);
    draw_set_color(c_white);
}
draw_self();
