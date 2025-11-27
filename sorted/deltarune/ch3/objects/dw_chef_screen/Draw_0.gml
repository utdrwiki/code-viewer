if (con < 0)
    exit;
if (tutorial_active)
{
    gpu_set_blendenable(false);
    gpu_set_colorwriteenable(false, false, false, true);
    if (screen_scale != target_scale)
        screen_scale = scr_movetowards(screen_scale, target_scale, 0.4);
    draw_sprite_ext(spr_dw_chef_tv_frame_mask, 0, 314, 108, screen_scale, screen_scale, 0, c_white, 1);
    gpu_set_blendenable(true);
    gpu_set_colorwriteenable(true, true, true, true);
    gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
    gpu_set_alphatestenable(true);
}
else
{
    draw_sprite_ext(spr_dw_kitchen, 0, 0, 0, 2, 2, 0, c_white, 1);
}
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
star_anim += star_anim_speed;
bg_speed -= bg_speed_max;
bg_speed_y += bg_speed_y_max;
if (bg_speed < -640)
    bg_speed += 640;
if (bg_speed_y > -480)
    bg_speed_y -= 480;
scr_draw_sprite_tiled_area(spr_dw_tv_starbgtile, star_anim, camerax() + bg_speed, cameray() + bg_speed_y, camerax() + bg_speed, cameray() + bg_speed_y, camerax() + view_wport[0], cameray() + room_height, 2, 2, c_white, 1);
if (tutorial_active)
{
    gpu_set_alphatestenable(false);
    gpu_set_blendmode(bm_normal);
    tut_anim += tut_anim_speed;
    draw_sprite_ext(tut_sprite, tut_anim, tut_pos_x, tut_pos_y + tut_pos_y_offset, tut_xscale, tut_yscale, 0, c_white, 1);
    if (tut_xscale != tut_target_xscale && !tut_scaling_x)
    {
        scr_lerpvar("tut_xscale", tut_xscale, tut_target_xscale, 6, 1, tut_easetype);
        tut_scaling_x = true;
    }
    if (tut_xscale == tut_target_xscale && tut_scaling_x)
        tut_scaling_x = false;
    if (tut_yscale != tut_target_yscale && !tut_scaling_y)
    {
        scr_lerpvar("tut_yscale", tut_yscale, tut_target_yscale, 6, 1, tut_easetype);
        tut_scaling_y = true;
    }
    if (tut_yscale == tut_target_yscale && tut_scaling_y)
        tut_scaling_y = false;
}
if (logo_pos_y != target_logo_pos_y)
    logo_pos_y = scr_movetowards(logo_pos_y, target_logo_pos_y, 8);
food_anim += 0.1;
draw_sprite_ext(spr_gameshow_screen_chef_logo, food_anim, camerax() + 160 + 28, logo_pos_y + 12, 2, 2, 0, c_white, 0.5);
if (food_screen)
{
    draw_sprite_ext(spr_gameshow_screen_chef_bg, 0, camerax() + 108, cameray(), 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_gameshow_screen_chef_bg, 0, camerax() + 489, cameray(), 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_gameshow_screen_chef_fork, 0, camerax() + 450, cameray() + 120, 2, 2, 6 * sin(food_anim * 2), c_white, 1);
    draw_sprite_ext(spr_gameshow_screen_chef_spoon, 0, camerax() + 450, cameray() + 120, 2, 2, 6 * -sin(food_anim * 2), c_white, 1);
    draw_sprite_ext(spr_gameshow_screen_chef_fork, 0, camerax() + 320, cameray() + 120, 2, 2, 6 * sin(food_anim * 2), c_white, 1);
    draw_sprite_ext(spr_gameshow_screen_chef_spoon, 0, camerax() + 320, cameray() + 120, 2, 2, 6 * -sin(food_anim * 2), c_white, 1);
    draw_sprite_ext(spr_gameshow_screen_chef_fork, 0, camerax() + 190, cameray() + 120, 2, 2, 6 * sin(food_anim * 2), c_white, 1);
    draw_sprite_ext(spr_gameshow_screen_chef_spoon, 0, camerax() + 190, cameray() + 120, 2, 2, 6 * -sin(food_anim * 2), c_white, 1);
    draw_sprite_ext(spr_gameshow_screen_chef_runner, 0, camerax() + 120, cameray() + 140, 3, 2, 0, c_white, 1);
    food_timer++;
    for (var i = 0; i < 2; i++)
    {
        food_x_pos[i] -= 3;
        if (food_x_pos[i] <= (camerax() - 1420))
            food_x_pos[i] = view_wport[0] + 776;
        draw_sprite_ext(spr_gameshow_screen_chef_food, 0, food_x_pos[i], cameray() + 176, 2, 2, 0, c_white, 1);
    }
}
shader_reset();
if (!tutorial_active)
{
    draw_sprite_ext(spr_dw_kitchen_wall, 0, 0, 0, 2, 2, 0, c_white, 1);
    var i = 0;
    repeat (14)
    {
        draw_sprite_ext(spr_chefs_hudscreen4, 0, 98 + (i * 33), 30, 2, 2, 0, c_yellow, image_alpha);
        i++;
    }
}
