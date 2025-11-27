if (con == 0)
{
    timer += 2;
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
if (color_change == 0)
    color_change = 1;
else
    color_change = 0;
var _string = string("$" + string(score_text));
var a = string_length(_string);
if (init == 0)
{
    for (i = 0; i < a; i += 1)
    {
        string_letter[i] = string_char_at(string(_string), i + 1);
        string_y[i] = -1;
        string_vspeed[i] = 0;
        string_gravity[i] = 0;
        string_delay[i] = i * 2;
    }
    init = 1;
}
for (i = 0; i < a; i += 1)
{
    if (string_delay[i] == stringtimer)
    {
        string_vspeed[i] = -10;
        string_gravity[i] = 2;
    }
    string_y[i] += string_vspeed[i];
    string_vspeed[i] += string_gravity[i];
    if ((string_y[i] + string_vspeed[i]) > 0)
    {
        string_vspeed[i] = 0;
        string_gravity[i] = 0;
        string_y[i] = 0;
    }
    scr_84_set_draw_font("main");
    draw_set_alpha(image_alpha);
    draw_set_color(c_black);
    draw_text_transformed((x - 1) + (i * 8), y + string_y[i], string_letter[i], image_xscale, image_yscale, image_angle);
    draw_text_transformed(x + (i * 8), (y - 1) + string_y[i], string_letter[i], image_xscale, image_yscale, image_angle);
    draw_text_transformed(x + 1 + (i * 8), y + string_y[i], string_letter[i], image_xscale, image_yscale, image_angle);
    draw_text_transformed(x + (i * 8), y + 1 + string_y[i], string_letter[i], image_xscale, image_yscale, image_angle);
    if (color_change == 0)
        draw_set_color(c_white);
    else
        draw_set_color(c_yellow);
    draw_text_transformed(x + (i * 8), y + string_y[i], string_letter[i], image_xscale, image_yscale, image_angle);
    draw_set_color(c_white);
    draw_set_alpha(1);
}
stringtimer++;
