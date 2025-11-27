get_view_xy(view_current);
x = vx + (vw / 2);
y = (vy + (vh / 2)) - (selection * 48);
t++;
draw_set_font(fnt_mainbig);
draw_set_halign(fa_center);
for (var i = 0; i < menu_length; i++)
{
    draw_set_color(#305182);
    var _text = option[i];
    if (i == selection && selection != (menu_length - 1))
        _text = "<- " + option[i] + " ->";
    draw_text(x + 2, y + (i * 48) + 2, _text);
    if (selection == i)
    {
        if (selected && (t % 3) == 0)
            draw_set_color(c_white);
        else
            draw_set_color(#61D3E3);
    }
    else
    {
        draw_set_color(#4192C3);
    }
    draw_text(x, y + (i * 48), _text);
}
