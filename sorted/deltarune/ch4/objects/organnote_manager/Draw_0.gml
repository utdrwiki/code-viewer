var col = merge_color(c_green, c_lime, 0.5);
var v_pos;
if (sameattacker == 0)
    v_pos = scr_get_box(1) - 40;
else
    v_pos = scr_get_box(3) + 40;
for (var a = 0; a < 5; a++)
    d_line_width_color(scr_get_box(0) + 20, (v_pos - 20) + (10 * a), (scr_get_box(0) + 20) - drawlength, (v_pos - 20) + (10 * a), 2, col, col);
for (var b = 0; b < drawlength; b++)
{
    if (b == 50 || b == 140)
        d_line_width_color((scr_get_box(0) + 20) - b, v_pos - 25, (scr_get_box(0) + 20) - b, v_pos + 25, 2, col, col);
}
