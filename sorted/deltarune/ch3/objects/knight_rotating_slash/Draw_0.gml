if (!surface_exists(my_surface))
    my_surface = surface_create(scr_get_box(0) - scr_get_box(2) - 8, scr_get_box(3) - scr_get_box(1) - 8);
if (surface_exists(my_surface))
    surface_resize(my_surface, scr_get_box(0) - scr_get_box(2) - 8, scr_get_box(3) - scr_get_box(1) - 8);
surface_set_target(my_surface);
draw_clear_alpha(c_black, 0);
if (state == "aim" && timer)
{
    for (a = 0; a < slash_number; a++)
    {
        var dir = ((360 / (slash_number * 2)) * a) + random_offset + aim_direction;
        var color = make_color_rgb(r, g, b);
        draw_sprite_ext(spr_rk_quickslash_marker_gradient, 0, aim_x - (scr_get_box(2) + 5), aim_y - (scr_get_box(1) + 5), timer * 0.2, 1 + (2 * (1 - (timer / (slash_base + 6 + slash_offset)))), dir, color, 1);
    }
    for (a = 0; a < slash_number; a++)
    {
        var dir = ((360 / (slash_number * 2)) * a) + random_offset + aim_direction;
        draw_sprite_ext(spr_rk_quickslash_marker, 0, aim_x - (scr_get_box(2) + 5), aim_y - (scr_get_box(1) + 5), timer * 0.2, 1 + (2 * (1 - (timer / (slash_base + 6 + slash_offset)))), dir, c_black, 1);
    }
    if (line2)
    {
        draw_set_alpha(1 - (line2 / 7));
        for (a = 0; a < slash_number; a++)
        {
            var dir = ((360 / (slash_number * 2)) * a) + random_offset + aim_direction;
            var dirx = lengthdir_x(320, dir);
            var diry = lengthdir_y(320, dir);
            var color = make_color_rgb(r, g, b);
            draw_line_width_color((aim_x - (scr_get_box(2) + 5)) + dirx + lengthdir_x(line2 * 6, dir + 90), (aim_y - (scr_get_box(1) + 5)) + diry + lengthdir_y(line2 * 6, dir + 90), (aim_x - (scr_get_box(2) + 5) - dirx) + lengthdir_x(line2 * 6, dir + 90), (aim_y - (scr_get_box(1) + 5) - diry) + lengthdir_y(line2 * 6, dir + 90), line_width, color, color);
            draw_line_width_color(((aim_x - (scr_get_box(2) + 5)) + dirx) - lengthdir_x(line2 * 6, dir + 90), ((aim_y - (scr_get_box(1) + 5)) + diry) - lengthdir_y(line2 * 6, dir + 90), aim_x - (scr_get_box(2) + 5) - dirx - lengthdir_x(line2 * 6, dir + 90), aim_y - (scr_get_box(1) + 5) - diry - lengthdir_y(line2 * 6, dir + 90), line_width, color, color);
        }
        draw_set_alpha(1);
    }
    if (line3)
    {
        draw_set_alpha(1 - (line3 / 7));
        for (a = 0; a < slash_number; a++)
        {
            var dir = ((360 / (slash_number * 2)) * a) + random_offset + aim_direction;
            var dirx = lengthdir_x(320, dir);
            var diry = lengthdir_y(320, dir);
            var color = make_color_rgb(r, g, b);
            draw_line_width_color((aim_x - (scr_get_box(2) + 5)) + dirx + lengthdir_x(line3 * 6, dir + 90), (aim_y - (scr_get_box(1) + 5)) + diry + lengthdir_y(line3 * 6, dir + 90), (aim_x - (scr_get_box(2) + 5) - dirx) + lengthdir_x(line3 * 6, dir + 90), (aim_y - (scr_get_box(1) + 5) - diry) + lengthdir_y(line3 * 6, dir + 90), line_width, color, color);
            draw_line_width_color(((aim_x - (scr_get_box(2) + 5)) + dirx) - lengthdir_x(line3 * 6, dir + 90), ((aim_y - (scr_get_box(1) + 5)) + diry) - lengthdir_y(line3 * 6, dir + 90), aim_x - (scr_get_box(2) + 5) - dirx - lengthdir_x(line3 * 6, dir + 90), aim_y - (scr_get_box(1) + 5) - diry - lengthdir_y(line3 * 6, dir + 90), line_width, color, color);
        }
        draw_set_alpha(1);
    }
}
with (obj_roaringknight_slash)
{
    var hx = lengthdir_x(640, direction);
    var hy = lengthdir_y(640, direction);
    var hxoff = lengthdir_x(width, direction + 90);
    var hyoff = lengthdir_y(width, direction + 90);
    var color = make_color_rgb(255, (1 - image_alpha) * 255, (1 - image_alpha) * 255);
    if (slashdir)
        draw_triangle_color(x - (scr_get_box(2) + 5) - (hx * image_alpha), y - (scr_get_box(1) + 5) - (hy * image_alpha), (x - (scr_get_box(2) + 5)) + hx + hxoff, (y - (scr_get_box(1) + 5)) + hy + hyoff, ((x - (scr_get_box(2) + 5)) + hx) - hxoff, ((y - (scr_get_box(1) + 5)) + hy) - hyoff, color, color, color, false);
    else
        draw_triangle_color((x - (scr_get_box(2) + 5)) + (hx * image_alpha), (y - (scr_get_box(1) + 5)) + (hy * image_alpha), (x - (scr_get_box(2) + 5) - hx) + hxoff, (y - (scr_get_box(1) + 5) - hy) + hyoff, x - (scr_get_box(2) + 5) - hx - hxoff, y - (scr_get_box(1) + 5) - hy - hyoff, color, color, color, false);
}
surface_reset_target();
draw_surface(my_surface, scr_get_box(2) + 5, scr_get_box(1) + 5);
draw_sprite_ext(sprite_index, image_index, x, y + (sin(global.time * 0.1) * 2), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
