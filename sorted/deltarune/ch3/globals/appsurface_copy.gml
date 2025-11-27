function scr_appsurface_copy(arg0, arg1, arg2)
{
    surface_set_target(arg0);
    draw_surface(application_surface, arg1, arg2);
    surface_reset_target();
}

function scr_appsurface_copy_part(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
{
    surface_set_target(argument0);
    draw_surface_part(application_surface, arg3, arg4, arg5, arg6, arg1, arg2);
    surface_reset_target();
}
