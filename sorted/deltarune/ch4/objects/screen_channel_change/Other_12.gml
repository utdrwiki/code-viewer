if (is_finished)
    exit;
if (scroll && !surface_exists(old_screen_surf))
    old_screen_surf = surface_create(camerawidth(), cameraheight());
if (!active || timer <= 0 || strength == 0)
{
    if (scroll)
    {
        surface_set_target(old_screen_surf);
        draw_surface(application_surface, 0, 0);
        surface_reset_target();
    }
    exit;
}
if (!surface_exists(screen_surf))
    screen_surf = surface_create(camerawidth(), cameraheight());
var _ease = scr_ease_in(timer / lifetime, 2);
var _strength = strength * _ease;
var _noisec = 0;
var _num = -1;
var _scany = 0;
if (scroll)
{
    var _yy = scroll ? scr_wrap_ondy(scr_ease_out(1 - (timer / lifetime), 4) * 480, 0, 480) : i;
    surface_set_target(screen_surf);
    draw_surface_part(old_screen_surf, 0, _yy, camerawidth(), cameraheight() - _yy, 0, 0);
    draw_surface_part(application_surface, 0, 0, camerawidth(), _yy, 0, 480 - _yy);
    surface_reset_target();
}
else
{
    surface_set_target(screen_surf);
    draw_surface(application_surface, 0, 0);
    surface_reset_target();
}
if (scroll)
    _strength /= 3;
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
shader_set_uniform_f(shader_get_uniform(channel_shader, "u_pixelSize"), _texel_x, _texel_y);
shader_set_uniform_f(shader_get_uniform(channel_shader, "u_UVs"), _UVs[0] + _texel_hx, _UVs[1] + _texel_hy);
shader_set_uniform_f(shader_get_uniform(channel_shader, "scanx"), floor(scan_x) + 0.5);
draw_surface(screen_surf, camerax(), cameray());
shader_reset();
scan_x = scr_wrap_ondy(scan_x + (scroll_speed * scroll_dir * (timer / lifetime) * 2), 0, 479);
if (!infinite && timer > 0)
{
    timer--;
    if (timer <= 0)
    {
        if (!silent)
            snd_stop(static_noise);
        multa = random_range(10, 40);
        multb = random_range(5, 10);
    }
}
siner++;
var _alpha = 0;
if (i_ex(obj_tenna_enemy))
{
    if (lightemupcon == 1)
    {
        lightemuptimer++;
        if (lightemuptimer == 3)
            snd_play(snd_tv_static);
        if (lightemuptimer < 3)
            _alpha2 = lerp(0, 1, lightemuptimer / 3);
        if (lightemuptimer >= 3 && lightemuptimer < 60)
            _alpha2 = 1;
        if (lightemuptimer >= 60)
            _alpha2 = lerp(1, 0, (lightemuptimer - 60) / 10);
        if (lightemuptimer == 65)
            snd_stop(snd_tv_static);
        if (lightemuptimer == 70)
        {
            lightemupcon = 0;
            minigametext = instance_create_depth(x, y - 150, depth + 10, obj_tenna_enemy_minigametext);
            minigametext.mystring = "";
            minigametext.lightemup = 1;
            lifetime = 7;
        }
        draw_sprite_tiled_ext(spr_static_effect, timer, camerax(), cameray(), 2, 2, c_white, _alpha2);
    }
    else
    {
        _alpha = _ease / 3;
        if (i_ex(obj_actor_tenna) && obj_actor_tenna.changechanneltimermax < 25)
            _alpha = lerp(0, _ease / 3, strength / 200);
    }
}
else
{
    _alpha = _ease / 2;
}
if (infinite)
    draw_sprite_tiled_ext(spr_static_effect, scan_x, 0, 0, 2, 2, c_white, _alpha);
else
    draw_sprite_tiled_ext(spr_static_effect, timer / 2, 0, 0, 2, 2, c_white, _alpha);
