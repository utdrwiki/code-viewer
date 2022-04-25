draw_sprite_center_pivot = function(argument0, argument1, argument2, argument3) //gml_Script_draw_sprite_center_pivot
{
    var __theta = point_direction((sprite_width / 2), (sprite_height / 2), 0, 0)
    var __radius = point_distance((sprite_width / 2), (sprite_height / 2), 0, 0)
    __theta += image_angle
    var __xx = ((argument2 + (sprite_width / 2)) + lengthdir_x(__radius, __theta))
    var __yy = ((argument3 + (sprite_height / 2)) + lengthdir_y(__radius, __theta))
    draw_sprite_ext(argument0, argument1, __xx, __yy, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
    return;
}

