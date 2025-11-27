if (surface_effect == -1 || !surface_exists(surface_effect))
    surface_effect = surface_create((scr_get_box(0) - scr_get_box(2)) + 8, scr_get_box(3) - scr_get_box(1) - 8);
var _shaftdir = point_direction(x, y, swingpoint_x, swingpoint_y);
var _sx = -(scr_get_box(2) + 5);
var _sy = -(scr_get_box(1) + 5);
surface_set_target(surface_effect);
draw_clear_alpha(c_black, 0);
draw_set_color(#777777);
draw_rectangle_pos(_sx + x + lengthdir_x(3, _shaftdir - 90), _sy + y + lengthdir_y(3, _shaftdir - 90), _sx + x + lengthdir_x(3, _shaftdir + 90), _sy + y + lengthdir_y(3, _shaftdir + 90), _sx + swingpoint_x + lengthdir_x(3, _shaftdir + 90), _sy + swingpoint_y + lengthdir_y(3, _shaftdir + 90), _sx + swingpoint_x + lengthdir_x(3, _shaftdir - 90), _sy + swingpoint_y + lengthdir_y(3, _shaftdir - 90));
draw_set_color(c_white);
surface_reset_target();
draw_surface(surface_effect, -_sx, -_sy);
draw_self();
