var modifier = 0.95;
if ((global.time % 2) == 0)
    modifier = 1.05;
var x2 = x + lengthdir_x(distance * length * modifier, ray_angle) + lengthdir_x(ray_width * sin(siner), ray_angle + 90);
var y2 = y + lengthdir_y(distance * length * modifier, ray_angle) + lengthdir_y(ray_width * sin(siner), ray_angle + 90);
var x3 = x + lengthdir_x(distance * length * modifier, ray_angle) + lengthdir_x(ray_width * sin(siner), ray_angle - 90);
var y3 = y + lengthdir_y(distance * length * modifier, ray_angle) + lengthdir_y(ray_width * sin(siner), ray_angle - 90);
x22 = x + lengthdir_x(distance * length * modifier * 0.5, ray_angle) + lengthdir_x(ray_width * sin(siner) * 0.5, ray_angle + 90);
y22 = y + lengthdir_y(distance * length * modifier * 0.5, ray_angle) + lengthdir_y(ray_width * sin(siner) * 0.5, ray_angle + 90);
x33 = x + lengthdir_x(distance * length * modifier * 0.5, ray_angle) + lengthdir_x(ray_width * sin(siner) * 0.5, ray_angle - 90);
y33 = y + lengthdir_y(distance * length * modifier * 0.5, ray_angle) + lengthdir_y(ray_width * sin(siner) * 0.5, ray_angle - 90);
if (!surface_exists(my_surface))
    my_surface = surface_create(640, 480);
surface_set_target(my_surface);
draw_clear_alpha(c_black, 0);
draw_triangle_color(x - __view_get(e__VW.XView, 0), y - __view_get(e__VW.YView, 0), x2 - __view_get(e__VW.XView, 0), y2 - __view_get(e__VW.YView, 0), x3 - __view_get(e__VW.XView, 0), y3 - __view_get(e__VW.YView, 0), c_white, 16777215, 16777215, false);
draw_triangle_color(x - __view_get(e__VW.XView, 0), y - __view_get(e__VW.YView, 0), x22 - __view_get(e__VW.XView, 0), y22 - __view_get(e__VW.YView, 0), x33 - __view_get(e__VW.XView, 0), y33 - __view_get(e__VW.YView, 0), c_black, 8421504, 8421504, false);
surface_reset_target();
gpu_set_blendmode(bm_add);
draw_surface(my_surface, __view_get(e__VW.XView, 0), __view_get(e__VW.YView, 0));
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
