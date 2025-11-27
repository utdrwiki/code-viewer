if (!surface_exists(ballsurface))
    ballsurface = surface_create(320, 240);
if (!surface_exists(ballsurface2))
    ballsurface2 = surface_create(320, 240);
if (!stopemitting && i_ex(obj_titan_enemy))
{
    if (obj_titan_enemy.rumble == false && random_range(0, 1) < (0.2 * obj_titan_enemy.phase))
        part_emitter_burst(bs, bemitter, btballs, 1);
    else if (obj_titan_enemy.rumble)
        stopemitting = true;
}
var cx = camerax();
var cy = cameray();
draw_set_alpha(1);
surface_set_target(ballsurface);
draw_clear_alpha(c_black, 0);
part_system_drawit(bs);
surface_reset_target();
shader_set(shd_outline);
shader_set_uniform_f(outlineColor, 0.25, 0.25, 0.25, 1);
shader_set_uniform_f(outlineW, 0.00625, 1/120);
surface_set_target(ballsurface2);
draw_clear_alpha(c_black, 0);
draw_surface(ballsurface, 0, 0);
shader_reset();
surface_reset_target();
draw_surface_stretched(ballsurface2, cx, cy, 640, 480);
