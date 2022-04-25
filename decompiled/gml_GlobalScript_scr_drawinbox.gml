scr_drawinbox = function(argument0, argument1, argument2, argument3) //gml_Script_scr_drawinbox
{
    var _boxleft = (argument0 - (argument2 / 2))
    var _boxtop = (argument1 - (argument3 / 2))
    var _xx = ((_boxleft - (x - sprite_xoffset)) + 1)
    var _yy = ((_boxtop - (y - sprite_yoffset)) + 1)
    draw_sprite_part_ext(sprite_index, image_index, _xx, _yy, argument2, argument3, (_boxleft + 1), (_boxtop + 1), sign(image_xscale), sign(image_yscale), image_blend, image_alpha)
    return;
}

