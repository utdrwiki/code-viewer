siner += 2;
if (t >= 400)
{
    rs += 0.5;
    draw_set_color(c_white);
    for (i = 1; i < 12; i += 1)
    {
        draw_set_alpha((rs / 16) - (i / 12));
        ossafe_fill_rectangle(320 - (i * i) - (rs * i), 0, 320 + (i * i) + (rs * i), 500, 0);
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
    ossafe_fill_rectangle(-10, -10, 999, 999, false);
    draw_set_alpha(1);
}
if (t >= 510)
{
    with (obj_ch3_PGS01E_field)
        con = 20;
    instance_destroy();
}
