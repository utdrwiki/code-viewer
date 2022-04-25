scr_drawpart_rotate_ext = function(argument0, argument1, argument2, argument3) //gml_Script_scr_drawpart_rotate_ext
{
    var __theta = point_direction(sprite_xoffset, sprite_yoffset, argument2, argument3)
    var __radius = point_distance(sprite_xoffset, sprite_yoffset, argument2, argument3)
    __theta += image_angle
    var __xx = (x + lengthdir_x(__radius, __theta))
    var __yy = (y + lengthdir_y(__radius, __theta))
    draw_sprite_general(argument0, argument1, argument2, argument3, argument2, argument3, __xx, __yy, image_xscale, image_yscale, image_angle, image_blend, image_blend, image_blend, image_blend, image_alpha)
    return;
}

