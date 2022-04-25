scr_pan_to_obj = function(argument0, argument1) //gml_Script_scr_pan_to_obj
{
    _panx = (argument0.x - floor(((__view_get((2 << 0), 0) / 2) - (argument0.sprite_width / 2))))
    _pany = (argument0.y - floor(((__view_get((3 << 0), 0) / 2) - (argument0.sprite_height / 2))))
    if (_panx < 0)
        _panx = 0
    if (_panx >= (room_width - __view_get((2 << 0), 0)))
        _panx = (room_width - __view_get((2 << 0), 0))
    if (_pany < 0)
        _pany = 0
    if (_pany >= (room_height - __view_get((3 << 0), 0)))
        _pany = (room_height - __view_get((3 << 0), 0))
    scr_pan_lerp(_panx, _pany, argument1)
    return;
}

