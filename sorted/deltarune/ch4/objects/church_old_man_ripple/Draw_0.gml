if (i_ex(obj_encounterbasic) || i_ex(obj_battlecontroller))
    exit;
var _xx = x - 50;
if (variant == 1)
    _xx = camerax() + 456;
if ((timer > 0 || con > 2) && type < 2)
{
    var _yy = y - 70;
    if (type == 0)
        _xx += distance;
    var _image = 0;
    var _shadow_col = 0;
    if (con < 2)
    {
        draw_sprite_ext(sprite[type], image_index, _xx, _yy, 2, 2, image_angle, c_black, 1);
        dust_timer = 0;
    }
    if (con == 2)
    {
        var _leaplerp = scr_ease_out(con_timer / leap_time, 4);
        var _leapy = lerp(_yy, _yy - 40, _leaplerp);
        var _leapx = lerp(_xx, (susie_x + 100) - 50, _leaplerp);
        draw_sprite_ext(spr_gerson_swing, 1, _leapx, _leapy, 2, 2, image_angle, _shadow_col, 1);
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
        if (version == 1 && version1timer == 0)
            version1timer++;
        var _duration = (variant == 0) ? 40 : 30;
        var _move = con_timer / 40;
        _image = (con_timer < (_duration - 20)) ? 1 : 0;
        if (con_timer == (_duration - 10))
            susie_con = 1;
        draw_sprite_ext(spr_gerson_swing, _image, (susie_x + 100) - 50 - (_move * 8), _yy - 40 - (_move * 6), 2, 2, image_angle, _shadow_col, 1);
    }
    else if (con >= 4 && con < 10)
    {
        var _duration = (variant == 0) ? 60 : 30;
        var _move = con_timer / 60;
        if (con == 5)
            _move = con_timer / 30;
        _image = (con == 5) ? 6 : min(con_timer + 4, 6);
        draw_sprite_ext(spr_gerson_swing, _image, (susie_x + 92) - 50 - (_move * 8), (_yy - 46) + (_move * 6), 2, 2, image_angle, _shadow_col, 1);
    }
    else if (con == 10)
    {
        var _xgerson = 0;
        extratimer++;
        if ((extratimer % 2) == 0)
            _xgerson = -2;
        else
            _xgerson = 2;
        draw_sprite_ext(spr_gerson_hurt2, 1, susie_x + _xgerson + 92, _yy + 4, 2, 2, image_angle, _shadow_col, 1);
        if (extratimer < 3)
        {
            d3d_set_fog(true, c_white, 0, 1);
            draw_sprite_ext(spr_gerson_hurt2, 1, susie_x + _xgerson + 92, _yy + 4, 2, 2, image_angle, c_white, 1);
            d3d_set_fog(false, c_black, 0, 0);
        }
        if (extratimer == 10)
        {
            con = 11;
            extratimer = 0;
        }
    }
    else if (con == 11)
    {
        if (extratimer < 8)
            extratimer++;
        var _xgerson = lerp(0, 100, extratimer / 8);
        draw_sprite_ext(spr_gerson_hurt2, 1, susie_x + _xgerson + 92, _yy + 4, 2, 2, image_angle, _shadow_col, 1);
    }
    if (con < 2)
    {
        var _alpha = 1;
        if (timer <= 12)
            _alpha = scr_ease_out(timer / 12, 5);
        else
            _alpha = clamp01(inverselerp(30, 15, timer));
        var _mult = 1 - (distance / 120);
        if (_alpha > 0)
            scr_debug_print_persistent("alpha", string(_mult));
        else
            scr_debug_delete_persistent("alpha");
        var _col = merge_color(c_black, color, _alpha);
        if (timer <= 12)
            shader_set(shd_linear_alpha);
        var _underlight = 2972;
        var _stindex = step_index;
        var _lightx = step_x - 50;
        if (con == 1)
        {
            _underlight = 1844;
            _stindex = image_index;
            step_index = image_index;
            _lightx = _xx;
        }
        draw_sprite_ext(_underlight, step_index, _lightx, _yy, 2, 2, image_angle, color, _alpha * _mult);
        if (timer <= 12)
            shader_reset();
    }
    var _susx = susie_x;
    var _susy = y - 80;
    if (susie_con == 0)
        draw_sprite_ext(susie_sprite, 0, _susx, _susy, 2, 2, 0, c_black, 1);
    if (susie_con == 1)
    {
        if (variant == 1)
            draw_sprite_ext(spr_susieb_victory, 2, _susx, _susy, 2, 2, 0, c_black, 1);
        else
            draw_sprite_ext(spr_susie_surprised_step_back_look_up, 1, _susx, _susy, 2, 2, 0, c_black, 1);
    }
    if (susie_con == 2)
    {
        if (susie_timer < 30)
            susie_timer++;
        _susx -= (scr_ease_out(susie_timer / 30, 4) * 50);
        if (variant == 1 && susie_timer < 10)
        {
            draw_sprite_ext(spr_susie_hurt_lookright, 0, _susx, _susy, 2, 2, 0, c_black, 1);
        }
        else if (variant == 1)
        {
            var _shake = remap_clamped(10, 24, 4, 0, susie_timer) * (((susie_timer % 2) == 0) ? -1 : 1);
            draw_sprite_ext(spr_susieb_defeat, 0, _susx + _shake, _susy, 2, 2, 0, c_black, 1);
        }
        else
        {
            draw_sprite_ext(spr_susie_shock_r, 0, _susx, _susy, 2, 2, 0, c_black, 1);
        }
    }
    if (susie_con == 3)
        draw_sprite_ext(spr_susieb_defeat, 0, _susx, _susy, 2, 2, 0, c_black, 1);
}
else
{
    if (type >= 3)
        susie_x = camerax() + 50;
    var _susy = y - 80;
    if (type >= 5)
    {
        susie_x += 10;
        if (punch > 0 || timer > 15)
            draw_sprite_ext(spr_susie_hurt_lookright, 0, susie_x + 80, _susy - 4, 2, 2, 0, c_black, 1);
        else
            draw_sprite_ext(spr_susie_idle, timer / 3, susie_x + 80, _susy - 4, 2, 2, 0, c_black, 1);
        if (type == 6)
            draw_sprite_ext(spr_krisb_victory, clamp(timer / 4, 0, 8), susie_x, _susy + 10, 2, 2, 0, c_black, 1);
        else
            draw_sprite_ext(spr_krisb_idle, (timer / 3) + punch, susie_x, _susy + 10, 2, 2, 0, c_black, 1);
    }
    else
    {
        draw_sprite_ext(susie_sprite, 0, susie_x, _susy, 2, 2, 0, c_black, 1);
    }
}
var _gersx = x + 50;
if (type == 3)
{
    _gersx = x + 36;
    var _col = 16777215;
    if (timer == 0)
        _col = 8421504;
    if (timer >= 5)
        _col = merge_color(c_white, c_black, clamp01((timer - 5) / 15));
    draw_sprite_ext(spr_old_man_clash_black, timer, _gersx, y - 6, 2, 2, 0, c_black, 1);
}
if (type == 4)
{
    _gersx = x + 36;
    var _gerse = clamp01(scr_ease_out(timer / 50, 2));
    spinner += min(1, lerp(2, 0, _gerse));
    if (timer > 50)
        _gerse = 50;
    else
        _gerse *= 50;
    draw_sprite_ext(spr_gerson_spin, scr_loop(spinner, 12), _gersx + 10 + (_gerse * 6), y, 2, 2, 0, c_black, 1);
    shader_set(shd_linear_alpha);
    draw_sprite_ext(spr_gerson_spin_outline, scr_loop(spinner, 12), _gersx + 10 + (_gerse * 6), y, 2, 2, 0, c_aqua, 1 - clamp01((timer - 5) / 15));
    shader_reset();
}
if (type == 2)
    draw_sprite_ext(spr_gerson_laugh_scene, 1 + (timer / 4), x - 50, y - 64, 2, 2, image_angle, c_black, 1);
if (type == 5)
{
    var _frame = 0;
    var _crumbler = 4408;
    if (punch == 0)
        _frame = min(timer / 3, 6);
    else
        _frame = min((timer + 6) / 3, 17);
    var _col = merge_color(c_white, c_black, clamp01(timer / 8));
    var _shake = remap_clamped(0, 4, 4, 0, timer) * (((timer % 2) == 0) ? -1 : 1);
    draw_sprite_ext(_crumbler, _frame, (x - 80) + _shake, y - 114, 2, 2, 0, _col, 1);
}
if (type == 6)
{
}
if (shiner >= 0)
{
    if (variant == 2)
        _xx = x + 60;
    if (shiner == 0)
        snd_play(snd_eye_telegraph, 1, 1);
    if (shiner >= 8)
        draw_sprite_ext(spr_eye_shine, (shiner - 8) / 2, _xx + 14, (y - 70) + 20, 2, 2, 0, c_white, 1);
    shiner++;
    if (shiner > 16)
        shiner = -1;
}
draw_set_blend_mode(bm_normal);
draw_set_alpha(1);
draw_set_color(c_white);
if (scr_debug() && debug_marker)
    draw_sprite_ext(spr_crosshair_7x7, 0, x, y, 1, 1, 0, c_red, 1);
