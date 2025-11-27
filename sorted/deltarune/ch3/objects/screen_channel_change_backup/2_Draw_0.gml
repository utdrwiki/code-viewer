if (scr_debug())
{
    if (shader_check == 1)
    {
    }
    if (keyboard_check_pressed(ord("B")) || gamepad_button_check_pressed(0, gp_face3))
    {
        active = true;
        timer = lifetime;
        if (audio_is_playing(static_noise))
            snd_stop(static_noise);
        static_noise = snd_play(snd_tv_static);
    }
    if (keyboard_check_pressed(ord("N")) || gamepad_button_check_pressed(0, gp_shoulderl))
    {
        infinite = !infinite;
        if (infinite)
            timer = lifetime;
        debug_print("infinite: " + string(infinite));
    }
    if (keyboard_check_pressed(ord("V")) || gamepad_button_check_pressed(0, gp_shoulderr))
    {
        scroll = !scroll;
        debug_print("scroll: " + string(scroll));
    }
}
if (scroll && !surface_exists(old_screen_surf))
    old_screen_surf = surface_create(640, 480);
if (!active || timer <= 0)
{
    if (scroll)
        surface_copy(old_screen_surf, 0, 0, application_surface);
    exit;
}
if (!surface_exists(screen_surf))
{
    if (safe_mode)
        screen_surf = surface_create(640, 480);
    else
        screen_surf = surface_create(640, 481);
}
surface_set_target(screen_surf);
draw_clear_alpha(c_gray, 0);
surface_reset_target();
var _ease = scr_ease_in(timer / lifetime, 2);
var _strength = strength * _ease;
var _noisec = 0;
var _num = -1;
var _scany = 0;
if (scroll && !safe_mode)
{
    var _yy = scroll ? scr_wrap_new((1 - (timer / lifetime)) * 500, 0, 480) : i;
    surface_copy(screen_surf, 0, -_yy, old_screen_surf);
    surface_copy_part(screen_surf, 0, 500 - _yy, application_surface, camerax(), cameray(), 640, 480);
}
else
{
    surface_copy_part(screen_surf, 0, 0, application_surface, camerax(), cameray(), 640, 480);
}
draw_sprite_part(noise_sprite, 0, 0, scan_x, 480, 1, 0, 480);
if (scroll)
    _strength /= 3;
if (safe_mode)
{
    var _xx = camerax();
    var _yy = cameray();
    var _px = 2;
    for (var _i = 0; _i < 480; _i += _px)
    {
        var _sin = (sin(((siner * 20) + _i) / multa) * _strength * 0.75) + ((cos(((siner * -20) + _i) / multb) * _strength) / 4);
        var _absin = ceil(abs(_sin));
        draw_surface_part(screen_surf, 0, _i, 640, _px, _xx + _sin, _yy + _i);
        if (_sin > 0)
            draw_surface_part(screen_surf, 640 - _absin, _i, _absin, _px, (_xx + _sin) - _absin, _yy + _i);
        else if (_sin < 0)
            draw_surface_part(screen_surf, 0, _i, _absin, _px, _xx + _sin + 640, _yy + _i);
    }
}
else
{
    shader_set(shd_channel_change);
    shader_set_uniform_f(shader_get_uniform(shd_channel_change, "texel"), 0.0015625, 0.002079002079002079);
    shader_set_uniform_f(shader_get_uniform(shd_channel_change, "strength"), _strength);
    draw_surface(screen_surf, camerax(), cameray());
    shader_reset();
}
scan_x = floor(scan_x);
scan_x = scr_wrap_new(scan_x + (scroll_speed * scroll_dir * (timer / lifetime) * 4), 0, 479);
if (!infinite && timer > 0)
{
    timer--;
    if (timer <= 0)
    {
        snd_stop(static_noise);
        multa = random_range(10, 40);
        multb = random_range(5, 10);
    }
}
siner++;
var _alpha = 0;
if (i_ex(obj_tenna_enemy))
{
    _alpha = _ease / 3;
    if (i_ex(obj_actor_tenna) && obj_actor_tenna.changechanneltimermax < 25)
        _alpha = lerp(0, _ease / 3, strength / 200);
}
else
{
    _alpha = _ease / 2;
}
draw_sprite_tiled_ext(spr_static_effect, timer / 2, 0, 0, 2, 2, c_white, _alpha);
