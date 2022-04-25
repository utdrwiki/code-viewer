scr_draw_outline_ext = function(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) //gml_Script_scr_draw_outline_ext
{
    gpu_set_fog(true, argument7, 0, 0)
    var __xdirA = argument9
    var __xdirB = 0
    var __ydirA = 0
    var __ydirB = argument9
    if ((argument6 % 90) != 0)
    {
        __xdirA = lengthdir_x(argument9, argument6)
        __xdirB = lengthdir_x(argument9, (argument6 + 90))
        __ydirA = lengthdir_y(argument9, (argument6 + 90))
        __ydirB = lengthdir_y(argument9, argument6)
    }
    draw_sprite_ext(argument0, argument1, (argument2 + __xdirA), (argument3 + __ydirA), argument4, argument5, argument6, c_white, argument8)
    draw_sprite_ext(argument0, argument1, (argument2 - __xdirA), (argument3 - __ydirA), argument4, argument5, argument6, c_white, argument8)
    draw_sprite_ext(argument0, argument1, (argument2 + __xdirB), (argument3 + __ydirB), argument4, argument5, argument6, c_white, argument8)
    draw_sprite_ext(argument0, argument1, (argument2 - __xdirB), (argument3 - __ydirB), argument4, argument5, argument6, c_white, argument8)
    gpu_set_fog(false, c_white, 0, 0)
    return;
}

