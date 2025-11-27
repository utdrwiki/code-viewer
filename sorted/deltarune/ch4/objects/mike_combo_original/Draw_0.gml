if (action > 0)
{
    var xs = 1;
    var ys = 1;
    xs = 1 + lengthdir_x(0.1, current_time / 4);
    ys = 1 - lengthdir_y(0.1, current_time / 4);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * xs, image_yscale * ys, image_angle, c_white, 1);
    if (fade > 0)
        scr_dso(sprite_index, image_index, x, y, image_xscale * xs, image_yscale * ys, image_angle, 16777215, fade, 1);
    fade -= 0.1;
}
draw_set_color(c_white);
draw_set_alpha(circle_alpha);
d_circle(x, y, circle_scale * (0.8 + (0.2 * sin(current_time / 100))), 0);
draw_set_alpha(1);
