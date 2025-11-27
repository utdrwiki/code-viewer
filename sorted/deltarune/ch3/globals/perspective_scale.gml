function scr_perspective_scale(arg0, arg1, arg2, arg3 = 100)
{
    return scr_perspective_scale_ext(arg0, arg1, arg2, camerax() + (surface_get_width(application_surface) / 2), cameray() + (surface_get_height(application_surface) / 2), arg3);
}

function scr_perspective_scale_ext(arg0, arg1, arg2, arg3, arg4, arg5 = 100)
{
    var _vec3 = new Vector3(arg0, arg1, arg2);
    if (arg2 == 0)
        arg2 = 0.000001;
    if ((arg5 + arg2) == 0 || arg5 == arg2)
        return _vec3;
    _vec3.x = ((arg0 - arg3) * (arg5 / arg2)) + arg3;
    _vec3.y = ((arg1 - arg4) * (arg5 / arg2)) + arg4;
    _vec3.z = arg5 / arg2;
    return _vec3;
}

function scr_perspective_scale_depth(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7 = 10, arg8 = 1)
{
    var _vec3 = new Vector3(arg0, arg1, arg2);
    if ((arg5 + arg2) <= 0)
    {
        if ((arg5 + arg2) == 0)
            _vec3.z = 0;
        else
            _vec3.z = arg5 / arg2;
        return _vec3;
    }
    _vec3.x = ((arg0 - arg3) * (arg5 / arg2)) + arg3;
    _vec3.y = ((arg1 - arg4) * (arg5 / arg2)) + arg4;
    if (arg8 > 1 && (arg5 / arg2) > arg8)
        arg2 = arg5 / arg8;
    depth = arg6 + ((arg5 - arg2) * arg7);
    _vec3.z = arg5 / arg2;
    return _vec3;
}

function draw_self_perspective_scale(arg0)
{
    if (arg0.z <= 0)
        exit;
    draw_sprite_ext(sprite_index, image_index, arg0.x, arg0.y, image_xscale * arg0.z, image_yscale * _position3D.z, image_angle, image_blend, image_alpha);
}
