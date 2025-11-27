if (drawcrt && view_current == myview)
{
    if (scr_debug())
    {
        if (keyboard_check_pressed(vk_backspace) || gamepad_button_check_pressed(0, gp_shoulderl))
        {
        }
    }
    draw_set_alpha(1);
    if (screenheight != surface_get_height(crt_surface))
    {
        surface_free(crt_surface);
        surface_free(screen_surface);
    }
    if (!surface_exists(crt_surface))
        crt_surface = surface_create(screenwidth, screenheight);
    if (!surface_exists(screen_surface))
        screen_surface = surface_create(screenwidth, screenheight);
    surface_copy_part(screen_surface, 0, 0, application_surface, x - camerax(), y - cameray(), screenwidth, screenheight);
    var drawgray = true;
    if (i_ex(obj_quizsequence) || i_ex(obj_board_writer))
        drawgray = false;
    if (drawgray == true)
    {
        with (obj_board_grayregion)
        {
            surface_set_target(other.screen_surface);
            gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_one, bm_inv_src_alpha);
            shader_set(shd_grayscalesand);
            shader_set_uniform_f(shader_get_uniform(shd_grayscalesand, "sand1"), 255, 236, 189);
            shader_set_uniform_f(shader_get_uniform(shd_grayscalesand, "sand2"), 255, 215, 140);
            shader_set_uniform_f(shader_get_uniform(shd_grayscalesand, "sand3"), 151, 183, 255);
            shader_set_uniform_f(shader_get_uniform(shd_grayscalesand, "sand4"), 177, 193, 227);
            shader_set_uniform_f(shader_get_uniform(shd_grayscalesand, "sandcol"), 0.82, 0.82, 0.82);
            draw_surface_part(application_surface, x - camerax(), y - cameray(), sprite_width, sprite_height, x - other.screenleft, y - other.screentop);
            shader_reset();
            gpu_set_blendmode(bm_normal);
            surface_reset_target();
        }
    }
    crttimer = (crttimer + 0.5) % 3;
    var _vig = crt_glitch ? (0.2 + random(clamp(crt_glitch / 200, 0, 0.1))) : 0.2;
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
    var _dx = crt_glitch ? (random_range(-1, 1) * clamp(crt_glitch / crt_glitchstrength, 0, 3)) : 0;
    var _dy = crt_glitch ? (random_range(-1, 1) * clamp(crt_glitch / crt_glitchstrength, 0, 3)) : 0;
    surface_set_target(crt_surface);
    draw_clear_alpha(c_black, 1);
    draw_surface_stretched(screen_surface, min(0, _dx), min(0, _dy), screenwidth + abs(_dx), screenheight + abs(_dy));
    surface_reset_target();
    shader_reset();
    draw_surface(crt_surface, screenleft, screentop);
    crt_glitch--;
    if (crt_glitch < 0)
        crt_glitch = 0;
}
