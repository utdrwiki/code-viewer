marksiner++;
for (var i = 0; i < 3; i++)
{
    var amt = round(clamp(sin(-(marksiner + (i * 72)) / 18), 0, 1) * 2) / 2;
    var col = merge_color(#D48440, #E4C14C, amt);
    draw_sprite_ext(spr_dw_b3bs_mysterypuzzlehint, i, 288 + (32 * i), 64, 2, 2, 0, col, 1);
}
