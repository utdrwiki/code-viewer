var _cx = camerax();
var _cy = cameray();
var _t = time_seconds;
if (!surface_exists(surf_frontprophecies))
    surf_frontprophecies = surface_create(surf_width, surf_height);
if (!surface_exists(surf_parallax_close))
    surf_parallax_close = surface_create(surf_width * 0.5, surf_height * 0.5);
if (!surface_exists(surf_parallax_stars))
    MakeStarfield();
surface_set_target(surf_frontprophecies);
draw_clear_alpha(c_black, 0);
gpu_set_colorwriteenable(true, true, true, false);
draw_sprite_tiled_ext(sprite_blueswirly, 0, -(_cx + (_t * 15)) * 0.5, -(_cy + (_t * 15)) * 0.5, 1, 1, colour_bluenonsense, 1);
draw_set_blend_mode(bm_add);
draw_sprite_tiled_ext(spr_perlin_noise_looping, 0, -(_cx + (_t * 15)) * 0.5, -(_cy + (_t * 15)) * 0.5, 1, 1, colour_bluenonsense, scr_wave(0, 0.4, 4, 0));
draw_set_blend_mode(bm_normal);
gpu_set_colorwriteenable(true, true, true, true);
gpu_set_colorwriteenable(false, false, false, true);
draw_set_blend_mode(bm_add);
for (var i = 0; i < 3; i++)
{
    with (obj_prophecy_mask)
    {
        if (lay == i)
        {
            x = floor(xstart + layer_get_x(layer));
            y = floor(ystart + layer_get_y(layer));
            if (x > (_cx - 200) && x < (_cx + 640 + 200) && y > (_cy - 200) && y < (_cy + 480 + 200))
            {
                var _tt = (_t * 1.25) + local_offset;
                var _relative_x = x - _cx;
                var _relative_y = y - _cy;
                var _xx = _relative_x;
                var _yy = _relative_y + (sin(_tt * pi) * 5);
                var _offset = 0;
                draw_sprite_ext(sprite_index, image_index, floor((_xx + _offset) * 0.5), floor((_yy + _offset) * 0.5), image_xscale, image_yscale, 0, image_blend, 1 - (lay * 0.15));
            }
        }
    }
}
draw_set_blend_mode(bm_normal);
gpu_set_colorwriteenable(true, true, true, true);
surface_reset_target();
draw_surface_tiled_ext(surf_parallax_stars, _cx * 0.9, _cy * 0.9, 2, 2, 16777215, 1);
draw_surface_stretched(surf_frontprophecies, _cx, _cy, 640, 480);
