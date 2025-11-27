if (!source)
    exit;
image_blend = merge_color(c_black, c_white, image_alpha);
if (surface_exists(subSurf) && source.sprite_index != sprite_index)
    surface_resize(subSurf, source.sprite_width, source.sprite_height);
sprite_index = source.sprite_index;
image_index = source.image_index;
image_xscale = source.image_xscale;
image_yscale = source.image_yscale;
gpu_set_blendmode(bm_normal);
draw_sprite_ext(sprite_index, image_index, screenx(), screeny(), image_xscale, image_yscale, image_angle, c_white, 1);
if (!surface_exists(subSurf))
    subSurf = surface_create(sprite_width + 4, sprite_height + 4);
surface_set_target(subSurf);
draw_clear_alpha(c_black, 0);
d3d_set_fog(true, scr_get_outline_color(source), 0, 1);
draw_sprite_ext(sprite_index, image_index, sprite_xoffset, sprite_yoffset, image_xscale, image_yscale, image_angle, c_black, 1);
d3d_set_fog(false, c_black, 0, 0);
var _floorpos = (y + sprite_height) - 2 - (sprite_yoffset * 2);
gpu_set_blendmode(bm_normal);
draw_sprite_ext(sprite_index, image_index, sprite_xoffset, sprite_yoffset + 2, image_xscale, image_yscale, image_angle, c_black, 1);
image_alpha = 1;
draw_set_blend_mode(bm_subtract);
with (obj_darkness_window_light)
{
    if (!relative)
    {
        draw_self();
    }
    else
    {
        var _yoff = y + (yoff * image_yscale);
        draw_sprite_ext(sprite_index, image_index, x - other.x, (y + ((_floorpos - _yoff) * 2)) - other.y, image_xscale, image_yscale, image_angle, c_black, 1);
    }
}
with (obj_darkness_floorArea_light)
    draw_sprite_ext(sprite_index, image_index, x - other.x, y - other.y, image_xscale, image_yscale, image_angle, c_black, 1);
gpu_set_blendmode(bm_normal);
surface_reset_target();
draw_surface(subSurf, screenx(x - sprite_xoffset), screeny(y - sprite_yoffset));
