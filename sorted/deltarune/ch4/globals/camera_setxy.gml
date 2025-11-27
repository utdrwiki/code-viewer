function camera_setxy(arg0 = -4, arg1 = -4)
{
    if (arg0 == -4)
        arg0 = camera_get_view_x(view_camera[0]);
    if (arg1 == -4)
        arg1 = camera_get_view_y(view_camera[0]);
    camera_set_view_pos(view_camera[0], arg0, arg1);
}
