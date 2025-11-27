crttimer = (crttimer + 0.5) % 3;
var _vig = crt_glitch ? (0.2 + random(clamp(crt_glitch / 200, 0, 0.1))) : 0;
var _vigint = power(1.5, 1.5 - _vig) * 18;
var _chrom_scale = crt_glitch ? (irandom_range(-4, 4) * clamp(crt_glitch / 5, 1, 5)) : chromStrength;
if (_chrom_scale == 0)
    _chrom_scale = 1;
var _filteramount = 0.1 + min(crt_glitch / 100, 0.1);
shader_set(shd_crt);
shader_set_uniform_f(shader_get_uniform(shd_crt, "texel"), 1 / screenwidth, 1 / screenheight);
shader_set_uniform_f(shader_get_uniform(shd_crt, "vignette_scale"), _vig);
shader_set_uniform_f(shader_get_uniform(shd_crt, "vignette_intensity"), _vigint);
shader_set_uniform_f(shader_get_uniform(shd_crt, "chromatic_scale"), _chrom_scale);
shader_set_uniform_f(shader_get_uniform(shd_crt, "filter_amount"), _filteramount);
shader_set_uniform_f(shader_get_uniform(shd_crt, "time"), crttimer);
for (var i = 0; i < array_length_1d(screen_x_pos); i++)
{
    screen_x_pos[i] -= bg_speed_max;
    if (screen_x_pos[i] < -1456)
        screen_x_pos[i] += 2912;
}
screen_anim += screen_anim_speed;
if (!sword_route)
{
    draw_sprite_ext(spr_gameshow_screen_lava_01, screen_anim, screen_x_pos[0], cameray() + 20, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_gameshow_screen_lava_02, screen_anim, screen_x_pos[1], cameray() + 20, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_gameshow_screen_lava_03, screen_anim, screen_x_pos[2], cameray() + 20, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_gameshow_screen_lava_04, screen_anim, screen_x_pos[3], cameray() + 20, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_gameshow_screen_lava_05, screen_anim, screen_x_pos[4], cameray() + 20, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_gameshow_screen_lava_06, screen_anim, screen_x_pos[5], cameray() + 20, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_gameshow_screen_lava_07, screen_anim, screen_x_pos[6], cameray() + 20, 2, 2, 0, c_white, 1);
    tv_anim += tv_anim_speed;
    for (var i = 0; i < array_length_1d(tv_screens[0]); i++)
    {
        var offset = (i % 3) ? 0 : 0.5;
        offset = (i % 2) ? 1 : 0;
        draw_sprite_ext(spr_gameshow_screen_tv_tile, tv_anim + offset, screen_x_pos[0] + (tv_screens[0][i].x * 2), cameray() + 20 + (tv_screens[0][i].y * 2), 2, 2, 0, c_white, 1);
    }
    for (var i = 0; i < array_length_1d(tv_screens[1]); i++)
    {
        var offset = (i % 3) ? 0.5 : 0;
        offset = (i % 2) ? 1 : 0;
        draw_sprite_ext(spr_gameshow_screen_tv_tile, tv_anim + offset, screen_x_pos[1] + (tv_screens[1][i].x * 2), cameray() + 20 + (tv_screens[1][i].y * 2), 2, 2, 0, c_white, 1);
    }
    for (var i = 0; i < array_length_1d(tv_screens[2]); i++)
    {
        var offset = (i % 3) ? 0.5 : 0;
        offset = (i % 2) ? 1 : 0;
        draw_sprite_ext(spr_gameshow_screen_tv_tile, tv_anim + offset, screen_x_pos[2] + (tv_screens[2][i].x * 2), cameray() + 20 + (tv_screens[2][i].y * 2), 2, 2, 0, c_white, 1);
    }
    for (var i = 0; i < array_length_1d(tv_screens[3]); i++)
    {
        var offset = (i % 3) ? 0.5 : 0;
        offset = (i % 2) ? 1 : 0;
        draw_sprite_ext(spr_gameshow_screen_tv_tile, tv_anim + offset, screen_x_pos[3] + (tv_screens[3][i].x * 2), cameray() + 20 + (tv_screens[3][i].y * 2), 2, 2, 0, c_white, 1);
    }
    for (var i = 0; i < array_length_1d(tv_screens[4]); i++)
    {
        var offset = (i % 3) ? 0.5 : 0;
        offset = (i % 2) ? 1 : 0;
        draw_sprite_ext(spr_gameshow_screen_tv_tile, tv_anim + offset, screen_x_pos[6] + (tv_screens[4][i].x * 2), cameray() + 20 + (tv_screens[4][i].y * 2), 2, 2, 0, c_white, 1);
    }
}
if (runner_active)
    draw_sprite_ext(runner_sprite, runner_anim, camerax() + event_x_pos, cameray() + 74, 2, 2, 0, c_white, 1);
if (door_active)
{
    door_x_pos -= bg_speed_max;
    var tenna_pos = (camerax() + (view_wport[0] / 2)) - 20;
    var door_pos = camerax() + door_x_pos;
    if (!challenge_ready)
    {
        if (abs(tenna_pos - door_pos) <= 40)
        {
            challenge_ready = true;
            set_tenna(0);
        }
    }
    if (challenge_ready && challenge_activate)
    {
        challenge_activate_timer++;
        if (challenge_activate_timer == 1)
            set_tenna(1);
        if (abs(tenna_pos - door_pos) <= 20)
        {
            challenge_activate = false;
            challenge_start();
        }
    }
}
if (door_active)
    draw_sprite_ext(spr_gameshow_screen_door, 0, camerax() + door_x_pos, cameray() + 74, 2, 2, 0, c_white, 1);
if (heal_active)
{
    heal_x_pos -= bg_speed_max;
    var tenna_pos = (camerax() + (view_wport[0] / 2)) - 20;
    var heal_pos = camerax() + heal_x_pos;
    if (!heal_ready)
    {
        if (abs(tenna_pos - heal_pos) <= 40)
        {
            heal_ready = true;
            set_tenna(0);
        }
    }
    if (heal_ready && heal_activate)
    {
        heal_activate_timer++;
        if (heal_activate_timer == 1)
            set_tenna(1);
        if (abs(tenna_pos - heal_pos) <= 20)
            heal_active = false;
    }
    heal_anim += heal_anim_speed;
    draw_sprite_ext(spr_gameshow_screen_heal_spot, heal_anim, camerax() + heal_x_pos, cameray() + 74, 2, 2, 0, c_white, 1);
}
if (overlay_active)
{
    draw_set_color(c_black);
    ossafe_fill_rectangle(camerax(), cameray(), camerax() + view_wport[0], cameray() + view_hport[0], false);
    draw_set_color(c_white);
}
if (!sword_route)
{
    tenna_anim += tenna_anim_speed;
    if (tenna_active)
        draw_sprite_ext(tenna_sprite, tenna_anim, (camerax() + (view_wport[0] / 2)) - 20, cameray() + 74, 2, 2, 0, c_white, 1);
}
if (star_transition)
{
    star_rotation += 12;
    for (var i = 0; i < star_count; i++)
        draw_sprite_ext(spr_board_startransition, 3, round((star_x + lengthdir_x(star_distance, ((i * 360) / star_count) + star_rotation)) / 2) * 2, round((star_y + lengthdir_y(star_distance, ((i * 360) / star_count) + star_rotation)) / 2) * 2, 2, 2, 0, c_white, 1);
}
shader_reset();
draw_sprite_ext(spr_dw_gameshow_screen_vignette, 0, camerax() + 124, cameray() + 48, 1, 1, 0, c_white, 1);
