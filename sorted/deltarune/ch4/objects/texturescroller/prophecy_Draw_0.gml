var _cx = camerax();
var _cy = cameray();
if (!surface_exists(surf_textured))
    surf_textured = surface_create(640, 480);
surface_set_target(surf_textured);
draw_clear_alpha(c_white, 0);
gpu_set_colorwriteenable(true, true, true, false);
tick += ((1/15) * scroll_speed);
draw_sprite_tiled_ext(IMAGE_DEPTH_EXTEND_MONO_SEAMLESS_BRIGHTER, 0, -((_cx * 2) + (tick * 15)) * 0.5, -((_cy * 2) + (tick * 15)) * 0.5, 2, 2, #42D0FF, 1);
draw_set_blend_mode(bm_add);
draw_sprite_tiled_ext(spr_perlin_noise_looping, 0, -((_cx * 2) + (tick * 15)) * 0.5, -((_cy * 2) + (tick * 15)) * 0.5, 2, 2, #42D0FF, scr_wave(0, 0.4, 4, 0));
draw_set_blend_mode(bm_normal);
gpu_set_colorwriteenable(true, true, true, true);
gpu_set_colorwriteenable(false, false, false, true);
with (tile_object)
{
    if (other.intro_mode)
    {
        var _amt = sin((other.tick / 15) * (2 * pi)) * other.scroll_speed * 6;
        draw_sprite_ext(sprite_index, image_index, x - _cx - _amt, y - _cy - _amt, image_xscale, image_yscale, image_angle, image_blend, image_alpha * 0.4);
        draw_sprite_ext(sprite_index, image_index, (x - _cx) + _amt, (y - _cy) + _amt, image_xscale, image_yscale, image_angle, image_blend, image_alpha * 0.4);
    }
    draw_sprite_ext(sprite_index, image_index, x - _cx, y - _cy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
gpu_set_colorwriteenable(true, true, true, true);
surface_reset_target();
draw_set_alpha(image_alpha);
draw_surface(surf_textured, _cx, _cy);
draw_set_alpha(1);
