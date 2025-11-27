with (obj_gameshow_swordroute)
    event_user(0);
if (scr_debug() && view_current == 0)
{
    if (keyboard_check_pressed(vk_backspace) || gamepad_button_check_pressed(0, gp_shoulderl))
        drawcrt = !drawcrt;
}
if (drawcrt)
{
    draw_set_alpha(1);
    var screenleft = 128;
    var screentop = i_ex(obj_gameshow_swordroute) ? 32 : 64;
    var screenwidth = 384;
    var screenheight = 256 + (i_ex(obj_gameshow_swordroute) * 32);
    if (room == room_dw_b3bstest)
    {
        screenleft = 128;
        screentop = 64;
        screenwidth = 384;
        screenheight = 160;
    }
    if (room == room_dw_b3bstest_big)
    {
        screenleft = 64;
        screentop = 64;
        screenwidth = 512;
        screenheight = 256;
    }
    with (obj_b3bs_console)
    {
        screenleft = gscreenx;
        screentop = gscreeny;
        screenwidth = gscreenw;
        screenheight = gscreenh;
    }
    if (screenheight != surface_get_height(crt_surface))
    {
        surface_free(crt_surface);
        surface_free(screen_surface);
    }
    if (!surface_exists(crt_surface))
        crt_surface = surface_create(screenwidth, screenheight);
    if (!surface_exists(screen_surface))
        screen_surface = surface_create(screenwidth, screenheight);
    surface_copy_part(screen_surface, 0, 0, application_surface, screenleft, screentop, screenwidth, screenheight);
    var drawgray = true;
    if (i_ex(obj_quizsequence) || i_ex(obj_board_writer))
        drawgray = false;
    var _photo_mode = 0;
    if (global.is_console)
        _photo_mode = 2;
    if (drawgray == true)
    {
        with (obj_board_grayregion)
        {
            surface_set_target(other.screen_surface);
            gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_one, bm_inv_src_alpha);
            if (_photo_mode == 2)
            {
                pal_swap_set_ext(1193, 1, other.swapper, false);
            }
            else
            {
                shader_set(shd_grayscalesand);
                shader_set_uniform_f(shader_get_uniform(shd_grayscalesand, "sand1"), 255, 236, 189);
                shader_set_uniform_f(shader_get_uniform(shd_grayscalesand, "sand2"), 255, 215, 140);
                shader_set_uniform_f(shader_get_uniform(shd_grayscalesand, "sand3"), 151, 183, 255);
                shader_set_uniform_f(shader_get_uniform(shd_grayscalesand, "sand4"), 177, 193, 227);
                shader_set_uniform_f(shader_get_uniform(shd_grayscalesand, "sandcol"), 0.82, 0.82, 0.82);
            }
            draw_surface_part(application_surface, x, y, sprite_width, sprite_height, x - screenleft, y - screentop);
            if (_photo_mode == 2)
                pal_swap_reset();
            else
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
    if (room == room_board_2)
    {
        if (i_ex(bosstree))
        {
            if (bosstree.active)
            {
                with (bosstree)
                {
                    bossblush = lerp(bossblush, 1.1, 0.25);
                    if (instance_exists(obj_board_grayregion) && !instance_exists(obj_board_playercamera))
                    {
                        if (place_meeting(x, y, obj_board_grayregion))
                            draw_sprite_ext(sprite_index, image_index, x, y, 2, 2, 0, image_blend, bossblush);
                    }
                    else
                    {
                        bossblush = 0;
                    }
                }
            }
        }
    }
    if (room == room_board_3)
    {
        if (i_ex(obj_b3cactusflirt) && i_ex(obj_board_grayregion))
        {
            if (obj_b3cactusflirt.active)
            {
                with (obj_b3cactusflirt)
                {
                    if (place_meeting(x, y, obj_board_grayregion))
                    {
                        blushamt = lerp(blushamt, 1, 0.2);
                        draw_sprite_ext(sprite_index, 1, x - 1, y, 2, 2, 0, c_white, blushamt / 5);
                        draw_sprite_ext(sprite_index, 1, x + 1, y, 2, 2, 0, c_white, blushamt / 5);
                        draw_sprite_ext(sprite_index, 1, x, y + 1, 2, 2, 0, c_white, blushamt / 5);
                        draw_sprite_ext(sprite_index, 1, x, y - 1, 2, 2, 0, c_white, blushamt / 5);
                        draw_sprite_ext(sprite_index, 1, x, y, 2, 2, 0, c_white, blushamt);
                    }
                }
            }
        }
    }
    if (crt_glitch > 0)
        crt_glitch--;
}
if (grid_reset == true)
{
    grid_reset = false;
    mp_grid_destroy(global.grid);
    grid_init = 0;
    global.cell_size = 32;
    global.grid_width = room_width / global.cell_size;
    global.grid_height = room_height / global.cell_size;
    global.grid = mp_grid_create(0, 0, global.grid_width, global.grid_height, global.cell_size, global.cell_size);
}
if (grid_init == 0)
{
    grid_init = 1;
    for (var xx = 0; xx < global.grid_width; xx++)
    {
        for (var yy = 0; yy < global.grid_height; yy++)
        {
            var inst = instance_place(xx * global.cell_size, yy * global.cell_size, obj_board_solid);
            if (inst == -4)
                inst = instance_place(xx * global.cell_size, yy * global.cell_size, obj_board_blockpath);
            if (inst != -4)
                mp_grid_add_cell(global.grid, xx, yy);
        }
    }
}
if (scr_debug())
{
    if (pathfind_debug)
    {
        draw_set_alpha(0.3);
        if (keyboard_check(ord("H")))
        {
            draw_set_alpha(1);
            ossafe_fill_rectangle(camerax(), cameray(), 640, 480, 0);
        }
        mp_grid_draw(global.grid);
        draw_set_alpha(1);
    }
}
