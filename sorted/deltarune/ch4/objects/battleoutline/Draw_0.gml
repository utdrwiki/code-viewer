if (!surface_exists(surf))
    surf = surface_create(sprite_width + buffer, sprite_height + buffer);
if (sprite_width != surface_get_width(surf) || sprite_height != surface_get_height(surf))
    surface_resize(surf, sprite_width + buffer, sprite_height + buffer);
if (i_ex(target))
{
    sprite_index = target.sprite_index;
    image_index = target.image_index;
    image_xscale = target.image_xscale;
    image_yscale = target.image_yscale;
    x = target.x;
    y = target.y;
}
if (image_alpha > 0)
{
    surface_set_target(surf);
    draw_clear_alpha(c_red, 0);
    var _half = buffer * 0.5;
    gpu_set_colorwriteenable(false, false, false, true);
    draw_sprite_ext(sprite_index, image_index, _half, _half - image_yscale, image_xscale, image_yscale, 0, c_white, 1);
    draw_sprite_ext(sprite_index, image_index, _half + image_xscale, _half, image_xscale, image_yscale, 0, c_white, 1);
    draw_sprite_ext(sprite_index, image_index, _half - image_xscale, _half, image_xscale, image_yscale, 0, c_white, 1);
    draw_sprite_ext(sprite_index, image_index, _half, _half + image_yscale, image_xscale, image_yscale, 0, c_white, 1);
    gpu_set_fog(true, #202020, 0, 1);
    gpu_set_colorwriteenable(true, true, true, true);
    draw_sprite_ext(sprite_index, image_index, _half, _half, image_xscale, image_yscale, 0, c_white, 1);
    gpu_set_fog(false, c_black, 0, 0);
    surface_reset_target();
    draw_surface_ext(surf, x - _half, y - _half, 1, 1, 0, c_white, image_alpha);
}
