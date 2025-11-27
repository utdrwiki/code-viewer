if (!surface_exists(ballsurface))
    ballsurface = surface_create(640, 640);
surface_set_target(ballsurface);
draw_clear_alpha(c_black, 0);
var cx = camerax();
var cy = cameray();
part_system_drawit(bs);
surface_reset_target();
shader_set(shd_outline);
shader_set_uniform_f(outlineColor, 1, 1, 1, 1);
shader_set_uniform_f(outlineW, 0.0015625, 0.0015625);
draw_surface(ballsurface, cx, y - 500);
shader_reset();
part_system_drawit(ps);
