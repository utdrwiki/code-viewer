if (!surface_exists(my_surface))
    my_surface = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
var modifier = 1;
surface_set_target(my_surface);
draw_clear_alpha(c_black, 0);
draw_circle_color(x - __view_get(e__VW.XView, 0), y - __view_get(e__VW.YView, 0), radius * modifier, c_black, c_black, false);
gpu_set_colorwriteenable(true, true, true, false);
draw_sprite_tiled(spr_knight_bullet_flow, 0, global.time * 8, 0);
gpu_set_colorwriteenable(true, true, true, true);
surface_reset_target();
var color = make_color_hsv(hsv, 255, 255);
gpu_set_blendmode(bm_add);
repeat (4)
    draw_surface_ext(my_surface, __view_get(e__VW.XView, 0), __view_get(e__VW.YView, 0), 1, 1, 0, color, alpha);
draw_set_alpha(alpha);
draw_circle_color(x, y, radius * modifier, c_white, c_white, false);
draw_set_alpha(1);
gpu_set_blendmode(bm_normal);

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
