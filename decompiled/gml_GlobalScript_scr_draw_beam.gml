scr_draw_beam = function(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) //gml_Script_scr_draw_beam
{
    var __xx = argument0
    var __yy = argument1
    var _end0 = scr_rotatevector(argument2, 0, argument4)
    _end0.x += __xx
    _end0.y += __yy
    var _end1 = scr_rotatevector(argument2, 0, (argument4 + (argument3 / 2)))
    _end1.x += __xx
    _end1.y += __yy
    var _end2 = scr_rotatevector(argument2, 0, (argument4 - (argument3 / 2)))
    _end2.x += __xx
    _end2.y += __yy
    draw_set_color(argument5)
    draw_set_alpha(argument6)
    if argument7
        draw_circle(_end0.x, _end0.y, (argument3 / 2), 0)
    draw_triangle(__xx, __yy, _end1.x, _end1.y, _end2.x, _end2.y, 0)
    return;
}

