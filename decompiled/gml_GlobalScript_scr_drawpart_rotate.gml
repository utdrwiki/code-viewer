scr_drawpart_rotate = function(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_scr_drawpart_rotate
{
    var __theta = point_direction(sprite_xoffset, sprite_yoffset, argument0, argument1)
    var __radius = point_distance(sprite_xoffset, sprite_yoffset, argument0, argument1)
    __theta += image_angle
    var __xx = (x + lengthdir_x(__radius, __theta))
    var __yy = (y + lengthdir_y(__radius, __theta))
    draw_sprite_general(sprite_index, image_index, argument0, argument1, argument2, argument3, (__xx + argument4), (__yy + argument5), image_xscale, image_yscale, image_angle, image_blend, image_blend, image_blend, image_blend, image_alpha)
    return;
}

