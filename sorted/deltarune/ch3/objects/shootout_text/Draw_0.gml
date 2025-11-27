var _yoffset = ease_out_back(clamp(image_alpha, 0, 1), 0, 20, 1);
x = xstart;
y = ystart - _yoffset;
if (con == 0)
{
    timer--;
    if (timer <= 0)
    {
        timer = 0;
        con = 1;
    }
}
else if (con == 1)
{
    image_alpha += 0.1;
    if (image_alpha >= 2)
        con = 2;
}
else
{
    image_alpha -= 0.1;
    if (image_alpha <= 0)
        instance_destroy();
}
draw_set_font(fnt_main);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(color);
draw_set_alpha(image_alpha);
draw_text_transformed_outline(x, y, text, 2, 2);
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
