function draw_surface_pivot(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
{
    var _newx = scr_orbitx(arg3, arg4, arg1, arg2);
    var _newy = scr_orbity(arg3, arg4, arg1, arg2);
    draw_surface_ext(arg0, _newx, _newy, arg5, arg6, arg7, arg8, arg9);
}
