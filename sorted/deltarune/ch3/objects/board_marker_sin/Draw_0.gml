timer++;
var xmod = sin(timer / xrate) * xamt;
var ymod = sin(timer / yrate) * yamt;
if (xrate == 0 || xamt == 0)
    xmod = 0;
if (yrate == 0 || yamt == 0)
    ymod = 0;
if (style == 0)
    draw_sprite_ext(sprite_index, image_index, scr_even(x + xmod), scr_even(y + ymod), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (style == 1)
    draw_sprite_ext(sprite_index, image_index, scr_even(x + xmod), scr_even(y + abs(ymod)), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (style == 2)
    draw_sprite_ext(sprite_index, image_index, scr_even(x + abs(xmod)), scr_even(y + ymod), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (style == 3)
    draw_sprite_ext(sprite_index, image_index, scr_even(x + abs(xmod)), scr_even(y + abs(ymod)), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
