functionalfun = lerp(functionalfun, fun, funspeed);
functionalfun = clamp01(functionalfun);
if (!hope)
    draw_sprite_ext(sprite_index, 1, x, y, 2, 2, image_angle, image_blend, image_alpha);
else
    draw_sprite_ext(spr_dw_tv_funometer_hope, 1, x, y, 2, 2, image_angle, image_blend, image_alpha);
var intensity = scr_inverselerp(empty, full, functionalfun);
intensity = clamp01(intensity);
var amount = (sprite_height / 2) * (1 - functionalfun);
var maxamount = (sprite_height / 2) * full;
var _sine = sin(siner / 10);
var _siner = sin(siner / 15);
amount += (_sine * (intensity * 2));
if (amount > maxamount)
    amount += (amount - maxamount);
var meter_color = 255;
if (intensity <= 0.2)
    meter_color = merge_color(c_blue, c_red, remap_clamped(0.08, 0.2, 0, 1, intensity));
if (intensity >= 0.9)
    meter_color = merge_color(c_red, c_yellow, remap_clamped(0.9, 1, 0, 0.75, (intensity + (_siner * 0.05)) - 0.025));
draw_sprite_part_ext_rot(sprite_index, 2, 0, amount, sprite_width, sprite_height, x, y, image_xscale, image_yscale, image_angle, meter_color, image_alpha);
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
    shakecon = 0;
}
siner += sqr(intensity * 4);
