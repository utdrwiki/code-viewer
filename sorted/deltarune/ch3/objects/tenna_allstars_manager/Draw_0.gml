if (!surface_exists(my_surface))
    my_surface = surface_create(camerawidth(), cameraheight());
if (!surface_exists(my_surface2))
    my_surface2 = surface_create(camerawidth(), cameraheight());
surface_set_target(my_surface);
draw_clear_alpha(c_black, 0);
ossafe_fill_rectangle_color(0, 0, camerawidth(), cameraheight(), c_black, c_black, c_black, c_black, false);
draw_set_alpha(0.5);
draw_circle_color(camerawidth() * 0.5, 0, 320 * fade, c_white, c_white, false);
draw_circle_color(camerawidth() * 0.5, 0, 280 * fade, c_white, c_white, false);
draw_set_alpha(1);
draw_circle_color(camerawidth() * 0.5, 0, 240 * fade, c_white, c_white, false);
draw_set_alpha(0.5);
draw_circle_color(camerawidth() * 0.5, 0, 120 * fade, c_black, c_black, false);
draw_circle_color(camerawidth() * 0.5, 0, 80 * fade, c_black, c_black, false);
draw_set_alpha(1);
draw_circle_color(camerawidth() * 0.5, 0, 40 * fade, c_black, c_black, false);
surface_reset_target();
shader_set(shd_luminosity_to_transparency);
draw_surface_ext(my_surface, camerax(), cameray(), 1, 1, 0, c_white, opaq);
shader_reset();
