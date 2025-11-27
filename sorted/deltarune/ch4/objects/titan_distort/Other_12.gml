if (!active || timer <= 0 || strength == 0)
{
    draw_self();
    exit;
}
if (is_finished)
    exit;
if (!surface_exists(screen_surf))
    screen_surf = surface_create(camerawidth(), cameraheight());
strength = 30;
var _ease = scr_ease_in(timer / lifetime, 2);
var _strength = strength * _ease;
var _noisec = 0;
var _num = -1;
var _scany = 0;
surface_set_target(screen_surf);
draw_clear_alpha(c_black, 0);
titan = true;
var _sx = titan ? 0 : screenx();
_sx = titan ? 0 : screeny();
draw_sprite_ext(spr_titan_rumble_lineless, image_index, _sx, _sx, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
surface_reset_target();
if (scroll)
    _strength /= 3;
noise_sprite = spr_worley_noise_darker;
var perlin_texture_page = sprite_get_texture(noise_sprite, 0);
shader_set(channel_shader);
texture_set_stage(perlin_stage, perlin_texture_page);
shader_set_uniform_f(shader_get_uniform(channel_shader, "texel"), 1 / camerawidth(), 1 / cameraheight());
shader_set_uniform_f(shader_get_uniform(channel_shader, "strength"), _strength);
var _UVs = sprite_get_uvs(noise_sprite, 0);
var _tex = sprite_get_texture(noise_sprite, 0);
var _texel_x = texture_get_texel_width(_tex);
var _texel_y = texture_get_texel_height(_tex);
var _texel_hx = _texel_x * 0.5;
var _texel_hy = _texel_y * 0.5;
var _xs = image_xscale;
var _ys = image_yscale;
shader_set_uniform_f(shader_get_uniform(channel_shader, "fog_power"), 1);
shader_set_uniform_f(shader_get_uniform(channel_shader, "u_pixelSize"), _texel_x, _texel_y);
shader_set_uniform_f(shader_get_uniform(channel_shader, "u_UVs"), _UVs[0] + _texel_hx, _UVs[1] + _texel_hy);
shader_set_uniform_f(shader_get_uniform(channel_shader, "scanx"), floor(scan_x) + 0.5);
draw_surface(screen_surf, x - sprite_xoffset - _xs, y - sprite_yoffset);
draw_surface(screen_surf, (x - sprite_xoffset) + _xs, y - sprite_yoffset);
draw_surface(screen_surf, x - sprite_xoffset, y - sprite_yoffset - _ys);
draw_surface(screen_surf, x - sprite_xoffset, (y - sprite_yoffset) + _ys);
shader_set_uniform_f(shader_get_uniform(channel_shader, "fog_power"), 0);
draw_surface(screen_surf, x - sprite_xoffset, y - sprite_yoffset);
shader_reset();
if (infinite)
{
    if (stutter)
    {
        subtimer--;
        if (subtimer <= 0)
        {
            subtimer = 2;
            var _variation = (lifetime * scroll_speed * scroll_dir) / 2;
            var _scroll = 240 - (_variation / 2);
            scan_x = random_range(40, 200);
            timer = lifetime - random_range(0, 3);
            altspeed = random_range(1, 2);
        }
    }
    else
    {
        var _variation = (lifetime * scroll_speed * scroll_dir) / 2;
        var _scroll = 240 - (_variation / 2);
        scan_x += 8;
        scr_debug_print_persistent("scan_x", string(scan_x));
    }
}
scan_x = scr_wrap_ondy(scan_x + altspeed, 0, 479);
if (!infinite && timer > 0)
{
    timer--;
    if (timer <= 0)
    {
        if (!silent)
            snd_stop(static_noise);
        multa = random_range(10, 40);
        multb = random_range(5, 10);
        sprite_index = idle_sprite;
        image_speed = 0.5;
        active = false;
    }
}
siner++;
var _alpha = 0;
_alpha = _ease / 2;
