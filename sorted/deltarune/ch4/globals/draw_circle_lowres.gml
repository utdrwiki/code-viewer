function scr_draw_circle_lowres(arg0, arg1, arg2, arg3, arg4 = false)
{
    if (!instance_exists(obj_lowres_circle_manager))
        instance_create_depth(0, 0, 0, obj_lowres_circle_manager);
    with (obj_lowres_circle_manager)
        draw_func(arg0, arg1, arg2, arg3, arg4);
}
