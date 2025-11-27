if (!surface_exists(surf_recolour))
    surf_recolour = surface_create(640, 480);
surface_set_target(surf_recolour);
draw_clear_alpha(c_black, 0);
shader_set(shd_hsv_transform);
shader_set_uniform_f(u_hsv, hue, sat, val);
draw_surface(application_surface, 0, 0);
shader_reset();
surface_reset_target();
var rem = gpu_get_blendenable();
gpu_set_blendenable(false);
draw_surface(surf_recolour, camerax(), cameray());
gpu_set_blendenable(rem);
