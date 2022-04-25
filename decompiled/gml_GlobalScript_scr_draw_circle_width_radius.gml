scr_draw_circle_width_radius = function(argument0, argument1, argument2, argument3, argument4) //gml_Script_scr_draw_circle_width_radius
{
    var xx = argument0
    var yy = argument1
    var radius = argument2
    var inner_radius = max(argument3, 0)
    var steps = argument4
    draw_primitive_begin(4)
    for (i = 0; i < steps; i += 1)
    {
        draw_vertex((xx + lengthdir_x(inner_radius, ((360 * i) / steps))), (yy + lengthdir_y(inner_radius, ((360 * i) / steps))))
        draw_vertex((xx + lengthdir_x(radius, ((360 * i) / steps))), (yy + lengthdir_y(radius, ((360 * i) / steps))))
        draw_vertex((xx + lengthdir_x(radius, ((360 * (i + 1)) / steps))), (yy + lengthdir_y(radius, ((360 * (i + 1)) / steps))))
        draw_vertex((xx + lengthdir_x(radius, ((360 * (i + 1)) / steps))), (yy + lengthdir_y(radius, ((360 * (i + 1)) / steps))))
        draw_vertex((xx + lengthdir_x(inner_radius, ((360 * (i + 1)) / steps))), (yy + lengthdir_y(inner_radius, ((360 * (i + 1)) / steps))))
        draw_vertex((xx + lengthdir_x(inner_radius, ((360 * i) / steps))), (yy + lengthdir_y(inner_radius, ((360 * i) / steps))))
    }
    draw_primitive_end()
    return;
}

