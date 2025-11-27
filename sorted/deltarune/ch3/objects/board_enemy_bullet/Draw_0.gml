siner++;
if ((siner % 2) == 0)
    colorsiner++;
sinamt = abs(sin(colorsiner / 3));
image_blend = merge_color(red, yellow, sinamt);
draw_self_board();
image_blend = merge_color(yellow, red, 0.5 + (sinamt / 2));
draw_sprite_ext(spr_smallbullet_outline, 0, round(x / 2) * 2, round(y / 2) * 2, 1, 1, 0, image_blend, 1);
