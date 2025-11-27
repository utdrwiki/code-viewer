if (trigd)
{
    for (i = 0; i < 4; i++)
        draw_sprite_ext(spr_board_b2_bridgeoverlay, 0, 384 + (i * 32), 192, 2, 2, 0, c_white, 1);
}
marksiner++;
var i = 0;
var amt = round(clamp(sin(-(marksiner + (i * 72)) / 18), 0, 1) * 2) / 2;
var col = merge_color(#D48440, #E4C14C, amt);
draw_sprite_ext(spr_dw_b3bs_mysterypuzzlehint, 2, 224 + (32 * i), 96, 2, 2, 0, col, 1);
