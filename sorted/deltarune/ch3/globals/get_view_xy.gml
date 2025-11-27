function get_view_xy(arg0)
{
    vx = camera_get_view_x(view_camera[arg0]);
    vy = camera_get_view_y(view_camera[arg0]);
    vw = camera_get_view_width(view_camera[arg0]);
    vh = camera_get_view_height(view_camera[arg0]);
}
