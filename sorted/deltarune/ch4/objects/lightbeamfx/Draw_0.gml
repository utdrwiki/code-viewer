if (!surface_exists(surfmask))
    surfmask = surface_create(640, 480);
surface_set_target(surfmask);
draw_clear_alpha(c_white, 1);
gpu_set_blendmode(bm_subtract);
with (obj_light_area_mask)
{
    if (dustparticles_on)
    {
        var _xx = screenx();
        var _yy = screeny();
        draw_sprite_ext(sprite_index, image_index, _xx, _yy, image_xscale, image_yscale, image_angle, c_white, 1);
    }
}
gpu_set_blendmode(bm_normal);
surface_reset_target();
if (!surface_exists(surfdust))
    surfdust = surface_create(640, 480);
if (!surface_exists(surfdust_tiled))
    surfdust_tiled = surface_create(640, 480);
surface_set_target(surfdust);
draw_clear_alpha(c_black, 0);
part_system_drawit(ps);
surface_reset_target();
surface_set_target(surfdust_tiled);
draw_clear_alpha(c_black, 0);
draw_surface_tiled(surfdust, -camera_get_view_x(view_camera[0]), -camera_get_view_y(view_camera[0]));
gpu_set_blendmode(bm_subtract);
draw_surface(surfmask, 0, 0);
gpu_set_blendmode(bm_normal);
surface_reset_target();
draw_set_alpha(image_alpha);
draw_surface(surfdust_tiled, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));
draw_set_alpha(1);
