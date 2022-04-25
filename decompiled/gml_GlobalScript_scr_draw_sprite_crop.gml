scr_draw_sprite_crop = function(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) //gml_Script_scr_draw_sprite_crop
{
    var _sprite_xoffset = sprite_get_xoffset(argument0)
    var _sprite_yoffset = sprite_get_yoffset(argument0)
    var _sprite_width = sprite_get_width(argument0)
    var _sprite_height = sprite_get_height(argument0)
    var _true_xanchor = (x - abs(sprite_xoffset))
    var _true_yanchor = (y - abs(sprite_yoffset))
    if (_true_xanchor > argument2 && (_true_xanchor + _sprite_width) < argument4 && _true_yanchor > argument3 && (_true_yanchor + _sprite_height) < argument5)
    {
        draw_self()
        return;
    }
    var _leftcrop = clamp((argument2 - _true_xanchor), 0, abs(_sprite_width))
    var _topcrop = clamp((argument3 - _true_yanchor), 0, abs(_sprite_height))
    var _rightcrop = clamp((argument4 - _true_xanchor), 0, abs(_sprite_width))
    var _bottomcrop = clamp((argument5 - _true_yanchor), 0, abs(_sprite_height))
    draw_sprite_part(argument0, argument1, _leftcrop, _topcrop, _rightcrop, _bottomcrop, ((argument6 - _sprite_xoffset) + _leftcrop), ((argument7 - _sprite_yoffset) + _topcrop))
    return;
}

