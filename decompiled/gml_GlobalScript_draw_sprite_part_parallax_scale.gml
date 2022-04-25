draw_sprite_part_parallax_scale = function(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_draw_sprite_part_parallax_scale
{
    var _scale = argument5
    var _mysprite = argument0
    var _mywidth = sprite_get_width(argument0)
    var _myheight = sprite_get_height(argument0)
    var _xoffset = (argument2 % _mywidth)
    var _yoffset = (argument3 % _myheight)
    if (_xoffset < 0)
        _xoffset += _mywidth
    if (_yoffset < 0)
        _yoffset += _myheight
    var _xmax = (_mywidth * (2 / _scale))
    var _ymax = (_myheight * (2 / _scale))
    if (_xoffset == 0 && _yoffset == 0)
        draw_sprite_ext(argument0, argument1, x, y, 2, 2, 0, image_blend, argument4)
    else
    {
        draw_sprite_part_ext(argument0, argument1, 0, 0, (_xmax - _xoffset), (_ymax - _yoffset), (x + (_xoffset * _scale)), (y + (_yoffset * _scale)), _scale, _scale, image_blend, argument4)
        draw_sprite_part_ext(argument0, argument1, (_mywidth - _xoffset), (_myheight - _yoffset), min(_xmax, _xoffset), min(_ymax, _yoffset), x, y, _scale, _scale, image_blend, argument4)
        draw_sprite_part_ext(argument0, argument1, 0, (_ymax - _yoffset), min(_xmax, (_xmax - _xoffset)), min(_ymax, _yoffset), (x + (_xoffset * _scale)), y, _scale, _scale, image_blend, argument4)
        draw_sprite_part_ext(argument0, argument1, (_xmax - _xoffset), 0, min(_xmax, _xoffset), min(_ymax, (_ymax - _yoffset)), x, (y + (_yoffset * _scale)), _scale, _scale, image_blend, argument4)
    }
    return;
}

