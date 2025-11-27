if (action > 0)
{
    if (hp < (hp_max * 0.75))
    {
        var dist = point_distance(x, y, xprevious, yprevious);
        var dir = point_direction(x, y, xprevious, yprevious);
        for (var i = 0; i < (dist / 8); i++)
        {
            var _x = x + lengthdir_x((i / (dist / 8)) * dist, dir);
            var _y = y + lengthdir_y((i / (dist / 8)) * dist, dir);
            draw_sprite_ext(sprite_index, image_index, _x, _y, image_xscale * xscale * sc, image_yscale * yscale * sc, angle, image_blend, 1);
        }
    }
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * xscale * sc, image_yscale * yscale * sc, angle, image_blend, 1);
    if (fade > 0)
        scr_dso(sprite_index, image_index, x, y, image_xscale * xscale * sc, image_yscale * yscale * sc, angle, 16777215, fade, 1);
    fade -= 0.1;
}
draw_set_colour(c_white);
draw_set_alpha(circle_alpha);
d_circle(x, y, circle_scale * (0.8 + (0.2 * sin(current_time / 100))), 0);
draw_set_alpha(1);
