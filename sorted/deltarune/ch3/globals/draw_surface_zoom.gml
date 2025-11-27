function scr_draw_surface_zoom(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9 = true)
{
    arg1 -= camerax();
    arg2 -= cameray();
    if (arg9)
    {
        arg1 = clamp(arg1, 320 / arg3, 640 - (320 / arg4));
        arg2 = clamp(arg2, 240 / arg3, 480 - (240 / arg4));
    }
    arg1 = lerp(0, arg1 - (320 / arg3), arg5);
    arg2 = lerp(0, arg2 - (240 / arg4), arg5);
    var __finalxscale = lerp(640, 640 / arg3, arg5);
    var __finalyscale = lerp(480, 480 / arg3, arg5);
    draw_surface_general(arg0, arg1, arg2, __finalxscale, __finalyscale, camerax(), cameray(), 640 / __finalxscale, 480 / __finalyscale, arg6, arg7, arg7, arg7, arg7, arg8);
}
