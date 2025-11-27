if (!surface_exists(surf))
{
    var _cw = camera_get_view_width(view_camera[0]);
    var _ch = camera_get_view_height(view_camera[0]);
    surf = surface_create(_cw, _ch);
    surface_set_target(surf);
    draw_set_colour(c_black);
    draw_set_alpha(0);
    ossafe_fill_rectangle(0, 0, _cw, _cw, false);
    surface_reset_target();
}
else if (surface_exists(surf))
{
    var _cw = 640;
    var _ch = 480;
    var _cx = camerax();
    var _cy = cameray();
    surface_set_target(surf);
    draw_set_color(c_black);
    draw_set_alpha(darknesslevel);
    ossafe_fill_rectangle(0, 0, _cw, _ch, 0);
    gpu_set_blendmode(bm_subtract);
    with (obj_light_parent)
        draw_sprite_ext(sprite_index, image_index, x - _cx, y - _cy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    gpu_set_blendmode(bm_normal);
    draw_set_alpha(1);
    surface_reset_target();
    draw_surface(surf, _cx, _cy);
}
