if (con == 4)
{
    var _scale = (image_yscale + image_xscale) / 2;
    draw_sprite_ext(spr_thrash_missile_explosion, timer, x, y, _scale, _scale, image_angle - 90, c_red, 1);
    exit;
}
draw_set_blend_mode(bm_add);
drawtimer++;
var _glow = scr_pingpong(drawtimer, 2) / 4;
var _glowcol = 16777215;
if (con >= 1)
{
    if (con > 1)
        _glowcol = 255;
    else
        _glowcol = merge_color(c_white, c_red, timer / 10);
}
scr_draw_outline(image_xscale, _glowcol, _glow * image_alpha);
if (con > 0)
    draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, outline, image_alpha);
draw_set_blend_mode(bm_normal);
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (difficulty < 2)
{
    image_alpha = clamp01(remap(lifetime - 15, lifetime, 1, 0, drawtimer));
    if (image_alpha < 1)
        active = false;
    if (image_alpha == 0)
        instance_destroy();
}
