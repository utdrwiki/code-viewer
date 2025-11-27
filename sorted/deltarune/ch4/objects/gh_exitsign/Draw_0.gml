if (!stop)
    timer += 0.18479956785822313;
else
    image_angle += speed;
var _x = x;
var _y = y;
_x += lengthdir_x(sin(timer) * 4, image_angle);
_y += lengthdir_y(sin(timer) * 4, image_angle);
draw_sprite_ext(sprite_index, image_index, _x, _y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
