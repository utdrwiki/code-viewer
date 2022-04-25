scr_outside_camera = function(argument0) //gml_Script_scr_outside_camera
{
    _offcamera = 0
    rightx = (x + sprite_width)
    leftx = x
    bottomy = (y + sprite_height)
    topy = y
    if (x > ((__view_get((0 << 0), 0) + __view_get((2 << 0), 0)) + argument0))
        _offcamera = 1
    if (rightx < (__view_get((0 << 0), 0) - argument0))
        _offcamera = 1
    if (y > ((__view_get((1 << 0), 0) + __view_get((3 << 0), 0)) + argument0))
        _offcamera = 1
    if (bottomy < (__view_get((1 << 0), 0) - argument0))
        _offcamera = 1
    return _offcamera;
}

