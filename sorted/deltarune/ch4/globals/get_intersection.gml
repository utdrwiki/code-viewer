function scr_get_intersection(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
{
    var ua = 0;
    var ux = arg2 - arg0;
    var uy = arg3 - arg1;
    var vx = arg6 - arg4;
    var vy = arg7 - arg5;
    var wx = arg0 - arg4;
    var wy = arg1 - arg5;
    var ud = (vy * ux) - (vx * uy);
    if (ud != 0)
    {
        ua = ((vx * wy) - (vy * wx)) / ud;
        if (arg8)
        {
            var ub = ((ux * wy) - (uy * wx)) / ud;
            if (ua < 0 || ua > 1 || ub < 0 || ub > 1)
                ua = 0;
        }
    }
    return ua;
}

function scr_get_intersection_v2(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
{
    var _vecmul = scr_get_intersection(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
    var _vec2 = new Vector2(arg0, arg1);
    var _vecAdd = new Vector2(arg2 - arg0, arg3 - arg1).normalized * _vecmul;
    _vec2.x += _vecAdd.x;
    _vec2.y += _vecAdd.y;
    return _vec2;
}
