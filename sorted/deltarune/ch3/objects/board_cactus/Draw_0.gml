image_blend = c_white;
draw_self_board();
if (!wither)
{
    timer++;
    if ((timer % 6) == 0)
        spineindex++;
    sinval = abs(sin(spineindex / 3)) / 2;
    image_blend = merge_color(#CBC83D, c_white, 0.5 + sinval);
    draw_sprite_ext(spr_board_cactus_spines, image_index, x, y, 2, 2, 0, image_blend, 1);
}
