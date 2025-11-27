var _cam = view_camera[0];
var _view_width = camera_get_view_width(_cam);
var _view_height = camera_get_view_height(_cam);
ppfx_draw(application_surface, 0, 0, window_get_width(), window_get_height(), _view_width, _view_height, ppfx_id);
