var contalpha = 1;
with (daddy)
    contalpha = actind;
if (view_current == 0)
{
    alpha = lerp(alpha, -0.01, 1/30);
    scale = lerp(scale, 4, 0.02);
    depth += 1;
    if (alpha <= 0)
        instance_destroy();
}
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var col = merge_color(color2, color, alpha);
draw_set_font(font);
draw_text_transformed_color(x + xoff, y + yoff, string_hash_to_newline(mystring), scale, scale, angle, col, col, col, col, alpha * contalpha);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
