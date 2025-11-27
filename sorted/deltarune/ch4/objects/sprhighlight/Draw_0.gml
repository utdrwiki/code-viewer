if (!i_ex(target))
    exit;
if (!target.visible)
    exit;
if (abs(target.sprite_width) < 1 || abs(target.sprite_height) < 1)
    exit;
x = target.x - target.sprite_xoffset;
y = target.y - target.sprite_yoffset;
sprite_index = target.sprite_index;
image_index = target.image_index;
image_angle = target.image_angle;
image_xscale = target.image_xscale;
image_yscale = target.image_yscale;
var _target_width = abs(target.sprite_width);
var _target_height = abs(target.sprite_height);
var _xsign = sign(target.image_xscale);
var _ysign = sign(target.image_yscale);
var _xscale = abs(fixed_size ? 1 : image_xscale);
var _yscale = abs(fixed_size ? 1 : image_yscale);
var _xoff = xoffset * max(min_size, _xscale) * strength;
var _yoff = yoffset * max(min_size, _yscale) * strength;
if (!outline_only)
{
    with (target)
        draw_self();
}
if (darkness > 0)
{
    d3d_set_fog(true, merge_color(c_white, darkness_tint, image_alpha), 0, 1);
    gpu_set_alphatestenable(true);
    gpu_set_blendmode_ext(bm_zero, bm_src_color);
    if (target)
        draw_sprite_ext(sprite_index, image_index, x + sprite_xoffset, y + sprite_yoffset, image_xscale, image_yscale, image_angle, c_white, 1);
    gpu_set_blendmode(bm_normal);
    gpu_set_alphatestenable(false);
}
if (!surface_exists(sprite_surf))
    sprite_surf = surface_create(_target_width, _target_height);
if (width != _target_width || height != _target_height)
{
    width = _target_width;
    height = _target_height;
    surface_resize(sprite_surf, width, height);
}
surface_set_target(sprite_surf);
draw_clear_alpha(c_black, 0);
d3d_set_fog(true, image_blend, 0, 1);
draw_sprite_ext(sprite_index, image_index, target.sprite_xoffset * _xsign, target.sprite_yoffset * _ysign, abs(image_xscale), abs(image_yscale), 0, c_black, 1);
d3d_set_fog(false, c_black, 0, 1);
gpu_set_blendmode(bm_subtract);
if (image_angle == 0)
{
    draw_sprite_ext(sprite_index, image_index, (target.sprite_xoffset + _xoff) * _xsign, (target.sprite_yoffset + _yoff) * _ysign, abs(image_xscale), abs(image_yscale), 0, c_black, 1);
}
else
{
    var _offset_dir = point_direction(0, 0, _xoff, _yoff);
    var _offset_len = point_distance(0, 0, _xoff, _yoff);
    var _xdir = _xsign * (target.sprite_xoffset + lengthdir_x(_offset_len, _offset_dir - image_angle));
    var _ydir = _ysign * (target.sprite_yoffset + lengthdir_y(_offset_len, _offset_dir - image_angle));
    draw_sprite_ext(sprite_index, image_index, _xdir, _ydir, abs(image_xscale), abs(image_yscale), 0, c_black, 1);
}
gpu_set_blendmode(bm_normal);
surface_reset_target();
if (image_angle != 0)
{
    var _newx = scr_orbitx(target.x, target.y, x, y, image_angle);
    var _newy = scr_orbity(target.x, target.y, x, y, image_angle);
    draw_surface_ext(sprite_surf, _newx, _newy, _xsign, _ysign, image_angle, c_white, image_alpha);
}
else
{
    draw_surface_ext(sprite_surf, x, y, _xsign, _ysign, image_angle, c_white, image_alpha);
}
