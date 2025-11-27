if (!i_ex(target) || !target.visible)
    exit;
image_blend = merge_color(c_black, c_white, image_alpha);
sprite_index = target.sprite_index;
image_index = target.image_index;
image_xscale = target.image_xscale;
image_yscale = target.image_yscale;
if (sprite_index == -4)
    exit;
var _xoff = xoff;
var _yoff = yoff;
if (!ignorepreset)
{
    if (name == "kris")
        _yoff = -6 - (2 * (stretch - 1));
    if (name == "ralsei")
        _yoff = -4 - (4 * (stretch - 1));
    if (name == "susie")
        _yoff = -2;
}
if (target.image_angle != 0 && stretch == 1)
{
    var _angle = target.image_angle % 360;
    var _ydist;
    if (_angle > 90 && _angle < 270)
        _ydist = lengthdir_y(sprite_yoffset, _angle + 90);
    else
        _ydist = lengthdir_y(sprite_height - sprite_yoffset, _angle - 90);
    var _xdist;
    if (_angle >= 0 && _angle <= 180)
        _xdist = lengthdir_y(sprite_xoffset, _angle + 180);
    else
        _xdist = lengthdir_y(sprite_width - sprite_xoffset, _angle);
    draw_sprite_ext(sprite_index, image_index, target.x + _xoff, target.y + _yoff + ((_ydist + _xdist) * 2), image_xscale, -image_yscale, -target.image_angle, c_black, image_alpha);
}
else
{
    draw_sprite_ext(sprite_index, image_index, target.x + _xoff, target.y + abs((sprite_height * (stretch + 1)) - (sprite_yoffset * (stretch + 1))) + _yoff, image_xscale, -image_yscale * stretch, -target.image_angle, c_black, image_alpha);
}
