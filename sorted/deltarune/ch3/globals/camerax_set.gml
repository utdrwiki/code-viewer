function camerax_set(arg0)
{
    var __xpos = arg0;
    var __ypos = camera_get_view_y(view_camera[0]);
    camera_set_view_pos(view_camera[0], __xpos, __ypos);
}
