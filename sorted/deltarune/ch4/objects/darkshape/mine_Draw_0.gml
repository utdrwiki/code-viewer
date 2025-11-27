if (!surface_exists(my_surface))
    my_surface = surface_create(88, 88);
var color = make_color_rgb(255, (1 - light) * 255, (1 - light) * 255);
surface_set_target(my_surface);
draw_clear_alpha(c_black, 0);
draw_sprite_ext(sprite_index, image + ((timer % 4) * 0.5), 44, 44, xscale * xface * scalefactor, yscale * yface * scalefactor, image_angle, color, image_alpha);
surface_reset_target();
var xoff = 0;
var yoff = 0;
if (shakeme)
{
    xoff = choose(-1, 0, 1);
    yoff = choose(-1, 0, 1);
}
for (a = 0; a < 88; a++)
{
    var side = 1;
    draw_surface_part(my_surface, 0, a, 88, 1, (x - 46) + (sin((a + timer) * 1) * (3 - (image_alpha * 3)) * side) + xoff, (y - 44) + a + yoff);
}
