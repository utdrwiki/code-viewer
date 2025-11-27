functionalfun = lerp(functionalfun, fun, funspeed);
functionalfun = clamp01(functionalfun);
var ver = 1;
if (scr_debug())
{
    if (keyboard_check(ord("K")))
        ver = 0;
    if (keyboard_check_pressed(ord("B")))
        hope = !hope;
}
if (hope)
{
    hope_anim += 1;
    if (hope_flower_active)
        hope_flower_anim = scr_movetowards(hope_flower_anim, 34, 1);
}
var funometersprite = 1218;
if (ver == 1)
    funometersprite = scr_84_get_sprite("spr_dw_tv_funometer_base_2x");
if (cracked)
    draw_sprite_ext(funometersprite, 2, x, y, 1, 1, image_angle, image_blend, image_alpha);
else if (hope)
    draw_sprite_ext(spr_hopeometer_bar, hope_anim, x, y, 2, 2, image_angle, image_blend, image_alpha);
else
    draw_sprite_ext(funometersprite, 0, x, y, 1, 1, image_angle, image_blend, image_alpha);
if (cracked)
{
    draw_sprite_ext(funometersprite, 3, x, y, 1, 1, image_angle, image_blend, image_alpha);
}
else if (hope)
{
    draw_sprite_ext(spr_hopeometer_hope, hope_anim, x - 14, y + 170, image_xscale * 2, image_yscale * 2, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_hopeometer_flowers, hope_flower_anim, x - 14, y + 170, 2, 2, image_angle, image_blend, image_alpha);
}
else
{
    draw_sprite_ext(funometersprite, 1, x, y, 1, 1, image_angle, image_blend, image_alpha);
}
var intensity = scr_inverselerp(empty, full, functionalfun);
intensity = clamp01(intensity);
var amount = lerp(0.2, 0.85, intensity) * sprite_height;
var slide_amount = round_to_multiple(lerp(0.65, 0, intensity) * sprite_height, 2);
var _sine = sin(siner / 10);
var _siner = sin(siner / 15);
var meter_color = 16777215;
if (intensity <= 0.2)
    hue = remap_clamped(0.08, 0.2, 1/3, 0, intensity);
else
    hue = 0;
if (intensity >= 0.9)
    rainbow = round_to_multiple(scr_loop_ext(rainbow + remap_clamped(0.9, 1, 0, 0.1, intensity), -0.5, 0.5), 1/30);
if (intensity < 0.9 && rainbow != 0)
    rainbow = scr_movetowards(rainbow, 0, 0.05);
var alt_sprindex = 2217;
if (cracked)
{
    var _offset = 3;
    var _offset_y = 4;
    if (ver == 0)
        draw_sprite_ext(sprite_index, 4, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
    if (ver == 1)
        draw_sprite_ext(alt_sprindex, 4, x + _offset, y + _offset_y, image_xscale * 2, image_yscale * 2, image_angle, c_white, image_alpha);
    exit;
}
else
{
    var _barx = lengthdir_x(slide_amount, image_angle - 90);
    var _bary = lengthdir_y(slide_amount, image_angle - 90);
    var _offset = 4;
    var _offset_y = 4;
    if (hope)
    {
        _offset = 23;
        _offset_y = 22;
    }
    if (ver == 0)
        draw_sprite_ext(sprite_index, 3, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
    if (ver == 1)
        draw_sprite_ext(alt_sprindex, 3, x + _offset, y + _offset_y, image_xscale * 2, image_yscale * 2, image_angle, c_white, image_alpha);
    shader_set(shd_rgb_yiq_shift);
    shader_set_uniform_f(shader_get_uniform(shd_rgb_yiq_shift, "shift"), (hue + rainbow) * 2 * pi);
    if (ver == 0)
        draw_sprite_ext(sprite_index, 2, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
    if (ver == 1)
        draw_sprite_ext(alt_sprindex, 2, x + _offset, y + _offset_y, image_xscale * 2, image_yscale * 2, image_angle, c_white, image_alpha);
    if (ver == 0)
        draw_sprite_part_ext_rot(4915, timer, 0, 0, sprite_width, amount, x + _barx, y + _bary, image_xscale, image_yscale, image_angle, meter_color, image_alpha);
    if (ver == 1)
        draw_sprite_part_ext_rot(85, timer, 0, 0, sprite_width, amount, x + _barx + _offset, y + _bary + _offset_y, image_xscale * 2, image_yscale * 2, image_angle, meter_color, image_alpha);
    if (ver == 0)
        draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
    if (ver == 1)
        draw_sprite_ext(alt_sprindex, 1, x + _offset, y + _offset_y, image_xscale * 2, image_yscale * 2, image_angle, c_white, image_alpha);
    shader_reset();
    if (ver == 0)
        draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
    if (ver == 1)
        draw_sprite_ext(alt_sprindex, 0, x + _offset, y + _offset_y, image_xscale * 2, image_yscale * 2, image_angle, c_white, image_alpha);
}
if (scr_debug())
{
    if (keyboard_check(ord("1")))
        fun = empty;
    if (keyboard_check(ord("2")))
        fun = half;
    if (keyboard_check(ord("3")))
        fun = full;
}
if (intensity >= 0.9)
{
    if (shakecon <= 0)
    {
        xstart = x;
        ystart = y;
        shakecon = 1;
    }
    var _force = remap_clamped(0.9, 1, 0, 1, intensity);
    var _dir = random_range(-180, 180);
    var _len = random_range(0, 2) * _force;
    var _v2 = scr_get_sprite_point(id);
    x = xstart;
    y = ystart;
    direction = 0;
    scr_rotatearoundpoint(_v2.x, _v2.y, random_range(-2, 2) * _force);
    image_angle = direction;
    x += lengthdir_x(_len, _dir);
    y += lengthdir_y(_len, _dir);
}
if (intensity < 0.9 && shakecon > 0)
{
    x = xstart;
    y = ystart;
    image_angle = 0;
    shakecon = 0;
}
siner += sqr(intensity * 4);
timer += remap_clamped(0.08, 0.2, 0.2, 1, intensity);
