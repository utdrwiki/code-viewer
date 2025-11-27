function scr_draw_zoom_cam(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8 = true)
{
    if (arg0.init < 2)
        exit;
    var __camsize = arg0.size;
    if (arg8)
    {
        arg1 -= (arg3 / 2);
        arg2 -= (arg4 / 2);
    }
    var __finalxscale = arg3 / __camsize.x;
    var __finalyscale = arg4 / __camsize.y;
    draw_surface_ext(arg0.cam_surf, arg1, arg2, __finalxscale, __finalyscale, arg5, arg6, arg7);
}
