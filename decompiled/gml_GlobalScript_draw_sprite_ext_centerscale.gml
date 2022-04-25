draw_sprite_ext_centerscale = function(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) //gml_Script_draw_sprite_ext_centerscale
{
    var _xoff = (sprite_get_xoffset(argument0) * image_xscale)
    var _yoff = (sprite_get_yoffset(argument0) * image_yscale)
    var _sprite_width = (sprite_get_width(argument0) * image_xscale)
    var _sprite_height = (sprite_get_width(argument0) * image_yscale)
    draw_sprite_ext(argument0, argument1, (argument2 - (((_sprite_width - _xoff) * (argument4 - image_xscale)) / 2)), (argument3 - (((_sprite_height - _yoff) * (argument5 - image_yscale)) / 2)), argument4, argument5, argument6, argument7, argument8)
    return;
}

