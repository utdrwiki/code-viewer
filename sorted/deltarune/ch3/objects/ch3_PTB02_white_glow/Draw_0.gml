siner += 2;
if (t >= 400)
{
    rs += 0.5;
    draw_set_color(c_white);
    for (i = 1; i < 12; i += 1)
    {
        draw_set_alpha((rs / 16) - (i / 12));
        ossafe_fill_rectangle((camerax() + 320) - (i * i) - (rs * i), 0, camerax() + 320 + (i * i) + (rs * i), 500);
    }
    draw_set_alpha(1);
}
t += 1.5;
if (t >= 390 && t < 395)
{
    t = 400;
    siner = 3;
}
if (t >= 450)
{
    ds2 += 0.035;
    draw_set_alpha(ds2);
    draw_set_color(c_white);
    ossafe_fill_rectangle(camerax() - 10, cameray() - 10, camerax() + 999, cameray() + 999);
    draw_set_alpha(1);
}
if (t >= 510)
{
}
