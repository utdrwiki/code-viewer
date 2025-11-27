siner++;
var sinamt = abs(sin(siner / 80) * 8);
var col = merge_color(#B27447, #734E34, round(sinamt) / 8);
draw_sprite_ext(spr_pxwhite, 0, x + 2, y - 18, 32, 14, 0, col, 1);
