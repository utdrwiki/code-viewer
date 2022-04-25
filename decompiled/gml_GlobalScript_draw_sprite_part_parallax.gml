draw_sprite_part_parallax = function(argument0, argument1, argument2, argument3, argument4) //gml_Script_draw_sprite_part_parallax
{
    var _mysprite = argument0
    var _mywidth = sprite_get_width(argument0)
    var _myheight = sprite_get_height(argument0)
    var _xoffset = (argument2 % _mywidth)
    var _yoffset = (argument3 % _myheight)
    if (_xoffset < 0)
        _xoffset += _mywidth
    if (_yoffset < 0)
        _yoffset += _myheight
    if (_xoffset == 0 && _yoffset == 0)
        draw_sprite_ext(argument0, argument1, x, y, 2, 2, 0, image_blend, argument4)
    else
    {
        draw_sprite_part_ext(argument0, argument1, 0, 0, (_mywidth - _xoffset), (_myheight - _yoffset), (x + (_xoffset * 2)), (y + (_yoffset * 2)), 2, 2, image_blend, argument4)
        draw_sprite_part_ext(argument0, argument1, (_mywidth - _xoffset), (_myheight - _yoffset), _xoffset, _yoffset, x, y, 2, 2, image_blend, argument4)
        draw_sprite_part_ext(argument0, argument1, 0, (_myheight - _yoffset), (_mywidth - _xoffset), _yoffset, (x + (_xoffset * 2)), y, 2, 2, image_blend, argument4)
        draw_sprite_part_ext(argument0, argument1, (_mywidth - _xoffset), 0, _xoffset, (_myheight - _yoffset), x, (y + (_yoffset * 2)), 2, 2, image_blend, argument4)
    }
    return;
}

