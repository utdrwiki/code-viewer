function cameray_set(arg0)
{
    var __xpos = camera_get_view_x(view_camera[0]);
    var __ypos = arg0;
    camera_set_view_pos(view_camera[0], __xpos, __ypos);
}
