if (!draw_end)
    exit;
if (!surface_exists(my_surface))
    my_surface = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
surface_set_target(my_surface);
draw_surface(application_surface, 0, 0);
surface_reset_target();
draw_surface_ext(my_surface, x - (anchor_x * xscale), y - (anchor_y * yscale), xscale, yscale, 0, c_white, alpha);
with (obj_heart)
    draw_self();
