if (!surface_exists(my_surface))
    my_surface = surface_create(46, 46);
surface_set_target(my_surface);
draw_clear_alpha(c_black, 0);
if (image != 0)
    draw_sprite_ext(shrink_sprite, image, 23, 23, xscale, yscale, image_angle, image_blend, image_alpha);
else
    draw_sprite_ext(sprite_index, (timer + individuality) * 0.25, 23, 23, xscale, yscale, image_angle, image_blend, image_alpha);
surface_reset_target();
var xoff = 0;
var yoff = 0;
if (shakeme)
{
    xoff = choose(-1, 0, 1);
    yoff = choose(-1, 0, 1);
}
for (a = 0; a < 46; a++)
{
    var side = 1;
    draw_surface_part(my_surface, 0, a, 46, 1, (x - 22) + (sin((a + timer) * 1) * (4 - (image_alpha * 4)) * side) + xoff, (y - 23) + a + yoff);
}
if (light > 0)
{
    d3d_set_fog(true, c_white, 0, 0);
    if (image != 0)
        draw_sprite_ext(shrink_sprite, image, x + 1 + xoff, y + yoff, xscale, yscale, image_angle, image_blend, light);
    else
        draw_sprite_ext(sprite_index, (timer + individuality) * 0.25, x + 1 + xoff, y + yoff, xscale, xscale, image_angle, image_blend, light);
    d3d_set_fog(false, c_white, 0, 0);
}
