var _size = size;
var _sizex = 0;
var _sizey = 0;
if (size_offset < 1)
{
    var _sizeoff = lerp(size / 2, 0, scr_ease_out(size_offset, -1));
    _size += _sizeoff;
    _sizex = sin(size_siner / 10) * 0.1;
    _sizey = cos(size_siner / 10) * 0.1;
    size_offset += 0.2;
    size_siner++;
}
if (end_con == 3)
{
    image_xscale = 1;
    image_yscale = 1;
}
else if (end_con >= 4)
{
    image_xscale = (timer / 20) + 1;
    image_yscale = (timer / 20) + 1;
}
else
{
    image_xscale = lerp(1, 0.5, _size) + _sizex;
    image_yscale = lerp(1, 0.5, _size) + _sizey;
}
funny = false;
shakex = 0;
shakey = 0;
var _flicker = ticks < 0 && (abs(ticks) % 4) < 2;
if (_flicker)
    image_blend = c_gray;
else
    image_blend = c_white;
if (scare_con >= 1)
{
    draw_sprite_ext(head_sprite, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (scare_con >= 2 && face_timer < 40)
        face_timer++;
    var _spimmer = scr_ease_out(face_timer / 40, -2) * 180;
    draw_sprite_ext(mouth_sprite, 0, x, y + 20, image_xscale, image_yscale, image_angle + _spimmer, image_blend, image_alpha);
}
else if (ticks > 0 || scare_con == -2)
{
    var _sp = shake_power;
    if (end_con == 3)
        _sp = lerp(4, 0, clamp01(timer / 20));
    shakex = irandom_range(-_sp, _sp);
    shakey = irandom_range(-_sp, _sp);
    if (mercy > 70 && sprite_index == spr_jackolantern_cry)
    {
        funny = true;
        var _power = remap_clamped(70, 100, 0.1, 1, mercy);
        if (end_con == 1 || end_con == 2)
            _power = 0.5;
        var _wobble = random_range(-10, 10);
        var _skew = random_range(-20, 20);
        var _ap = audio_sound_get_track_position(screamsound);
        if ((_ap > 0.8 && _ap < 1.3) || (_ap > 9.6 && _ap < 10))
        {
            _wobble = random_range(-12, -18) * _power;
            _skew = (clamp(x - (obj_heart.x + 10), -10, 10) + random_range(-5, 5)) * _power;
        }
        else if (_ap < 0.1 || (_ap > 0.4 && _ap < 0.6) || (_ap > 0.75 && _ap < 0.8) || (_ap > 7.8 && _ap < 7.95) || (_ap > 8.55 && _ap < 8.75) || (_ap > 9 && _ap < 9.15))
        {
            _wobble = random_range(-10, -14) * _power;
            _skew = (clamp(x - (obj_heart.x + 10), -10, 10) + random_range(-5, 5)) * _power;
        }
        else if (_ap < 1.67 || _ap > 6)
        {
            _wobble = random_range(12, 18) * _power;
            _skew = (clamp(x - (obj_heart.x + 10), -10, 10) + random_range(-5, 5)) * _power;
        }
        var _sw = (sprite_width / 2) - _wobble;
        var _sh = (sprite_height / 2) + _wobble;
        var _sx = x + shakex;
        var _sy = y + shakey;
        sx[0] = (_sx - _sw) + _skew;
        sx[1] = _sx + _sw + _skew;
        sx[2] = (_sx + _sw) - _skew;
        sx[3] = _sx - _sw - _skew;
        sy[0] = _sy - _sh;
        sy[1] = _sy - _sh;
        sy[2] = _sy + _sh;
        sy[3] = _sy + _sh;
        draw_sprite_pos(sprite_index, image_index, sx[0], sy[0], sx[1], sy[1], sx[2], sy[2], sx[3], sy[3], 1);
    }
    else
    {
        draw_self_offset(shakex, shakey);
    }
}
else
{
    draw_self_offset(shakex, shakey);
}
if (total_ticks > 0 || screamcon == 2)
{
    brightness = total_ticks / 70;
    if (screamcon == 2)
        brightness += (0.35 + (sin(siner / 12) * 0.15));
    brightness *= 0.2;
    gpu_set_fog(true, c_white, 0, 1000);
    if (funny)
        draw_sprite_pos(sprite_index, image_index, sx[0], sy[0], sx[1], sy[1], sx[2], sy[2], sx[3], sy[3], brightness);
}
gpu_set_fog(false, c_white, 0, 1000);
if (fleetype == 2)
{
    draw_sprite_ext(spr_pxwhite, 0, obj_growtangle.x - 400, obj_growtangle.y - 400, 260, 800, 0, c_black, 1);
    draw_sprite_ext(spr_pxwhite, 0, obj_growtangle.x + 160, obj_growtangle.y - 400, 320, 800, 0, c_black, 1);
    draw_sprite_ext(spr_pxwhite, 0, obj_growtangle.x - 400, obj_growtangle.y - 400, 800, 280, 0, c_black, 1);
    draw_sprite_ext(spr_pxwhite, 0, obj_growtangle.x + 400, obj_growtangle.y + 120, 800, 280, 0, c_black, 1);
}
