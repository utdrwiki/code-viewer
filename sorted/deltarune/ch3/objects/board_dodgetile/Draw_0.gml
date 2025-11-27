draw_set_color(c_white);
draw_set_alpha(1);
draw_self();
if (i_ex(obj_growtangle))
{
    bg = lerp(bg, 0.8, 0.1);
    draw_set_color(c_black);
    draw_set_alpha(bg);
    ossafe_fill_rectangle(0, 0, 640, 480);
    draw_set_alpha(1);
}
else
{
    bg = 0;
}
