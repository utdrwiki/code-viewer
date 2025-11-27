if (!surface_exists(my_surface))
    my_surface = surface_create(46, 46);
surface_set_target(my_surface);
draw_clear_alpha(c_black, 0);
draw_sprite_ext(sprite_index, timer * 0.25, 23, 23, 1, 1, image_angle, image_blend, image_alpha);
var hdir = point_direction(x, y, obj_heart.x + 10, obj_heart.y + 10);
draw_sprite_ext(spr_darkshape_eye, 0, 23, 23, 1, 1, 0, image_blend, image_alpha);
draw_sprite_ext(spr_darkshape_iris, 0, 23 + lengthdir_x(2, hdir), 23 + lengthdir_y(2, hdir) + 1, 1, 1, 0, image_blend, image_alpha);
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
    draw_surface_part(my_surface, 0, a, 46, 1, (x - 23) + (sin((a + timer) * 1) * (4 - (image_alpha * 4)) * side) + xoff, (y - 23) + a + yoff);
}
