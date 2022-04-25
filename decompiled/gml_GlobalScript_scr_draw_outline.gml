scr_draw_outline = function(argument0, argument1, argument2) //gml_Script_scr_draw_outline
{
    gpu_set_fog(true, argument1, 0, 0)
    var __xdirA = argument0
    var __xdirB = 0
    var __ydirA = 0
    var __ydirB = argument0
    if ((image_angle % 90) != 0)
    {
        __xdirA = lengthdir_x(argument0, image_angle)
        __xdirB = lengthdir_x(argument0, (image_angle + 90))
        __ydirA = lengthdir_y(argument0, (image_angle + 90))
        __ydirB = lengthdir_y(argument0, image_angle)
    }
    draw_sprite_ext(sprite_index, image_index, (x + __xdirA), (y + __ydirA), image_xscale, image_yscale, image_angle, c_white, (image_alpha * argument2))
    draw_sprite_ext(sprite_index, image_index, (x - __xdirA), (y - __ydirA), image_xscale, image_yscale, image_angle, c_white, (image_alpha * argument2))
    draw_sprite_ext(sprite_index, image_index, (x + __xdirB), (y + __ydirB), image_xscale, image_yscale, image_angle, c_white, (image_alpha * argument2))
    draw_sprite_ext(sprite_index, image_index, (x - __xdirB), (y - __ydirB), image_xscale, image_yscale, image_angle, c_white, (image_alpha * argument2))
    gpu_set_fog(false, c_white, 0, 0)
    return;
}

