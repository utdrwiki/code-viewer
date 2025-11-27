draw_self_board();
if (active)
{
    if (view_current == 0)
        siner++;
    var col = merge_color(#C0E188, #FFECBD, abs(sin(siner / 30)));
    draw_sprite_ext(spr_pxwhite, 0, x + 8, y + 8, 2, 2, 0, col, 1);
    col = merge_color(#C0E188, #FFECBD, abs(sin((siner + 20) / 30)));
    draw_sprite_ext(spr_pxwhite, 0, x + 18, y + 8, 2, 2, 0, col, 1);
    col = merge_color(#C0E188, #FFECBD, abs(sin((siner + 60) / 30)));
    draw_sprite_ext(spr_pxwhite, 0, x + 26, y + 12, 2, 2, 0, col, 1);
    col = merge_color(#C0E188, #FFECBD, abs(sin((siner + 14) / 30)));
    draw_sprite_ext(spr_pxwhite, 0, x + 4, y + 16, 2, 2, 0, col, 1);
    col = merge_color(#C0E188, #FFECBD, abs(sin((siner + 3) / 30)));
    draw_sprite_ext(spr_pxwhite, 0, x + 26, y + 20, 2, 2, 0, col, 1);
    col = merge_color(#C0E188, #FFECBD, abs(sin((siner - 20) / 30)));
    draw_sprite_ext(spr_pxwhite, 0, x + 10, y + 22, 2, 2, 0, col, 1);
}
