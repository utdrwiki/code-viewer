var _cam = view_camera[0];
var _camw = camera_get_view_width(_cam);
var _camh = camera_get_view_height(_cam);
if (!surface_exists(motion_blur_surface))
{
    motion_blur_surface = surface_create(_camw, _camh);
    ppfx_effect_set_parameter(ppfx_id, PP_EFFECT.MOTION_BLUR, PP_MOTION_BLUR_TEXTURE, surface_get_texture(motion_blur_surface));
}
surface_set_target(motion_blur_surface);
draw_clear_alpha(c_black, 0);
camera_apply(_cam);
with (obj_mainchara)
{
    visible = false;
    event_perform(ev_draw, ev_draw_normal);
}
surface_reset_target();
