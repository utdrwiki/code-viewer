var go = false;
if (keyboard_check_pressed(vk_numpad5))
{
    type = 0;
    go = true;
}
else if (keyboard_check_pressed(vk_numpad6))
{
    type = 1;
    go = true;
}
if (go)
{
    active = true;
    if (type == 1)
        con = 1;
    else
        con = 0;
    con_timer = 0;
    deltatime = 1;
    timer = 0;
    susie_con = 0;
    susie_timer = 0;
}
if (type == 1)
{
    con_timer++;
    var _inc = false;
    if (con == 0 && con_timer >= 15)
    {
        _inc = true;
    }
    else if (con == 1 && con_timer >= 3)
    {
        deltatime = 0.25;
        snd_stop(motor_swing_down);
        snd_play_pitch(motor_swing_down, 1.4);
        _inc = true;
    }
    else if (con == 2 && con_timer >= 7)
    {
        deltatime = 0.15;
        _inc = true;
    }
    else if (con == 3 && con_timer >= 45)
    {
        snd_play(snd_heavyswing);
        _inc = true;
    }
    else if (con == 4 && con_timer >= 10)
    {
        wind_sfx = snd_play(snd_strongwind_loop);
        snd_volume(wind_sfx, 0, 60);
        deltatime = 3;
        _inc = true;
    }
    if (_inc)
    {
        con++;
        con_timer = 0;
    }
}
var _ripplecount = ripplecount;
if (type == 1)
    _ripplecount += 4;
else
    _ripplecount += 2;
if (active)
{
    draw_set_color(color);
    var _itv = 0;
    var _max_radius = (type == 1) ? 500 : 350;
    var _life = 40;
    var _pow = 2;
    var _thickness = (type == 1) ? 1 : 1;
    var _ringcount = 0;
    for (var i = 0; i < _ripplecount; i++)
    {
        if (timer < (i * _itv))
            break;
        _ringcount++;
        var _radius = scr_ease_out(clamp01(inverselerp(i * _itv, (i * _itv) + _life + (i * 30), timer)), 4) * _max_radius;
        var _col = merge_color(color, c_black, clamp01(((_radius / _max_radius) * 8) - 7));
        draw_set_color(_col);
        var _oradius = _radius;
        d_circle(x, y, _radius, false);
        if ((timer - 2) < (i * _itv))
            break;
        draw_set_color(c_black);
        if (type == 0)
            _radius = _radius - 6;
        else
            _radius = min(scr_ease_out(clamp01(inverselerp(i * _itv, (i * _itv) + _life + (i * 30), timer - _thickness)), 4) * (_max_radius - 1), _radius - 6);
        if (type == 2)
            d_circle(x + (_radius / 20), y, _oradius - _delay, false);
        else
            d_circle(x, y, _radius, false);
    }
    timer += deltatime;
    if ((timer - _thickness) >= ((_itv * _ripplecount) + (_life * _ripplecount)))
    {
        timer = 0;
        active = false;
    }
}
if (timer > 0 || con > 2)
{
    var _xx = x - 50;
    var _yy = y - 60;
    var _image = 0;
    var _shadow_col = 0;
    if (con < 2)
    {
        draw_sprite_ext(sprite[con], _image, _xx, _yy, 2, 2, image_angle, c_black, 1);
        dust_timer = 0;
    }
    if (con == 2 || (con == 3 && dust_timer < 7))
    {
        draw_sprite_ext(spr_gerson_shadow_leap, dust_timer, _xx, _yy, 2, 2, image_angle, _shadow_col, 1);
        if (dust_timer < 2)
            dust_timer++;
        else
            dust_timer += 0.2;
    }
    if (con == 3)
    {
        var _move = con_timer / 40;
        _image = (con_timer < 20) ? 1 : 0;
        if (con_timer == 30)
            susie_con = 1;
        if (con_timer == 43)
            susie_con = 2;
        draw_sprite_ext(spr_gerson_swing, _image, _xx - 200 - (_move * 8), _yy - 20 - (_move * 6), 2, 2, image_angle, _shadow_col, 1);
    }
    else if (con >= 4)
    {
        var _move = con_timer / 60;
        if (con == 5)
            _move = con_timer / 30;
        _image = (con == 5) ? 6 : min(con_timer + 4, 6);
        draw_sprite_ext(spr_gerson_swing, _image, _xx - 208 - (_move * 8), (_yy - 26) + (_move * 6), 2, 2, image_angle, _shadow_col, 1);
    }
    if (con < 2)
    {
        var _alpha = 1;
        if (timer <= 4)
            _alpha = timer / 4;
        else
            _alpha = clamp01(inverselerp(60, 10, timer));
        draw_sprite_ext(spr_gerson_battle_overworld_underlight, 0, x - 50, y - 60, 2, 2, image_angle, color, _alpha);
    }
    var _susx = x - 300;
    var _susy = y - 60;
    if (susie_con == 0)
        draw_sprite_ext(spr_susie_right_dw, 0, _susx, _susy, 2, 2, 0, c_black, 1);
    if (susie_con == 1)
        draw_sprite_ext(spr_susie_actready, 0, _susx, _susy, 2, 2, 0, c_black, 1);
    if (susie_con == 2)
    {
        if (susie_timer < 30)
            susie_timer++;
        _susx -= (scr_ease_out(susie_timer / 30, 4) * 50);
        draw_sprite_ext(spr_susie_shock_r, 0, _susx, _susy, 2, 2, 0, c_black, 1);
    }
}
draw_set_blend_mode(bm_normal);
draw_set_alpha(1);
draw_set_color(c_white);
