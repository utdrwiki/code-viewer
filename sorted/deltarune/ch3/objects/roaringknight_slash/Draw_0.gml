var hx = lengthdir_x(640, direction);
var hy = lengthdir_y(640, direction);
var hxoff = lengthdir_x(width, direction + 90);
var hyoff = lengthdir_y(width, direction + 90);
var color = make_color_rgb(255, (1 - image_alpha) * 255, (1 - image_alpha) * 255);
draw_set_alpha(image_alpha * 2);
if (slashdir)
    draw_triangle_color(x - (hx * image_alpha), y - (hy * image_alpha), x + hx + hxoff, y + hy + hyoff, (x + hx) - hxoff, (y + hy) - hyoff, color, color, color, false);
else
    draw_triangle_color(x + (hx * image_alpha), y + (hy * image_alpha), (x - hx) + hxoff, (y - hy) + hyoff, x - hx - hxoff, y - hy - hyoff, color, color, color, false);
draw_set_alpha(1);
