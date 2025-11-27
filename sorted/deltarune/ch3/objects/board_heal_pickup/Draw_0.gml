greensiner++;
if ((greensiner % 6) == 0)
    greenindex++;
var sinval = abs(sin(greenindex / 3));
image_blend = merge_color(green, yellow, sinval);
draw_self_board();
