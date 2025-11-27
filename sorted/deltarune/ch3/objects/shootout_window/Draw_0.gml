var _current_train = -4;
if (obj_shootout_controller.shootout_type == 3)
    type = 4;
with (obj_shootout_carriage)
{
    if (sprite_index == spr_shootout_train_new)
    {
        var _xx = x + other.x_offset;
        if (_xx > -100 && _xx < 1700)
        {
            _current_train = id;
            break;
        }
    }
}
if (_current_train != -4)
{
    x = _current_train.x + x_offset;
    y = _current_train.y + y_offset;
    active = true;
}
else
{
    active = false;
    exit;
}
speedfactor = obj_shootout_controller.speedfactor;
if (!surface_exists(window_surface))
    window_surface = surface_create(sprite_width, sprite_height);
surface_set_target(window_surface);
draw_clear_alpha(#4C4539, 1);
switch (state)
{
    case "closed":
        hit = false;
        char_state = "none";
        show_hit_spike = false;
        image_index = 0;
        break;
    case "opening":
        state = "open";
        timer = 0;
        char_state = "init";
        break;
    case "open":
        if (show_hit_spike)
        {
            var _spk_scale = 2 + (sin(timer) * 0.5);
            var _spk_alpha = round((sin(timer) * 0.5) + 0.5);
            draw_sprite_ext(spr_shootout_window_hit, 0, sprite_xoffset, sprite_yoffset, _spk_scale, _spk_scale, 0, c_white, _spk_alpha);
        }
        event_user(type);
        break;
    case "closing":
        var _win_anim_duration = floor(win_anim_duration - (speedfactor * 2));
        if (timer >= _win_anim_duration)
            state = "closed";
        break;
}
gpu_set_blendenable(false);
gpu_set_colorwriteenable(0, 0, 0, 1);
draw_sprite_ext(spr_pixel_white, 0, 0, 0, 200, 200, 0, c_white, 0);
draw_sprite_ext(spr_shootout_window_mask_small, 0, 0, 0, 2, 2, 0, c_white, 1);
gpu_set_blendenable(true);
gpu_set_colorwriteenable(1, 1, 1, 1);
var windowangle = 0;
if (windowshaketimer > 0)
{
    if (windowshaketimer == 10)
        windowangle = 5;
    if (windowshaketimer == 9)
        windowangle = -5;
    if (windowshaketimer == 8)
        windowangle = 3;
    if (windowshaketimer == 7)
        windowangle = -3;
    if (windowshaketimer == 6)
        windowangle = 1;
    if (windowshaketimer == 5)
        windowangle = -1;
    if (windowshaketimer == 4)
        windowangle = 0;
    windowshaketimer--;
}
var _shakex = 0;
shaketimer--;
if (shaketimer == 9)
    _shakex = 6;
if (shaketimer == 8)
    _shakex = -5;
if (shaketimer == 7)
    _shakex = 4;
if (shaketimer == 6)
    _shakex = -3;
if (shaketimer == 5)
    _shakex = 2;
if (shaketimer == 4)
    _shakex = -1;
draw_sprite_ext(sprite_index, image_index, sprite_xoffset + _shakex, sprite_yoffset, 2, 2, windowangle, c_white, 1);
if (shaketimer > 7)
{
    d3d_set_fog(true, c_white, 0, 0);
    draw_sprite_ext(sprite_index, image_index, sprite_xoffset + _shakex, sprite_yoffset, 2, 2, windowangle, c_white, 1);
    d3d_set_fog(false, c_white, 0, 0);
}
surface_reset_target();
draw_surface(window_surface, x - sprite_xoffset, y - sprite_yoffset);
if (char_sprite == 1105 || char_sprite == 557 || char_sprite == 3425 || char_sprite == 532 || char_sprite == 4855)
{
    _x += (x - sprite_xoffset);
    _y += (y - sprite_yoffset);
    event_user(type);
    _x = 0;
    _y = 0;
}
if (drawinfront == true)
{
    _x = x - sprite_xoffset;
    _y = y - sprite_yoffset;
    if (char_state == "hit")
    {
        draw_sprite_ext(spr_shootout_tenna_hit, 0, (char_x - 5) + _x + sprite_xoffset, (char_y - 8) + _y + sprite_yoffset, scale, scale, 0, image_blend, 1);
    }
    else
    {
        var _col = 16777215;
        if (char_state == "idle" && timerc > 35)
            _col = merge_color(c_white, c_red, (timerc - 35) / 35);
        draw_sprite_ext(spr_shootout_tenna_shoot_pieces, 0, char_x + _x + sprite_xoffset, char_y + _y + sprite_yoffset, scale, scale, headangle, _col, 1);
        draw_sprite_ext(spr_shootout_tenna_shoot_pieces, 1, char_x + _x + sprite_xoffset, char_y + _y + sprite_yoffset, scale, scale, bodyangle, _col, 1);
        draw_sprite_ext(spr_shootout_tenna_shoot_pieces2, armindex, char_x + _x + (8 * scale) + sprite_xoffset, char_y + _y + (6 * scale) + sprite_yoffset, scale, scale, armangle, _col, 1);
    }
    _x = 0;
    _y = 0;
}
timer++;
