var _boxleft, _boxtop, _yy, _xx;
scr_drawinbox_ext = function(argument0, argument1, argument2, argument3) //gml_Script_scr_drawinbox_ext
{
    _minx = (argument0 - (argument2 / 2))
    _miny = (argument1 - (argument3 / 2))
    _maxx = ((_boxleft - (x - sprite_xoffset)) + 1)
    _maxy = ((_boxtop - (y - sprite_yoffset)) + 1)
    draw_sprite_part_ext(sprite_index, image_index, _xx, _yy, argument2, argument3, (_boxleft + 1), (_boxtop + 1), sign(image_xscale), sign(image_yscale), image_blend, image_alpha)
    return;
}

