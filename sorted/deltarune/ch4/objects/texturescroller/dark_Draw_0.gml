var _cx = camerax();
var _cy = cameray();
if (!surface_exists(surf_textured))
    surf_textured = surface_create(640, 480);
surface_set_target(surf_textured);
draw_clear_alpha(c_black, 0);
gpu_set_colorwriteenable(true, true, true, false);
draw_sprite_tiled(base_texture, 0, 0, 0);
draw_set_alpha(scr_wave(fade_from, fade_to, fade_time_seconds, 0));
var _timeoffset = current_time * 0.05;
draw_sprite_tiled(base_texture, 1, 0, 0);
draw_sprite_tiled(scroll_texture, 0, -_cx, -_cy - _timeoffset);
draw_set_blend_mode(bm_normal);
draw_set_alpha(1);
gpu_set_colorwriteenable(true, true, true, true);
gpu_set_colorwriteenable(false, false, false, true);
with (tile_object)
    draw_sprite_ext(sprite_index, image_index, x - _cx, y - _cy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
gpu_set_colorwriteenable(true, true, true, true);
surface_reset_target();
draw_surface(surf_textured, _cx, _cy);
