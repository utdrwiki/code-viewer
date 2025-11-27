if (init == 0)
    string_length(string(score_text) + "$");
if (con == 0)
{
    timer += 2;
    x = lerp(x, xstart + 30, timer / 60);
    if (timer == 60)
    {
        timer = 0;
        con = 1;
    }
}
else
{
    image_alpha -= 0.1;
}
if ((y + vspeed) > ystart)
{
    vspeed = 0;
    gravity = 0;
    y = ystart;
}
scr_84_set_draw_font("main");
draw_set_alpha(image_alpha);
draw_set_color(c_black);
draw_text_transformed(x - 1, y, "$" + string(score_text), image_xscale, image_yscale, image_angle);
draw_text_transformed(x, y - 1, "$" + string(score_text), image_xscale, image_yscale, image_angle);
draw_text_transformed(x + 1, y, "$" + string(score_text), image_xscale, image_yscale, image_angle);
draw_text_transformed(x, y + 1, "$" + string(score_text), image_xscale, image_yscale, image_angle);
if (color_change == 0)
{
    color_change = 1;
    draw_set_color(c_white);
}
else
{
    color_change = 0;
    draw_set_color(c_yellow);
}
draw_text_transformed(x, y, "$" + string(score_text), image_xscale, image_yscale, image_angle);
draw_set_color(c_white);
draw_set_alpha(1);
