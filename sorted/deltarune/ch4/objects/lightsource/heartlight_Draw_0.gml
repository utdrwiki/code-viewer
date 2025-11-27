if (supercharged)
{
    draw_set_color(c_white);
    var i = 0.25;
    while (i <= 0.5)
    {
        draw_set_alpha(1 - (i * 1.8));
        d_circle(x, y, smallerLight * i, false);
        i += max(0.025, 0.1 - (((power(i * 10, 1.035) / 10) - 0.25) / 3));
    }
    draw_set_alpha(1);
}
