scr_pan_to_obj_old = function(argument0, argument1) //gml_Script_scr_pan_to_obj_old
{
    _wd = (argument0.x - floor(((__view_get((2 << 0), 0) / 2) - (argument0.sprite_width / 2))))
    _ht = (argument0.y - floor(((__view_get((3 << 0), 0) / 2) - (argument0.sprite_height / 2))))
    _vx = _wd
    _vy = _ht
    if (_vx < 0)
        _vx = 0
    if (_vx > (room_width - _vx))
        _vx = (room_width - _vx)
    if (_vy < 0)
        _vy = 0
    if (_vy > (room_height - __view_get((3 << 0), 0)))
        _vy = (room_height - __view_get((3 << 0), 0))
    scr_pan(((_vx - __view_get((0 << 0), 0)) / argument1), ((_vy - __view_get((1 << 0), 0)) / argument1), argument1)
    return;
}

