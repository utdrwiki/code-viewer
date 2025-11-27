scr_84_set_draw_font("main");
draw_set_halign(fa_center);
draw_set_alpha(creditalpha);
if (credit_index < 0)
{
    var line_total = 0;
    for (var i = 0; i < array_length(title_credit); i++)
        line_total++;
    var max_height = __view_get(e__VW.HView, 0);
    var max_line_height = (line_total + 1) * 16;
    for (var i = 0; i < array_length(title_credit); i++)
    {
        var _y_offset = (max_height - max_line_height) / 2;
        draw_text(x_pos, y_pos + (line_height * i) + _y_offset, string_hash_to_newline(title_credit[i]));
    }
}
else if (credit_index < array_length(credits))
{
    var line_total = 0;
    for (var i = 0; i < array_length(credits[credit_index]); i++)
    {
        var _credit = credits[credit_index][i];
        line_total += (array_length(_credit.header) + array_length(_credit.text_line) + 1);
        if (_credit.columns == 2)
            line_total -= 8;
    }
    var max_height = __view_get(e__VW.HView, 0);
    var max_line_height = (line_total + 1) * 16;
    var credit_line_amount = 0;
    var credit_line_offset = 1;
    var _y_offset = (max_height - max_line_height) / 2;
    if (array_length(credits[credit_index]) > 3)
    {
        credit_line_offset = 0.5;
        _y_offset += 10;
    }
    for (var i = 0; i < array_length(credits[credit_index]); i++)
    {
        var _credit = credits[credit_index][i];
        if (_credit.columns == 1)
        {
            var _yy = credit_line_amount * line_height;
            draw_set_color(menugray);
            for (var j = 0; j < array_length(_credit.header); j++)
                draw_text(x_pos, _yy + y_pos + (line_height * j) + _y_offset, string_hash_to_newline(_credit.header[j]));
            draw_set_color(c_white);
            var _text_y = line_height * array_length(_credit.header);
            for (var k = 0; k < array_length(_credit.text_line); k++)
                draw_text(x_pos, _yy + y_pos + _text_y + (line_height * k) + _y_offset, string_hash_to_newline(_credit.text_line[k]));
            credit_line_amount += (array_length(_credit.header) + array_length(_credit.text_line) + credit_line_offset);
        }
        else
        {
            var _yy = credit_line_amount * line_height;
            draw_set_color(menugray);
            for (var j = 0; j < array_length(_credit.header); j++)
                draw_text(x_pos, _yy + y_pos + (line_height * j) + _y_offset, string_hash_to_newline(_credit.header[j]));
            draw_set_color(c_white);
            var _text_y = line_height * array_length(_credit.header);
            draw_set_halign(fa_left);
            for (k = 0; k < (array_length(_credit.text_line) / 2); k++)
                draw_text(168, _yy + y_pos + _text_y + (line_height * k) + _y_offset, string(_credit.text_line[k]));
            draw_set_halign(fa_right);
            var line_index = 0;
            var k = array_length(_credit.text_line) / 2;
            while (k < array_length(_credit.text_line))
            {
                draw_text(152, _yy + y_pos + _text_y + (line_height * line_index) + _y_offset, string(_credit.text_line[k]));
                line_index++;
                k++;
            }
            draw_set_halign(fa_center);
            credit_line_amount += (array_length(_credit.header) + (array_length(_credit.text_line) / 2) + 1);
        }
    }
}
else
{
    var line_total = 0;
    for (var i = 0; i < array_length(continued_text); i++)
        line_total++;
    var max_height = __view_get(e__VW.HView, 0);
    var max_line_height = (line_total + 1) * 16;
    for (var i = 0; i < array_length(continued_text); i++)
    {
        var _y_offset = (max_height - max_line_height) / 2;
        draw_text(x_pos, y_pos + (line_height * i) + _y_offset, string_hash_to_newline(continued_text[i]));
    }
}
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_set_alpha(1);

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
