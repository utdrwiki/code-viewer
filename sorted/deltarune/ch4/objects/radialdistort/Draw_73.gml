var _cx = camerax();
var _cy = cameray();
if (!surface_exists(surf_distort))
    surf_distort = surface_create(640, 480);
if (!surface_exists(surf_capture))
{
    surf_capture = surface_create(640, 480);
    surface_set_target(surf_capture);
    gpu_set_blendenable(false);
    draw_surface(application_surface, 0, 0);
    gpu_set_blendenable(true);
    surface_reset_target();
}
surface_set_target(surf_distort);
gpu_set_blendenable(false);
draw_clear_alpha(c_black, 0);
shader_set(shd_distortiondonut);
shader_set_uniform_f(u_distort_pos, x - _cx, y - _cy);
shader_set_uniform_f(u_time, time_percent * 640);
shader_set_uniform_f(u_donut, ring_start, ring_width, ring_strength);
draw_surface(surf_capture, 0, 0);
shader_reset();
gpu_set_blendenable(true);
surface_reset_target();
draw_set_alpha(alpha);
draw_surface(surf_distort, _cx, _cy);
draw_set_alpha(1);
