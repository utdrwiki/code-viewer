var _perlin_size = precise ? 480 : 240;
if (!surface_exists(noise_surf))
{
    noise_surf = surface_create(_perlin_size, _perlin_size);
    surface_set_target(noise_surf);
    draw_clear(c_black);
    if (precise)
        draw_sprite(spr_perlin_noise_480, 0, 0, 0);
    else
        draw_sprite(spr_perlin_noise_240, 0, 0, 0);
    surface_reset_target();
}
if (scr_debug())
{
    if (keyboard_check_pressed(ord("B")) || gamepad_button_check_pressed(0, gp_face3))
    {
        if (timer <= 0)
            active = true;
        else
            active = !active;
        if (active)
            timer = lifetime;
        if (!audio_is_playing(static_noise))
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
if (!surface_exists(old_screen_surf))
    old_screen_surf = surface_create(640, 480);
if (!active || timer <= 0)
    surface_copy(old_screen_surf, 0, 0, application_surface);
if (!active || timer <= 0)
    exit;
if (!surface_exists(screen_surf))
    screen_surf = surface_create(640, 480);
surface_set_target(screen_surf);
draw_clear_alpha(c_black, 1);
var _strength = strength * (timer / lifetime);
var _noisec = 0;
var _num = -1;
var _scany = 0;
if (!shader)
{
    for (i = 0; i < 480; i += 2)
    {
        _noisec = surface_getpixel(noise_surf, scroll ? 0 : scan_x, _scany);
        _num = colour_get_red(_noisec);
        var _val = (_num - 128) / 128;
        var _sine = _val * (scroll ? strength : _strength);
        var _yy = scroll ? scr_wrap_new(i - ((timer / lifetime) * 480), 0, 480) : i;
        surface_copy_part(screen_surf, _sine, i, application_surface, 0, _yy, 640, 2);
        if (_sine != 0 && wrap_around)
            surface_copy_part(screen_surf, _sine - (sign(_sine) * 640), i, application_surface, 0, _yy, 640, 2);
        _scany++;
    }
}
else if (scroll)
{
    var _yy = scroll ? scr_wrap_new((1 - (timer / lifetime)) * 500, 0, 480) : i;
    surface_copy(screen_surf, 0, -_yy, old_screen_surf);
    surface_copy(screen_surf, 0, 500 - _yy, application_surface);
}
else
{
    surface_copy(screen_surf, 0, 0, application_surface);
}
surface_reset_target();
if (shader)
{
    var sampler_index = shader_get_sampler_index(shd_channel_change, "noiseTexture");
    var noise_texture = surface_get_texture(noise_surf);
    if (scroll)
        _strength /= 3;
    shader_set(shd_channel_change);
    shader_set_uniform_f(shader_get_uniform(shd_channel_change, "texel"), 0.0015625, 0.0020833333333333333);
    texture_set_stage(sampler_index, noise_texture);
    shader_set_uniform_f(shader_get_uniform(shd_channel_change, "noiseX"), scan_x / _perlin_size);
    shader_set_uniform_f(shader_get_uniform(shd_channel_change, "strength"), _strength);
    draw_surface(screen_surf, camerax(), cameray());
    shader_reset();
}
else
{
    draw_surface(screen_surf, camerax(), cameray());
}
scan_x = floor(scan_x);
scan_x = scr_wrap_new(scan_x + (scroll_speed * scroll_dir * (timer / lifetime) * 4), 0, 239);
if (!infinite && timer > 0)
{
    timer--;
    if (timer <= 0)
        snd_stop(static_noise);
}
siner++;
